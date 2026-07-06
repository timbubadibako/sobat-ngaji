# Error Matrix

Dokumen ini memastikan setiap flow punya state error yang jelas dan tidak teknis.

| Case | Source | UI Message | User Action | Technical Handling |
| --- | --- | --- | --- | --- |
| No internet | Dio/WebSocket | Koneksi internet terputus. Coba lagi setelah tersambung. | Retry | Exponential backoff untuk WebSocket reconnect |
| Microphone denied | Permission | Izin mikrofon belum aktif. Aktifkan untuk mulai merekam. | Open Settings | Jangan start recorder |
| Recording failed | AudioService | Rekaman belum berhasil dibuat. Coba rekam ulang. | Retry | Dispose recorder lalu init ulang |
| Upload failed | API | Audio belum berhasil dikirim. Coba unggah ulang. | Retry upload | Keep local audio path sementara |
| WebSocket disconnected | WebSocketService | Koneksi realtime terputus. Mencoba menyambungkan ulang. | Auto reconnect / Retry | Reconnect dengan sessionId yang sama |
| Evaluation failed | EvaluationService | Evaluasi awal belum berhasil. Kamu bisa coba rekam ulang. | Retry recording | Log errorCode dan requestId |
| Empty practice list | API | Materi latihan belum tersedia. | Refresh | Render EmptyState |
| Auth expired | AuthRepository | Sesi berakhir. Silakan masuk kembali. | Login | Clear token |
| Audio unprocessable | AI service | Audio belum cukup jelas untuk dievaluasi. Coba rekam di tempat lebih tenang. | Retry recording | Keep failure as retryable |

## UI Rules
- Error message tidak boleh menampilkan stack trace.
- Error harus memberi next action.
- Jangan menyalahkan user.
- Jika error terjadi saat membaca Al-Qur'an, copy tetap tenang dan hormat.

## Retry Rules
- Network retry maksimal 3 kali otomatis untuk request ringan.
- WebSocket reconnect boleh otomatis selama user masih berada di session.
- Upload audio retry harus menjaga local audio path.
- Evaluation retry sebaiknya mengulang dari recording jika audio tidak valid.

