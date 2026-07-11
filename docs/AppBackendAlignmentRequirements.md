# App Backend Alignment Requirements

Dokumen ini menyatukan kebutuhan Flutter app dan FastAPI backend agar kedua sisi bergerak ke target yang sama.

## 1. Keputusan Utama

- Backend Swagger saat ini menjadi baseline kontrak API.
- App mengikuti kontrak backend dengan DTO/mapper, bukan memaksa domain model app sama persis dengan JSON backend.
- Backend tidak perlu mundur ke kontrak mock app lama.
- Backend boleh menyimpan field ekstra selama response tetap stabil, camelCase, dan backwards-compatible.
- Mobile app tidak menjalankan ASR atau inference berat. App hanya login, mengambil data, rekam, upload audio, request evaluasi, dan render hasil.
- Evaluasi MVP memakai simple multipart upload + polling result lebih dulu.
- WebSocket dan chunked upload tetap menjadi target final, tetapi bukan blocker integrasi MVP pertama.

## 2. Source of Truth

Urutan prioritas kontrak:

1. `API_SWAGGER_APP_INTEGRATION.md`
2. `docs/BackendRequirements.md`
3. `MODEL_INFERENCE.md`
4. `docs/API.md`

`docs/API.md` dianggap ringkasan lama. Jika bertentangan dengan Swagger, ikuti Swagger.

## 3. Target MVP Integrasi

MVP integrasi dinyatakan selesai jika app bisa:

1. Login/signup ke backend.
2. Restore session memakai access token.
3. Load Home dari `GET /v1/home`.
4. Load Practice list/detail dari backend.
5. Start practice session.
6. Rekam audio lokal.
7. Upload audio simple multipart.
8. Request evaluation.
9. Poll evaluation result sampai completed/failed.
10. Render result, Insight, Profile dari response backend.

Tidak wajib untuk MVP pertama:

- WebSocket realtime progress.
- Chunked upload.
- Audio streaming lewat WebSocket.
- Offline-first sync.
- Teacher dashboard.
- Tajwid verdict final.

## 4. API Contract Rules

### 4.1 Format Umum

- Semua endpoint app memakai prefix `/v1`.
- JSON memakai camelCase.
- Semua endpoint selain login, signup, refresh, dan health butuh `Authorization: Bearer <accessToken>`.
- Response error wajib pakai shape:

```json
{
  "error": {
    "code": "audio_unprocessable",
    "message": "Audio belum cukup jelas untuk dievaluasi.",
    "requestId": "req_123",
    "details": {}
  }
}
```

### 4.2 Backend Compatibility Rules

Backend boleh menambah field baru. App wajib ignore unknown field.

Backend tidak boleh:

- Rename field tanpa versi baru.
- Mengubah enum value tanpa masa transisi.
- Menghapus field wajib yang sudah dipakai app.
- Mengembalikan snake_case di response app-facing.
- Mengklaim hasil AI sebagai keputusan final benar/salah.

### 4.3 App Mapping Rules

App wajib punya DTO/mapper untuk translate backend JSON ke domain model.

Contoh:

- Backend `needs_check` -> app `HighlightStatus.needsCheck`
- Backend profile preferences object -> app `PreferenceItem`
- Backend evaluation events -> app realtime/progress state, bukan final result domain utama.

## 5. Required Fields Per Screen

### 5.1 Auth

Backend response login/signup wajib:

```text
user.id
user.name
user.email
tokens.accessToken
tokens.refreshToken
tokens.expiresIn
```

Optional:

```text
user.avatarUrl
user.learningLevel
user.createdAt
```

App action:

- Store accessToken + refreshToken.
- Attach accessToken to protected requests.
- Refresh token on 401 after interceptor exists.

### 5.2 Home

`GET /v1/home` wajib:

```text
dailyQira.id
dailyQira.practiceItemId
dailyQira.surahName
dailyQira.ayahLabel
dailyQira.arabicText
dailyQira.translation
dailyQira.estimatedMinutes
dailyQira.focus
greeting.headline
greeting.message
weeklySnapshot.sessionsDone
weeklySnapshot.sessionsTarget
weeklySnapshot.averageMatch
weeklySnapshot.streakDays
recommendation.practiceId
recommendation.title
recommendation.reason
```

Recommended:

```text
dailyQira.reciter
continuePractice.practiceId
continuePractice.surahName
continuePractice.ayahLabel
continuePractice.lastMatch
```

Decision:

- Backend sebaiknya kirim `dailyQira.reciter`.
- Jika belum ada, app memakai fallback `Reference reciter`.

### 5.3 Practice List and Detail

`GET /v1/practice-items` item wajib:

```text
id
surahName
surahNumber
ayahLabel
arabicName
arabicText
translation
focus
level
estimatedMinutes
referenceAudioUrl
isDaily
```

Recommended:

```text
latinHint
tags
ayahNumberStart
ayahNumberEnd
```

Detail endpoint wajib menambah:

```text
segments[].index
segments[].text
segments[].startChar
segments[].endChar
```

Decision:

- Backend response boleh lebih lengkap dari app.
- App harus mulai simpan `latinHint`, `tags`, dan `segments` karena dibutuhkan untuk UI detail dan result alignment.

### 5.4 Recording Session

`POST /v1/practice-sessions` request wajib:

```text
practiceItemId
clientSessionId
device.platform
device.model
device.appVersion
```

Response wajib:

```text
session.id
session.practiceItemId
session.status
realtime.url
realtime.token
realtime.expiresIn
upload.mode
upload.chunkSizeBytes
upload.acceptedMimeTypes
upload.maxDurationSeconds
```

MVP usage:

- App stores `session.id`.
- App may ignore `realtime` and `chunked upload` for first integration.
- Backend still returns these fields for future WebSocket implementation.

### 5.5 Audio Upload

MVP uses simple multipart:

```http
POST /v1/practice-sessions/{sessionId}/audio
```

Request fields wajib:

```text
file
mimeType
durationMs
sampleRate
channels
codec
```

Response wajib:

```text
audio.id
audio.sessionId
audio.audioUrl
audio.durationMs
audio.mimeType
audio.status
```

Optional:

```text
audio.sizeBytes
```

Decision:

- Backend must accept `audio/m4a` for mobile MVP.
- Backend should normalize internally to 16 kHz mono float32 PCM.
- Backend needs `ffmpeg` installed.

### 5.6 Evaluation

`POST /v1/practice-sessions/{sessionId}/evaluate` request:

```text
audioId
```

Response wajib:

```text
evaluation.resultId
evaluation.sessionId
evaluation.status
```

`GET /v1/evaluation-results/{resultId}` wajib:

```text
result.resultId
result.sessionId
result.practiceItemId
result.matchScore
result.confidenceLevel
result.summary
result.recommendation
result.highlights[].segment
result.highlights[].status
result.highlights[].note
result.letterInsights[].letter
result.letterInsights[].masteryScore
result.letterInsights[].mistakeCount
result.status
```

Recommended:

```text
result.highlights[].startIndex
result.highlights[].endIndex
result.createdAt
```

Allowed values:

```text
confidenceLevel: low | medium | high
highlight.status: read | current | needs_check | needs_retry
result.status: queued | processing | completed | failed
```

Decision:

- App must map `needs_check` and `needs_retry` into Dart enum.
- `matchScore` is reading match score, not tajwid correctness.
- Copy must say `evaluasi awal`.

### 5.7 Insight

`GET /v1/insights/weekly` wajib:

```text
weeklyInsight.practiceCount
weeklyInsight.averageScore
weeklyInsight.growthPercent
weeklyInsight.focusLetter
weeklyInsight.summary
weeklyInsight.trend[]
weeklyInsight.letterMastery[].letter
weeklyInsight.letterMastery[].score
weeklyInsight.letterMastery[].mistakeCount
weeklyInsight.suggestion
```

`GET /v1/insights/letter-mastery` optional for MVP if weekly endpoint already includes letter mastery.

### 5.8 Profile

`GET /v1/profile` wajib:

```text
user.id
user.name
user.email
summary.totalSessions
summary.averageScore
summary.focusLetter
summary.streakDays
summary.learningSummary
summary.achievement
preferences.practiceLevel
preferences.practiceMode
preferences.audioFeedbackEnabled
preferences.dailyReportFrequency
preferences.reminderEnabled
preferences.reminderTime
```

Decision:

- App maps preferences object into UI rows.
- Backend keeps structured preferences because that is better long-term.

## 6. ASR and Model Requirements

Backend owns ASR inference.

Backend evaluation needs:

```text
external/zipformer_p-quran/quran_phoneme_zipformer.int8.onnx
external/zipformer_p-quran/tokens.txt
external/zipformer_p-quran/quran_text2phoneme.json
external/zipformer_p-quran/data/reference/quran_verses_uthmani.json
ffmpeg
uv sync --extra backend --extra asr
```

If model files are missing:

- Backend can still start.
- Evaluation endpoint must return user-safe error.
- Error code should be `evaluation_model_unavailable` or `evaluation_failed`.
- App shows retry-safe failure, not stack trace.

## 7. Rollout Phases

### Phase 0: Contract Freeze

Output:

- This document accepted by app and backend.
- Swagger response examples match this document.
- Known deviations listed before app integration starts.

Acceptance:

- No unknown required field for app MVP.
- No field rename planned during MVP integration.

### Phase 1: Read API Integration

Output:

- Auth real API.
- Home real API.
- Practice real API.
- Profile real API.
- Insight real API.

Acceptance:

- App can login and navigate Home, Practice, Insight, Profile using backend data.
- App can still run with mock fallback in tests.
- `flutter analyze` and `flutter test` pass.

### Phase 2: Recording MVP

Output:

- Real recorder adapter.
- Practice session creation.
- Simple multipart upload.
- Evaluation request.
- Evaluation polling.

Acceptance:

- User can record one audio file.
- Backend receives audio and returns `audio.id`.
- App can request evaluation and render completed or failed result.

### Phase 3: Realtime Upgrade

Output:

- WebSocket connect with realtime token.
- Server event handling.
- Progress UI.
- Optional chunked upload.

Acceptance:

- App handles `evaluation.processing`, `evaluation.completed`, and `evaluation.failed`.
- Reconnect/session snapshot works for network interruption.

## 8. Backend Should Move Forward, Not Backward

Backend should keep richer contract because it supports final product:

- Session ownership.
- Private audio.
- Realtime token.
- Chunked upload.
- Structured profile preferences.
- Evaluation status.
- Highlight indexes.
- Letter insight aggregation.

Backend should only simplify in one place:

- Make simple multipart upload stable before requiring chunked upload.

This lets app integrate sooner without weakening backend architecture.

## 9. Open Questions

1. Does `/v1/home.dailyQira` always include `reciter`?
2. Should `referenceAudioUrl` be direct signed URL or `fileKey` consumed by `/v1/reference-audio/{fileKey}`?
3. Should evaluation result be wrapped in `{ "result": ... }` everywhere?
4. What exact error code should backend return when ASR model files are missing?
5. Which mobile recorder format is primary: `audio/m4a` AAC or `audio/webm` Opus?

## 10. Final Recommendation

Use backend Swagger as north star. Do not downgrade backend to current mock app model. App should add DTO/mapper and consume richer backend contract gradually.

Start implementation with Phase 1, then Phase 2 simple upload. WebSocket and chunked upload come after successful end-to-end evaluation.
