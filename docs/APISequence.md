# API Sequence

Dokumen ini menjelaskan urutan API dan WebSocket agar implementasi tidak salah urutan.

## Authentication Sequence
```text
Open App
↓
Read Secure Token
↓
GET /auth/me or restore session
↓
Authenticated?
├── Yes → App Shell
└── No → Login
```

## Practice List Sequence
```text
Open Practice
↓
GET /practice-items
↓
Map response to PracticeItem
↓
Render loading / empty / success / error
```

## Recording Sequence
```text
Tap Record
↓
Request Microphone Permission
↓
POST /practice-sessions
↓
Open WebSocket:
wss://api.sobat-ngaji.app/realtime/practice-sessions/{sessionId}
↓
Send recording.started
↓
Start local audio recorder
↓
Stop recorder
↓
Upload audio:
POST /practice-sessions/{sessionId}/audio
↓
Send recording.stopped
↓
Wait server events
```

## Evaluation Sequence
```text
Server emits audio.uploading
↓
Server emits audio.uploaded
↓
POST /practice-sessions/{sessionId}/evaluate
↓
Server emits evaluation.processing
↓
Server emits evaluation.completed
↓
GET result if needed
↓
Render EvaluationResult
```

## Failed Evaluation Sequence
```text
evaluation.failed
↓
Map errorCode to AppFailure
↓
Render retryable ErrorState
↓
User taps Retry
↓
Restart Recording Sequence
```

## Insight Update Sequence
```text
evaluation.completed
↓
Persist evaluation result
↓
Update letter_mastery
↓
Update weekly_report
↓
GET /insights/weekly
↓
Render Insight
```

## Rule
Widget tidak boleh memanggil API atau WebSocket langsung. Urutan ini dijalankan melalui controller, repository, dan service.

