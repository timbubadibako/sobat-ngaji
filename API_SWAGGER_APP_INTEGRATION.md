# FastAPI Swagger dan Mapping Integrasi App

Dokumen singkat untuk tim app yang akan consume backend FastAPI Sobat Ngaji.

## Akses Swagger

Jalankan backend:

```bash
make backend
```

URL lokal:

- Swagger UI: `http://127.0.0.1:8000/docs`
- ReDoc: `http://127.0.0.1:8000/redoc`
- OpenAPI JSON: `http://127.0.0.1:8000/openapi.json`
- Health check: `GET http://127.0.0.1:8000/v1/health`

Semua endpoint app ada di prefix:

```text
/v1
```

Kecuali `signup`, `login`, `refresh`, dan `health`, endpoint app perlu header:

```http
Authorization: Bearer <accessToken>
```

Dev login:

```json
{
  "email": "alya@sobat.ngaji",
  "password": "apa-saja"
}
```

## Flow Utama App

1. Login atau signup.
2. Simpan `accessToken` dan `refreshToken`.
3. Buka Home dengan `GET /v1/home`.
4. Pilih item latihan dari `GET /v1/practice-items`.
5. Buat sesi latihan dengan `POST /v1/practice-sessions`.
6. Rekam audio di app.
7. Upload audio, simple atau chunked.
8. Request evaluasi dengan `POST /v1/practice-sessions/{sessionId}/evaluate`.
9. Ambil hasil dengan `GET /v1/evaluation-results/{resultId}`.
10. Tampilkan riwayat dan insight dari endpoint history/insights.

## Mapping Endpoint ke Bagian App

| Bagian app | Endpoint | Dipakai untuk |
|---|---|---|
| Splash/session restore | `GET /v1/auth/me` | Validasi token dan restore user login |
| Register | `POST /v1/auth/signup` | Buat akun baru |
| Login | `POST /v1/auth/login` | Ambil token login |
| Refresh token | `POST /v1/auth/refresh` | Perpanjang session saat access token expired |
| Logout | `POST /v1/auth/logout` | Revoke refresh token dan clear local storage |
| Home | `GET /v1/home` | Daily Qira, greeting, progres mingguan, lanjut latihan |
| Daftar latihan | `GET /v1/practice-items` | List ayat/surah latihan, search, filter level/tag |
| Detail latihan | `GET /v1/practice-items/{itemId}` | Detail ayat, teks Arab, segment kata, audio referensi |
| Audio referensi | `GET /v1/reference-audio/{fileKey}` | Stream audio contoh qari, auth-gated |
| Mulai latihan | `POST /v1/practice-sessions` | Buat session, dapat config upload dan WebSocket |
| Status sesi | `GET /v1/practice-sessions/{sessionId}` | Cek sesi dan audio terbaru |
| Batal latihan | `POST /v1/practice-sessions/{sessionId}/cancel` | Batalkan session aktif |
| Upload simple | `POST /v1/practice-sessions/{sessionId}/audio` | Upload 1 file audio multipart |
| Upload chunk init | `POST /v1/practice-sessions/{sessionId}/audio/chunks/init` | Mulai upload chunked |
| Upload chunk part | `POST /v1/practice-sessions/{sessionId}/audio/chunks/{uploadId}` | Kirim potongan audio |
| Upload chunk complete | `POST /v1/practice-sessions/{sessionId}/audio/chunks/{uploadId}/complete` | Gabungkan chunk jadi audio final |
| Upload chunk abort | `POST /v1/practice-sessions/{sessionId}/audio/chunks/{uploadId}/abort` | Batalkan upload chunked |
| Evaluasi bacaan | `POST /v1/practice-sessions/{sessionId}/evaluate` | Queue evaluasi audio |
| Retry evaluasi | `POST /v1/practice-sessions/{sessionId}/evaluate/retry` | Ulang evaluasi |
| Hasil evaluasi | `GET /v1/evaluation-results/{resultId}` | Score, highlight kata, rekomendasi, insight huruf |
| Riwayat latihan | `GET /v1/practice-sessions` | History latihan paginated |
| Insight mingguan | `GET /v1/insights/weekly` | Statistik mingguan dan saran latihan |
| Mastery huruf | `GET /v1/insights/letter-mastery` | Skor penguasaan huruf Arab |
| Profile | `GET /v1/profile` | Data user, ringkasan belajar, preferensi |
| Edit profile | `PATCH /v1/profile` | Ubah nama, level belajar, avatar |
| Preferensi | `PATCH /v1/profile/preferences` | Ubah mode latihan, reminder, feedback audio |

## Endpoint Auth

### `POST /v1/auth/login`

Request:

```json
{
  "email": "alya@sobat.ngaji",
  "password": "password123"
}
```

Response penting:

```json
{
  "user": {
    "id": "user_...",
    "name": "Alya Rahma",
    "email": "alya@sobat.ngaji",
    "learningLevel": "beginner"
  },
  "tokens": {
    "accessToken": "...",
    "refreshToken": "...",
    "expiresIn": 3600
  }
}
```

Catatan app:

- Simpan `accessToken` untuk header `Authorization`.
- Simpan `refreshToken` untuk refresh session.
- Backend sekarang masih dev stub: password belum diverifikasi.

### `POST /v1/auth/refresh`

Request:

```json
{
  "refreshToken": "<refreshToken>"
}
```

Pakai saat API return `401`.

## Endpoint Home dan Latihan

### `GET /v1/home`

Dipakai di screen Home. Response berisi:

- `dailyQira`
- `greeting`
- `weeklySnapshot`
- `continuePractice`
- `recommendation`

### `GET /v1/practice-items`

Query yang tersedia:

- `q`: search surah/id
- `level`: filter level
- `tag`: filter tag
- `limit`: default 20, max 100
- `cursor`: pagination cursor

### `GET /v1/practice-items/{itemId}`

Dipakai sebelum user mulai rekaman. Response detail berisi:

- teks Arab
- translation
- latin hint
- focus
- estimated minutes
- `segments` untuk highlight kata
- `referenceAudioUrl` bila ada

## Endpoint Session dan Recording

### `POST /v1/practice-sessions`

Request:

```json
{
  "practiceItemId": "ad_dhuha_1",
  "clientSessionId": "client_uuid_001",
  "device": {
    "platform": "android",
    "model": "Pixel",
    "appVersion": "1.0.0"
  }
}
```

Response penting:

```json
{
  "session": {
    "id": "session_...",
    "practiceItemId": "ad_dhuha_1",
    "status": "started"
  },
  "realtime": {
    "url": "ws://127.0.0.1:8000/v1/realtime/practice-sessions/session_...",
    "token": "...",
    "expiresIn": 900
  },
  "upload": {
    "mode": "chunked",
    "chunkSizeBytes": 32768,
    "acceptedMimeTypes": ["audio/webm", "audio/mp4", "audio/m4a", "audio/wav"],
    "maxDurationSeconds": 120
  }
}
```

Catatan app:

- Simpan `session.id`.
- WebSocket dipakai untuk progress upload/evaluasi.
- Upload chunked direkomendasikan untuk recording panjang/realtime.
- Upload simple cukup untuk MVP bila rekaman dikirim setelah selesai.

## Upload Simple

### `POST /v1/practice-sessions/{sessionId}/audio`

Content type: `multipart/form-data`.

Field:

- `file`: file audio
- `mimeType`: contoh `audio/m4a`
- `durationMs`: durasi rekaman
- `sampleRate`: contoh `16000`
- `channels`: contoh `1`
- `codec`: contoh `aac` atau `opus`

Response:

```json
{
  "audio": {
    "id": "audio_...",
    "sessionId": "session_...",
    "audioUrl": "private://audio/session_.../audio_....m4a",
    "durationMs": 15000,
    "mimeType": "audio/m4a",
    "status": "uploaded"
  }
}
```

## Upload Chunked

### 1. Init

`POST /v1/practice-sessions/{sessionId}/audio/chunks/init`

```json
{
  "mimeType": "audio/webm",
  "durationLimitMs": 120000,
  "sampleRate": 16000,
  "channels": 1,
  "expectedChunkSizeBytes": 32768
}
```

### 2. Upload part

`POST /v1/practice-sessions/{sessionId}/audio/chunks/{uploadId}`

Content type: `application/octet-stream`.

Header per chunk:

```http
X-Chunk-Index: 0
X-Chunk-Start-Ms: 0
X-Chunk-End-Ms: 1000
X-Chunk-Checksum-Sha256: <optional-sha256>
```

### 3. Complete

`POST /v1/practice-sessions/{sessionId}/audio/chunks/{uploadId}/complete`

```json
{
  "totalChunks": 10,
  "durationMs": 15000,
  "finalChecksumSha256": null
}
```

Response akan mengembalikan `audio.id`. ID ini bisa dipakai untuk evaluasi.

## Endpoint Evaluasi

### `POST /v1/practice-sessions/{sessionId}/evaluate`

Request:

```json
{
  "audioId": "audio_..."
}
```

`audioId` boleh dikosongkan jika ingin memakai upload terbaru di session tersebut.

Response:

```json
{
  "evaluation": {
    "resultId": "result_...",
    "sessionId": "session_...",
    "status": "queued"
  }
}
```

Evaluasi berjalan async. App bisa:

- dengarkan progress via WebSocket, atau
- polling `GET /v1/evaluation-results/{resultId}`.

### `GET /v1/evaluation-results/{resultId}`

Dipakai di screen hasil. Response berisi:

- `matchScore`: skor 0-100
- `confidenceLevel`: `low`, `medium`, atau `high`
- `summary`: ringkasan evaluasi awal
- `recommendation`: saran latihan
- `highlights`: status per kata/segmen
- `letterInsights`: insight huruf
- `status`: `completed` atau `failed`

Status highlight:

- `read`
- `current`
- `needs_check`
- `needs_retry`

## WebSocket Realtime

URL didapat dari `POST /v1/practice-sessions`:

```text
ws://127.0.0.1:8000/v1/realtime/practice-sessions/{sessionId}?token=<realtimeToken>
```

Event yang perlu di-handle app:

- `audio.chunk.received`
- `audio.uploaded`
- `evaluation.queued`
- `evaluation.processing`
- `evaluation.completed`
- `evaluation.failed`

Untuk MVP, WebSocket boleh ditunda dan app cukup polling hasil evaluasi.

## Error Handling

Response error standar punya request id. App sebaiknya log:

- HTTP status
- `code`
- `message`
- `details`
- `X-Request-Id`

Kode error yang umum:

- `auth_invalid_credentials`
- `auth_refresh_failed`
- `practice_not_found`
- `session_not_found`
- `session_invalid_state`
- `payload_too_large`
- `audio_upload_failed`
- `audio_chunk_missing`

## Saran Integrasi Per Screen

### Login/Register

Pakai:

- `POST /v1/auth/login`
- `POST /v1/auth/signup`
- `POST /v1/auth/refresh`

### Home

Pakai:

- `GET /v1/home`
- `GET /v1/practice-sessions?limit=5`

### Library Latihan

Pakai:

- `GET /v1/practice-items`
- `GET /v1/practice-items/{itemId}`
- `GET /v1/reference-audio/{fileKey}`

### Recorder

Pakai:

- `POST /v1/practice-sessions`
- `POST /v1/practice-sessions/{sessionId}/audio`
- atau chunked upload endpoints
- `POST /v1/practice-sessions/{sessionId}/evaluate`

### Result

Pakai:

- `GET /v1/evaluation-results/{resultId}`
- `POST /v1/practice-sessions/{sessionId}/evaluate/retry`

### Progress/Insight

Pakai:

- `GET /v1/practice-sessions`
- `GET /v1/insights/weekly`
- `GET /v1/insights/letter-mastery`

### Profile/Settings

Pakai:

- `GET /v1/profile`
- `PATCH /v1/profile`
- `PATCH /v1/profile/preferences`
- `POST /v1/auth/logout`

## Catatan Penting

- JSON pakai camelCase, bukan snake_case. Contoh: `accessToken`, `practiceItemId`, `audioId`.
- `reference-audio` tetap private dan butuh token.
- Hasil evaluasi adalah evaluasi awal, bukan fatwa/tajwid final.
- Backend bisa jalan tanpa model ONNX, tetapi endpoint evaluasi real butuh model di `external/zipformer_p-quran/`.
