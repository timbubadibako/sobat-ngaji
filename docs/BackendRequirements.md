# Backend Requirements

Dokumen ini menjadi handoff untuk backend engineer. Fokusnya membuat backend yang cocok dengan aplikasi Flutter Sobat Ngaji saat ini dan tetap aman untuk pengembangan AI/ASR berikutnya.

## 1. Prinsip Umum

- Backend melayani auth, profile, practice item, practice session, audio upload/chunk, realtime event, evaluation result, insight, dan learning summary.
- Mobile app tidak melakukan inferensi AI berat.
- Audio rekaman dianggap data sensitif.
- Hasil AI selalu disebut `evaluasi awal`, bukan keputusan final benar/salah.
- Realtime utama memakai WebSocket, bukan polling.
- Semua response JSON harus stabil dan mudah dimapping ke model mobile.
- Semua endpoint selain auth publik wajib memakai `Authorization: Bearer <accessToken>`.

## 2. Base URL dan Versioning

```text
REST API: https://api.sobat-ngaji.app/v1
WebSocket: wss://api.sobat-ngaji.app/v1/realtime
```

Untuk development:

```text
REST API: https://dev-api.sobat-ngaji.app/v1
WebSocket: wss://dev-api.sobat-ngaji.app/v1/realtime
```

## 3. Standard Headers

Request:

```http
Accept: application/json
Content-Type: application/json
Authorization: Bearer <accessToken>
X-Client-Platform: android|ios|web
X-Client-Version: 0.1.0
X-Request-Id: <uuid>
```

Response:

```http
Content-Type: application/json
X-Request-Id: <uuid>
```

## 4. Error Shape

Semua error pakai format ini:

```json
{
  "error": {
    "code": "audio_unprocessable",
    "message": "Uploaded audio cannot be processed.",
    "requestId": "req_123",
    "details": {}
  }
}
```

Kode error minimal:

```text
auth_invalid_credentials
auth_token_expired
auth_refresh_failed
auth_email_exists
validation_failed
practice_not_found
session_not_found
session_invalid_state
audio_upload_failed
audio_chunk_missing
audio_unprocessable
websocket_unauthorized
evaluation_failed
insight_not_ready
profile_update_failed
rate_limited
internal_error
```

HTTP status:

```text
400 validation_failed
401 auth_token_expired / websocket_unauthorized
403 forbidden
404 *_not_found
409 session_invalid_state / auth_email_exists
413 payload_too_large
422 audio_unprocessable
429 rate_limited
500 internal_error
```

## 5. Auth

### 5.1 Signup

```http
POST /auth/signup
```

Request:

```json
{
  "name": "Alya Rahma",
  "email": "alya@sobat.ngaji",
  "password": "password123"
}
```

Response `201`:

```json
{
  "user": {
    "id": "user_001",
    "name": "Alya Rahma",
    "email": "alya@sobat.ngaji",
    "avatarUrl": null,
    "learningLevel": "beginner",
    "createdAt": "2026-07-07T10:00:00Z"
  },
  "tokens": {
    "accessToken": "jwt_access",
    "refreshToken": "jwt_refresh",
    "expiresIn": 3600
  }
}
```

### 5.2 Login

```http
POST /auth/login
```

Request:

```json
{
  "email": "alya@sobat.ngaji",
  "password": "password123"
}
```

Response `200`: same as signup.

### 5.3 Restore Session / Current User

```http
GET /auth/me
```

Response `200`:

```json
{
  "user": {
    "id": "user_001",
    "name": "Alya Rahma",
    "email": "alya@sobat.ngaji",
    "avatarUrl": null,
    "learningLevel": "beginner",
    "createdAt": "2026-07-07T10:00:00Z"
  }
}
```

### 5.4 Refresh Token

```http
POST /auth/refresh
```

Request:

```json
{
  "refreshToken": "jwt_refresh"
}
```

Response:

```json
{
  "accessToken": "new_jwt_access",
  "refreshToken": "new_jwt_refresh",
  "expiresIn": 3600
}
```

### 5.5 Logout

```http
POST /auth/logout
```

Request:

```json
{
  "refreshToken": "jwt_refresh"
}
```

Response:

```json
{
  "success": true
}
```

Backend harus revoke refresh token. Mobile tetap clear local secure storage.

## 6. Profile

### 6.1 Get Profile

```http
GET /profile
```

Response:

```json
{
  "user": {
    "id": "user_001",
    "name": "Alya Rahma",
    "email": "alya@sobat.ngaji",
    "avatarUrl": null,
    "learningLevel": "beginner"
  },
  "summary": {
    "totalSessions": 42,
    "averageScore": 78,
    "focusLetter": "ض",
    "streakDays": 7,
    "learningSummary": "AI menemukan latihanmu paling stabil di pagi hari.",
    "achievement": "Menyelesaikan Daily Qira dengan kecocokan 82%."
  },
  "preferences": {
    "practiceLevel": "beginner",
    "practiceMode": "phrases",
    "audioFeedbackEnabled": true,
    "dailyReportFrequency": "weekly_sunday",
    "reminderEnabled": false,
    "reminderTime": null
  }
}
```

### 6.2 Update Profile Identity

```http
PATCH /profile
```

Request:

```json
{
  "name": "Alya Rahma",
  "learningLevel": "beginner",
  "avatarUrl": null
}
```

Response:

```json
{
  "user": {
    "id": "user_001",
    "name": "Alya Rahma",
    "email": "alya@sobat.ngaji",
    "avatarUrl": null,
    "learningLevel": "beginner"
  }
}
```

### 6.3 Update Preferences

```http
PATCH /profile/preferences
```

Request:

```json
{
  "practiceLevel": "beginner",
  "practiceMode": "phrases",
  "audioFeedbackEnabled": true,
  "dailyReportFrequency": "weekly_sunday",
  "reminderEnabled": true,
  "reminderTime": "05:30"
}
```

Response:

```json
{
  "preferences": {
    "practiceLevel": "beginner",
    "practiceMode": "phrases",
    "audioFeedbackEnabled": true,
    "dailyReportFrequency": "weekly_sunday",
    "reminderEnabled": true,
    "reminderTime": "05:30"
  }
}
```

## 7. Home

### 7.1 Get Home Summary

```http
GET /home
```

Response:

```json
{
  "dailyQira": {
    "id": "daily_ad_dhuha_1",
    "practiceItemId": "ad_dhuha_1",
    "surahName": "Ad-Dhuha",
    "ayahLabel": "Ayat 1",
    "arabicText": "وَالضُّحَىٰ",
    "translation": "Demi waktu duha.",
    "reciter": "Syaikh Mishary Rashid",
    "estimatedMinutes": 5,
    "focus": "Huruf ض"
  },
  "greeting": {
    "headline": "Assalamualaikum, Alya.",
    "message": "AI menemukan progresmu naik pelan-pelan. Fokus hari ini huruf ض."
  },
  "weeklySnapshot": {
    "sessionsDone": 5,
    "sessionsTarget": 7,
    "averageMatch": 84,
    "streakDays": 4
  },
  "continuePractice": {
    "practiceId": "al_fatihah_1",
    "surahName": "Al-Fatihah",
    "ayahLabel": "Frasa 1 dari 3",
    "lastMatch": 78
  },
  "recommendation": {
    "practiceId": "ad_dhuha_1",
    "title": "Latih Surah Ad-Dhuha",
    "reason": "Kami menyarankan latihan ini untuk memperkuat pengucapan huruf ض."
  }
}
```

## 8. Practice Items

### 8.1 List Practice Items

```http
GET /practice-items
```

Query optional:

```text
q=ad-dhuha
level=beginner|intermediate|advanced
tag=daily|juz30|focus_dad
limit=20
cursor=<cursor>
```

Response:

```json
{
  "items": [
    {
      "id": "ad_dhuha_1",
      "surahName": "Ad-Dhuha",
      "surahNumber": 93,
      "ayahLabel": "Ayat 1",
      "ayahNumberStart": 1,
      "ayahNumberEnd": 1,
      "arabicName": "الضحى",
      "arabicText": "وَالضُّحَىٰ",
      "translation": "Demi waktu duha.",
      "latinHint": "wad-duha",
      "focus": "Huruf ض",
      "level": "beginner",
      "estimatedMinutes": 5,
      "referenceAudioUrl": "https://cdn.sobat-ngaji.app/reference/ad-dhuha-1.mp3",
      "isDaily": true,
      "tags": ["daily", "juz30", "focus_dad"]
    }
  ],
  "nextCursor": null
}
```

### 8.2 Get Practice Item Detail

```http
GET /practice-items/{practiceItemId}
```

Response: single item with same shape as list item plus optional phrase metadata.

```json
{
  "item": {
    "id": "ad_dhuha_1",
    "surahName": "Ad-Dhuha",
    "surahNumber": 93,
    "ayahLabel": "Ayat 1",
    "arabicName": "الضحى",
    "arabicText": "وَالضُّحَىٰ",
    "translation": "Demi waktu duha.",
    "latinHint": "wad-duha",
    "focus": "Huruf ض",
    "level": "beginner",
    "estimatedMinutes": 5,
    "referenceAudioUrl": "https://cdn.sobat-ngaji.app/reference/ad-dhuha-1.mp3",
    "segments": [
      {
        "index": 0,
        "text": "وَ",
        "startChar": 0,
        "endChar": 1
      },
      {
        "index": 1,
        "text": "الضُّ",
        "startChar": 1,
        "endChar": 5
      },
      {
        "index": 2,
        "text": "حَىٰ",
        "startChar": 5,
        "endChar": 8
      }
    ]
  }
}
```

## 9. Practice Session

### 9.1 Create Session

```http
POST /practice-sessions
```

Request:

```json
{
  "practiceItemId": "ad_dhuha_1",
  "clientSessionId": "client_uuid_001",
  "device": {
    "platform": "android",
    "model": "Pixel 7",
    "appVersion": "0.1.0"
  }
}
```

Response `201`:

```json
{
  "session": {
    "id": "session_001",
    "practiceItemId": "ad_dhuha_1",
    "userId": "user_001",
    "status": "started",
    "createdAt": "2026-07-07T10:10:00Z",
    "expiresAt": "2026-07-07T10:40:00Z"
  },
  "realtime": {
    "url": "wss://api.sobat-ngaji.app/v1/realtime/practice-sessions/session_001",
    "token": "short_lived_ws_token",
    "expiresIn": 1800
  },
  "upload": {
    "mode": "chunked",
    "chunkSizeBytes": 32768,
    "acceptedMimeTypes": ["audio/webm", "audio/mp4", "audio/m4a", "audio/wav"],
    "maxDurationSeconds": 120
  }
}
```

### 9.2 Get Session

```http
GET /practice-sessions/{sessionId}
```

Response:

```json
{
  "session": {
    "id": "session_001",
    "practiceItemId": "ad_dhuha_1",
    "status": "recording",
    "audioUrl": null,
    "createdAt": "2026-07-07T10:10:00Z",
    "completedAt": null
  }
}
```

### 9.3 Cancel Session

```http
POST /practice-sessions/{sessionId}/cancel
```

Response:

```json
{
  "session": {
    "id": "session_001",
    "status": "cancelled"
  }
}
```

## 10. Audio Upload

Backend sebaiknya mendukung dua mode:

1. Simple multipart upload untuk implementasi cepat.
2. Chunk upload untuk realtime/progressive recording.

### 10.1 Simple Multipart Upload

```http
POST /practice-sessions/{sessionId}/audio
Content-Type: multipart/form-data
```

Fields:

```text
file=<audio file>
mimeType=audio/m4a
durationMs=8300
sampleRate=16000
channels=1
codec=aac
```

Response:

```json
{
  "audio": {
    "id": "audio_001",
    "sessionId": "session_001",
    "audioUrl": "private://audio/session_001/audio_001.m4a",
    "durationMs": 8300,
    "mimeType": "audio/m4a",
    "sizeBytes": 184320,
    "status": "uploaded"
  }
}
```

### 10.2 Chunk Upload Init

```http
POST /practice-sessions/{sessionId}/audio/chunks/init
```

Request:

```json
{
  "mimeType": "audio/webm",
  "durationLimitMs": 120000,
  "sampleRate": 16000,
  "channels": 1,
  "expectedChunkSizeBytes": 32768
}
```

Response:

```json
{
  "upload": {
    "uploadId": "upload_001",
    "sessionId": "session_001",
    "chunkSizeBytes": 32768,
    "expiresAt": "2026-07-07T10:40:00Z"
  }
}
```

### 10.3 Chunk Upload Part

```http
POST /practice-sessions/{sessionId}/audio/chunks/{uploadId}
Content-Type: application/octet-stream
```

Headers:

```http
X-Chunk-Index: 0
X-Chunk-Start-Ms: 0
X-Chunk-End-Ms: 1000
X-Chunk-Checksum-Sha256: <hash>
```

Response:

```json
{
  "chunk": {
    "uploadId": "upload_001",
    "index": 0,
    "received": true,
    "receivedBytes": 32768
  }
}
```

### 10.4 Chunk Upload Complete

```http
POST /practice-sessions/{sessionId}/audio/chunks/{uploadId}/complete
```

Request:

```json
{
  "totalChunks": 9,
  "durationMs": 8300,
  "finalChecksumSha256": "<hash>"
}
```

Response:

```json
{
  "audio": {
    "id": "audio_001",
    "sessionId": "session_001",
    "audioUrl": "private://audio/session_001/audio_001.webm",
    "durationMs": 8300,
    "mimeType": "audio/webm",
    "sizeBytes": 184320,
    "status": "uploaded"
  }
}
```

### 10.5 Chunk Upload Abort

```http
POST /practice-sessions/{sessionId}/audio/chunks/{uploadId}/abort
```

Response:

```json
{
  "uploadId": "upload_001",
  "status": "aborted"
}
```

## 11. Realtime WebSocket

### 11.1 Connect

```text
wss://api.sobat-ngaji.app/v1/realtime/practice-sessions/{sessionId}?token=<short_lived_ws_token>
```

Auth:

- Prefer short-lived `realtime.token` dari `POST /practice-sessions`.
- Backend harus validate token ownership terhadap `sessionId`.
- Jika token invalid, close dengan code `4401`.

Envelope semua event:

```json
{
  "type": "event.name",
  "sessionId": "session_001",
  "eventId": "evt_001",
  "timestamp": "2026-07-07T10:10:01Z",
  "payload": {}
}
```

### 11.2 Client Events

#### `recording.started`

Dikirim setelah permission microphone OK dan recorder siap.

```json
{
  "type": "recording.started",
  "sessionId": "session_001",
  "eventId": "client_evt_001",
  "timestamp": "2026-07-07T10:10:01Z",
  "payload": {
    "practiceItemId": "ad_dhuha_1",
    "mimeType": "audio/webm",
    "sampleRate": 16000,
    "channels": 1
  }
}
```

#### `audio.chunk`

Dipakai jika ingin streaming chunk lewat WebSocket. REST chunk upload tetap lebih mudah dan stabil, tapi WebSocket chunk bisa didukung.

```json
{
  "type": "audio.chunk",
  "sessionId": "session_001",
  "eventId": "client_evt_002",
  "timestamp": "2026-07-07T10:10:02Z",
  "payload": {
    "uploadId": "upload_001",
    "chunkIndex": 0,
    "startMs": 0,
    "endMs": 1000,
    "mimeType": "audio/webm",
    "encoding": "base64",
    "data": "<base64-audio-bytes>",
    "checksumSha256": "<hash>"
  }
}
```

Recommendation:

- Untuk mobile MVP, gunakan REST chunk upload + WebSocket progress event.
- Jangan kirim base64 besar lewat WebSocket kecuali backend memang siap handle backpressure.

#### `recording.stopped`

```json
{
  "type": "recording.stopped",
  "sessionId": "session_001",
  "eventId": "client_evt_010",
  "timestamp": "2026-07-07T10:10:10Z",
  "payload": {
    "audioId": "audio_001",
    "audioUrl": "private://audio/session_001/audio_001.webm",
    "durationMs": 8300,
    "totalChunks": 9
  }
}
```

#### `evaluation.requested`

Client boleh trigger evaluasi via WebSocket atau REST. Untuk konsistensi MVP, REST `POST /evaluate` tetap wajib ada.

```json
{
  "type": "evaluation.requested",
  "sessionId": "session_001",
  "eventId": "client_evt_011",
  "timestamp": "2026-07-07T10:10:11Z",
  "payload": {
    "audioId": "audio_001"
  }
}
```

#### `ping`

```json
{
  "type": "ping",
  "sessionId": "session_001",
  "eventId": "client_evt_ping_001",
  "timestamp": "2026-07-07T10:10:12Z",
  "payload": {}
}
```

### 11.3 Server Events

#### `session.ready`

```json
{
  "type": "session.ready",
  "sessionId": "session_001",
  "eventId": "evt_001",
  "timestamp": "2026-07-07T10:10:00Z",
  "payload": {
    "status": "started"
  }
}
```

#### `recording.started.ack`

```json
{
  "type": "recording.started.ack",
  "sessionId": "session_001",
  "eventId": "evt_002",
  "timestamp": "2026-07-07T10:10:01Z",
  "payload": {
    "status": "recording"
  }
}
```

#### `audio.chunk.received`

```json
{
  "type": "audio.chunk.received",
  "sessionId": "session_001",
  "eventId": "evt_003",
  "timestamp": "2026-07-07T10:10:02Z",
  "payload": {
    "uploadId": "upload_001",
    "chunkIndex": 0,
    "receivedBytes": 32768,
    "progress": 12
  }
}
```

#### `audio.uploading`

```json
{
  "type": "audio.uploading",
  "sessionId": "session_001",
  "eventId": "evt_004",
  "timestamp": "2026-07-07T10:10:04Z",
  "payload": {
    "progress": 42
  }
}
```

#### `audio.uploaded`

```json
{
  "type": "audio.uploaded",
  "sessionId": "session_001",
  "eventId": "evt_005",
  "timestamp": "2026-07-07T10:10:10Z",
  "payload": {
    "audioId": "audio_001",
    "audioUrl": "private://audio/session_001/audio_001.webm",
    "durationMs": 8300
  }
}
```

#### `evaluation.queued`

```json
{
  "type": "evaluation.queued",
  "sessionId": "session_001",
  "eventId": "evt_006",
  "timestamp": "2026-07-07T10:10:11Z",
  "payload": {
    "position": 1
  }
}
```

#### `evaluation.processing`

```json
{
  "type": "evaluation.processing",
  "sessionId": "session_001",
  "eventId": "evt_007",
  "timestamp": "2026-07-07T10:10:12Z",
  "payload": {
    "message": "AI sedang mencocokkan bacaan dengan referensi.",
    "progress": 65
  }
}
```

#### `evaluation.completed`

```json
{
  "type": "evaluation.completed",
  "sessionId": "session_001",
  "eventId": "evt_008",
  "timestamp": "2026-07-07T10:10:18Z",
  "payload": {
    "resultId": "result_001"
  }
}
```

#### `evaluation.failed`

```json
{
  "type": "evaluation.failed",
  "sessionId": "session_001",
  "eventId": "evt_009",
  "timestamp": "2026-07-07T10:10:18Z",
  "payload": {
    "errorCode": "audio_unprocessable",
    "message": "Audio belum cukup jelas untuk dievaluasi.",
    "retryable": true
  }
}
```

#### `pong`

```json
{
  "type": "pong",
  "sessionId": "session_001",
  "eventId": "evt_pong_001",
  "timestamp": "2026-07-07T10:10:12Z",
  "payload": {}
}
```

### 11.4 Realtime Chunk Flow Detail

Recommended flow REST chunk + WebSocket progress:

```text
1. Mobile POST /practice-sessions
2. Backend returns sessionId + realtime token + chunk settings
3. Mobile opens WebSocket /realtime/practice-sessions/{sessionId}
4. Server sends session.ready
5. Mobile sends recording.started
6. Server sends recording.started.ack
7. Mobile POST /audio/chunks/init
8. Mobile starts local recorder
9. Every ~500-1000ms mobile sends chunk using REST /audio/chunks/{uploadId}
10. Server validates chunkIndex and checksum
11. Server broadcasts audio.chunk.received over WebSocket
12. Mobile stops recorder
13. Mobile POST /audio/chunks/{uploadId}/complete
14. Server assembles audio privately
15. Server broadcasts audio.uploaded
16. Mobile sends recording.stopped OR calls POST /evaluate
17. Server broadcasts evaluation.queued
18. Server broadcasts evaluation.processing one or more times
19. Server stores result
20. Server broadcasts evaluation.completed with resultId
21. Mobile GET /evaluation-results/{resultId}
```

Backpressure rules:

- Backend must reject duplicate `chunkIndex` unless checksum matches previous upload.
- Backend must reject missing chunks on complete with `audio_chunk_missing`.
- Mobile may retry chunk upload with same `chunkIndex`.
- Backend should allow idempotency for chunk upload.
- If WebSocket disconnects, REST chunk upload can continue.
- When WebSocket reconnects, mobile sends last known `sessionId`; server sends latest session state.

Reconnect:

```text
Mobile reconnects with same sessionId + token.
Server validates session ownership.
Server sends session.snapshot.
Mobile resumes UI from latest status.
```

`session.snapshot` example:

```json
{
  "type": "session.snapshot",
  "sessionId": "session_001",
  "eventId": "evt_snapshot_001",
  "timestamp": "2026-07-07T10:10:15Z",
  "payload": {
    "status": "processing",
    "uploadId": "upload_001",
    "receivedChunks": [0, 1, 2, 3, 4, 5, 6, 7, 8],
    "audioId": "audio_001",
    "resultId": null
  }
}
```

## 12. Evaluation

### 12.1 Request Evaluation

```http
POST /practice-sessions/{sessionId}/evaluate
```

Request:

```json
{
  "audioId": "audio_001",
  "audioUrl": "private://audio/session_001/audio_001.webm"
}
```

Response:

```json
{
  "evaluation": {
    "resultId": "result_001",
    "sessionId": "session_001",
    "status": "queued"
  }
}
```

### 12.2 Get Evaluation Result

```http
GET /evaluation-results/{resultId}
```

Response:

```json
{
  "result": {
    "resultId": "result_001",
    "sessionId": "session_001",
    "practiceItemId": "ad_dhuha_1",
    "matchScore": 82,
    "confidenceLevel": "medium",
    "summary": "Evaluasi awal menunjukkan bacaan cukup stabil. AI menemukan bagian yang perlu dicek pada pelafalan ض.",
    "recommendation": "Coba ulangi bagian ini dengan tempo lebih pelan dan dengarkan referensi sekali sebelum merekam.",
    "highlights": [
      {
        "segment": "وَ",
        "status": "read",
        "note": "Terbaca baik.",
        "startIndex": 0,
        "endIndex": 1
      },
      {
        "segment": "الضُّ",
        "status": "needs_check",
        "note": "Perlu dicek pada huruf ض.",
        "startIndex": 1,
        "endIndex": 5
      },
      {
        "segment": "حَىٰ",
        "status": "current",
        "note": "Jaga panjang bacaan.",
        "startIndex": 5,
        "endIndex": 8
      }
    ],
    "letterInsights": [
      {
        "letter": "ض",
        "masteryScore": 42,
        "mistakeCount": 3
      }
    ],
    "createdAt": "2026-07-07T10:10:18Z"
  }
}
```

Allowed values:

```text
confidenceLevel: low | medium | high
highlight.status: read | current | needs_check | needs_retry
```

### 12.3 Retry Evaluation

```http
POST /practice-sessions/{sessionId}/evaluate/retry
```

Request:

```json
{
  "audioId": "audio_001"
}
```

Response:

```json
{
  "evaluation": {
    "resultId": "result_002",
    "sessionId": "session_001",
    "status": "queued"
  }
}
```

## 13. Insight

### 13.1 Weekly Insight

```http
GET /insights/weekly
```

Query optional:

```text
weekStart=2026-07-06
timezone=Asia/Jakarta
```

Response:

```json
{
  "weeklyInsight": {
    "practiceCount": 12,
    "averageScore": 78,
    "growthPercent": 9,
    "focusLetter": "ض",
    "summary": "AI menemukan performa meningkat minggu ini, namun huruf ض masih sering perlu dicek.",
    "trend": [62, 66, 71, 69, 74, 78, 82],
    "letterMastery": [
      {
        "letter": "ب",
        "score": 88,
        "mistakeCount": 1
      },
      {
        "letter": "ض",
        "score": 18,
        "mistakeCount": 7
      }
    ],
    "suggestion": "Latih Ad-Dhuha 5 menit dan ulangi frasa dengan tempo pelan."
  }
}
```

### 13.2 Letter Mastery

```http
GET /insights/letter-mastery
```

Response:

```json
{
  "items": [
    {
      "letter": "ض",
      "score": 18,
      "mistakeCount": 7,
      "lastPracticedAt": "2026-07-07T10:10:18Z"
    }
  ]
}
```

### 13.3 Practice History

```http
GET /practice-sessions
```

Query optional:

```text
limit=20
cursor=<cursor>
status=completed
```

Response:

```json
{
  "items": [
    {
      "id": "session_001",
      "practiceItemId": "ad_dhuha_1",
      "surahName": "Ad-Dhuha",
      "ayahLabel": "Ayat 1",
      "status": "completed",
      "matchScore": 82,
      "confidenceLevel": "medium",
      "createdAt": "2026-07-07T10:10:00Z",
      "completedAt": "2026-07-07T10:10:18Z"
    }
  ],
  "nextCursor": null
}
```

## 14. Data Model Minimal

Tables minimal:

```text
users
auth_refresh_tokens
user_preferences
practice_items
practice_sessions
audio_uploads
audio_chunks
evaluation_results
ayah_highlights
letter_insights
letter_mastery
weekly_reports
```

### 14.1 users

```text
id uuid pk
name text
email text unique
password_hash text
avatar_url text nullable
learning_level text
created_at timestamptz
updated_at timestamptz
```

### 14.2 user_preferences

```text
user_id uuid pk fk users.id
practice_level text
practice_mode text
audio_feedback_enabled boolean
daily_report_frequency text
reminder_enabled boolean
reminder_time text nullable
updated_at timestamptz
```

### 14.3 practice_items

```text
id text pk
surah_name text
surah_number int
ayah_label text
ayah_number_start int
ayah_number_end int
arabic_name text
arabic_text text
translation text
latin_hint text nullable
focus text
level text
estimated_minutes int
reference_audio_url text
is_daily boolean
tags text[]
created_at timestamptz
updated_at timestamptz
```

### 14.4 practice_sessions

```text
id uuid pk
user_id uuid fk users.id
practice_item_id text fk practice_items.id
status text
client_session_id text nullable
started_at timestamptz
completed_at timestamptz nullable
created_at timestamptz
updated_at timestamptz
```

Session status:

```text
started
recording
uploading
processing
completed
failed
cancelled
```

### 14.5 audio_uploads

```text
id uuid pk
session_id uuid fk practice_sessions.id
upload_id text unique
audio_url text nullable
mime_type text
duration_ms int nullable
sample_rate int nullable
channels int nullable
size_bytes int nullable
status text
created_at timestamptz
completed_at timestamptz nullable
```

Audio status:

```text
initialized
uploading
uploaded
failed
aborted
```

### 14.6 audio_chunks

```text
id uuid pk
audio_upload_id uuid fk audio_uploads.id
chunk_index int
start_ms int
end_ms int
size_bytes int
checksum_sha256 text
storage_key text
received_at timestamptz
unique(audio_upload_id, chunk_index)
```

### 14.7 evaluation_results

```text
id uuid pk
session_id uuid fk practice_sessions.id
practice_item_id text fk practice_items.id
match_score int
confidence_level text
summary text
recommendation text
status text
error_code text nullable
created_at timestamptz
```

### 14.8 ayah_highlights

```text
id uuid pk
evaluation_result_id uuid fk evaluation_results.id
segment text
status text
note text
start_index int
end_index int
created_at timestamptz
```

### 14.9 letter_mastery

```text
id uuid pk
user_id uuid fk users.id
letter text
score int
mistake_count int
last_practiced_at timestamptz
updated_at timestamptz
unique(user_id, letter)
```

## 15. Security and Privacy

- Store password with strong hash: Argon2id or bcrypt.
- Refresh token must be hashed in database.
- Access token lifetime short, example 15-60 minutes.
- Realtime token lifetime short, example 30 minutes.
- Audio file private by default, not public CDN.
- Audio signed URL lifetime short if exposed to mobile.
- Restrict user access: user can only access own sessions, audio, evaluation, insight.
- Add rate limit for auth and audio upload.
- Add max audio duration and max file size.
- Add retention policy for raw audio, configurable by environment.
- Log requestId and userId, but do not log raw audio bytes.

## 16. End-to-End Main Flow

```text
1. App opens.
2. Mobile restores secure token.
3. Mobile GET /auth/me.
4. Mobile GET /home.
5. User taps Daily Qira.
6. Mobile GET /practice-items/{practiceItemId}.
7. User listens reference audio from referenceAudioUrl.
8. User taps record.
9. Mobile POST /practice-sessions.
10. Mobile opens WebSocket with realtime token.
11. Mobile sends recording.started.
12. Mobile POST /audio/chunks/init.
13. Mobile records and uploads chunks.
14. Backend emits audio.chunk.received / audio.uploading.
15. User stops recording.
16. Mobile POST /audio/chunks/{uploadId}/complete.
17. Backend emits audio.uploaded.
18. Mobile POST /practice-sessions/{sessionId}/evaluate.
19. Backend emits evaluation.queued.
20. Backend emits evaluation.processing.
21. Backend stores evaluation result and updates insight aggregates.
22. Backend emits evaluation.completed.
23. Mobile GET /evaluation-results/{resultId}.
24. Mobile renders score, confidence, highlight, summary, recommendation.
25. User opens Insight.
26. Mobile GET /insights/weekly.
27. User opens Profile.
28. Mobile GET /profile.
```

## 17. Backend Acceptance Criteria

- Auth signup/login/refresh/logout works.
- `GET /auth/me` restores user session.
- `GET /home` returns Daily Qira, greeting, snapshot, continue practice, recommendation.
- `GET /practice-items` and detail endpoint return curated items.
- `POST /practice-sessions` returns session + realtime token + upload settings.
- WebSocket validates session ownership.
- WebSocket emits stable event envelope.
- REST chunk upload supports init, part, complete, abort.
- Evaluation can be requested after audio upload.
- Evaluation result contains `matchScore`, `confidenceLevel`, `summary`, `recommendation`, `highlights`, `letterInsights`.
- Insight weekly endpoint returns trend, letter mastery, and smart suggestion.
- Profile get/update/preferences endpoints work.
- Error responses follow standard error shape.
- Raw audio is private.
- No API response claims absolute correctness of Qur'an recitation.
