# Backend Architecture

## Direction
Backend Sobat Ngaji bertanggung jawab untuk auth, practice data, audio storage, evaluation processing, dan insight aggregation.

## Components
```text
Mobile App
-> API Gateway
-> Auth Service
-> Practice Service
-> Audio Storage
-> Evaluation Service
-> Insight Service
-> Database
```

## Auth Service
- Login.
- Signup.
- Session refresh.
- User profile.

## Practice Service
- Menyediakan practice item.
- Membuat practice session.
- Menyimpan status session.

## Audio Storage
- Menyimpan recording secara private.
- Menghasilkan private URL.
- Mendukung retention policy.

## Evaluation Service
- Menerima audio.
- Menjalankan mock atau real AI evaluation.
- Mengembalikan evaluation result dengan contract stabil.

## Insight Service
- Menghitung weekly score.
- Menghitung letter mastery.
- Membuat smart suggestion.

## Realtime
WebSocket adalah channel realtime utama untuk:
- Recording session lifecycle.
- Audio upload progress.
- Evaluation processing status.
- Evaluation completed event.
- Evaluation failed event.

MVP tidak memakai polling sebagai arsitektur utama. Jika backend belum siap saat prototype, gunakan mock WebSocket service dengan event contract yang sama.

## WebSocket Event Contract
```text
recording.started
recording.stopped
audio.uploading
audio.uploaded
evaluation.processing
evaluation.completed
evaluation.failed
```

## Important Scope Note
WebSocket realtime tidak berarti MVP mengklaim koreksi tajwid real-time penuh. MVP fokus pada realtime session/progress dan evaluasi awal setelah rekaman diproses.
