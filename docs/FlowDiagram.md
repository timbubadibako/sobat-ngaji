# Flow Diagram

Dokumen ini berisi diagram alur utama agar agent tidak hanya membaca paragraf. Flow ini menjadi acuan saat membangun fitur dari sisi UI, state, API, WebSocket, dan AI.

## Main Practice Flow
```text
Home
↓
Daily Qira
↓
Practice Detail
↓
Reference Audio
↓
Recording
↓
WebSocket Session
↓
Upload Audio
↓
AI Processing
↓
Evaluation Result
↓
Insight Update
↓
Home Snapshot Update
```

## Bottom Navigation Flow
```text
App Shell
├── Home
├── Practice
├── Insight
└── Profile
```

Bottom navigation hanya untuk top-level destination. Daily Qira bukan tab baru.

## Home Flow
```text
Open App
↓
Restore Session
↓
Load Daily Qira
↓
Load Weekly Snapshot
↓
Show AI Greeting
↓
User taps Start Practice
↓
Practice Detail / Recording
```

## Practice Flow
```text
Practice Screen
↓
Search / Filter
↓
Select Practice Item
↓
Practice Detail
↓
Play Reference Audio
↓
Start Recording
```

## Recording Flow
```text
Tap Record
↓
Check Microphone Permission
↓
Open WebSocket Session
↓
Start Recorder
↓
Show Waveform
↓
Stop Recording
↓
Upload Audio
↓
Emit recording.stopped
↓
Wait evaluation events
```

## Evaluation Flow
```text
audio.uploaded
↓
evaluation.processing
↓
evaluation.completed / evaluation.failed
↓
Map response to EvaluationResult
↓
Render Score + Highlight + Recommendation
↓
Retry / Next Practice
```

## Insight Flow
```text
Evaluation Completed
↓
Save Practice Session
↓
Update Letter Mastery
↓
Update Weekly Trend
↓
Generate Smart Suggestion
↓
Insight Screen
```

## Scope Guard
Realtime WebSocket berarti realtime session/progress/event. MVP tidak mengklaim koreksi tajwid real-time penuh saat user membaca kecuali sistem benar-benar memproses dan menampilkan koreksi langsung.

