# API Contract

## Principles
- API mendukung flow latihan: materi, recording, evaluation, insight, profile.
- Response harus stabil dan mudah dimapping ke immutable model.
- Error harus punya code yang bisa dipetakan ke user-friendly message.

## Error Shape
```json
{
  "error": {
    "code": "microphone_audio_invalid",
    "message": "Uploaded audio cannot be processed.",
    "requestId": "req_123"
  }
}
```

## Auth
### `POST /auth/login`
Request:
```json
{
  "email": "user@example.com",
  "password": "secret"
}
```

Response:
```json
{
  "accessToken": "token",
  "refreshToken": "refresh",
  "user": {
    "id": "user_001",
    "name": "Alya"
  }
}
```

## Practice Items
### `GET /practice-items`
Response:
```json
{
  "items": [
    {
      "id": "item_001",
      "surahName": "Ad-Dhuha",
      "ayahNumber": 1,
      "arabicText": "والضحى",
      "latinHint": "wad-duha",
      "referenceAudioUrl": "https://example.com/audio/ad-dhuha-1.mp3",
      "difficulty": "beginner"
    }
  ]
}
```

## Practice Session
### `POST /practice-sessions`
Request:
```json
{
  "practiceItemId": "item_001"
}
```

Response:
```json
{
  "id": "session_001",
  "practiceItemId": "item_001",
  "status": "started"
}
```

## Audio Upload
### `POST /practice-sessions/{sessionId}/audio`
Response:
```json
{
  "audioUrl": "https://example.com/private/session_001.m4a"
}
```

## Evaluation
### `POST /practice-sessions/{sessionId}/evaluate`
Request:
```json
{
  "audioUrl": "https://example.com/private/session_001.m4a"
}
```

Response:
```json
{
  "resultId": "result_001",
  "matchScore": 82,
  "confidenceLevel": "medium",
  "summary": "Bacaanmu cukup stabil. AI masih menemukan pola yang perlu dilatih pada huruf ض.",
  "recommendation": "Ulangi frasa pendek dengan fokus pada makhraj ض.",
  "highlights": [
    {
      "segment": "والضحى",
      "status": "needs_check",
      "note": "Perlu dicek pada pelafalan ض."
    }
  ],
  "letterInsights": [
    {
      "letter": "ض",
      "masteryScore": 42,
      "mistakeCount": 3
    }
  ]
}
```

## WebSocket
### Endpoint
```text
wss://api.sobat-ngaji.app/realtime/practice-sessions/{sessionId}
```

### Client Events
```json
{
  "type": "recording.started",
  "sessionId": "session_001"
}
```

```json
{
  "type": "recording.stopped",
  "sessionId": "session_001",
  "audioUrl": "https://example.com/private/session_001.m4a"
}
```

### Server Events
```json
{
  "type": "audio.uploading",
  "sessionId": "session_001",
  "progress": 42
}
```

```json
{
  "type": "evaluation.processing",
  "sessionId": "session_001",
  "message": "AI sedang mencocokkan bacaan dengan referensi."
}
```

```json
{
  "type": "evaluation.completed",
  "sessionId": "session_001",
  "resultId": "result_001"
}
```

```json
{
  "type": "evaluation.failed",
  "sessionId": "session_001",
  "errorCode": "audio_unprocessable"
}
```

## Insight
### `GET /insights/weekly`
Response:
```json
{
  "weeklyScore": 78,
  "improvement": 9,
  "focusLetter": "ض",
  "summary": "Performa meningkat minggu ini, namun huruf ض masih sering perlu diulang."
}
```
