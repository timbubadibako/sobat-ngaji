# Software Requirements Specification

## Scope
SRS ini mendefinisikan kebutuhan software untuk MVP Sobat Ngaji.

## Functional Requirements
### Authentication
- User dapat sign up.
- User dapat sign in.
- User dapat logout.
- App dapat restore session saat dibuka ulang.

### Home
- App menampilkan Daily Qira sebagai hero utama.
- App menampilkan AI greeting yang relevan dengan latihan user.
- App menampilkan ringkasan progres mingguan.
- User dapat memulai latihan dari Daily Qira.

### Practice
- User dapat melihat daftar materi latihan.
- User dapat membuka detail latihan.
- User dapat memutar audio referensi.
- User dapat mulai recording.
- User dapat melihat status recording.

### Recording
- App meminta microphone permission sebelum recording.
- App menampilkan recording duration.
- App menampilkan waveform atau visual feedback.
- User dapat stop dan submit recording.
- Recording flow terhubung ke realtime state berbasis WebSocket atau mock WebSocket adapter pada prototype.

### Evaluation
- App menampilkan AI processing state.
- AI processing state diterima melalui WebSocket event.
- App menampilkan score kecocokan.
- App menampilkan confidence level.
- App menampilkan highlight segmen bacaan.
- App menampilkan summary dan recommendation.
- User dapat retry atau lanjut.

### Insight
- App menampilkan weekly score.
- App menampilkan weekly trend.
- App menampilkan letter mastery.
- App menampilkan smart suggestion.

### Profile
- App menampilkan identitas user.
- App menampilkan learning summary.
- App menampilkan preferences.
- User dapat logout.

## Non-Functional Requirements
- UI mobile-first.
- Tap target minimal 44x44.
- Kontras teks mengikuti WCAG AA.
- App harus punya loading, empty, error, dan success state.
- App harus tetap usable pada koneksi lambat.
- Audio recording harus transparan kepada user.
- Data audio diperlakukan sebagai data sensitif.

## Constraints
- Material 3.
- Riverpod.
- GoRouter.
- Dio.
- Hive.
- WebSocket untuk realtime recording/evaluation state.
- Feature-first architecture.
- Repository Pattern.

## Acceptance Baseline
Feature belum dianggap selesai jika:
- UI memanggil API langsung.
- Business logic berada di widget.
- Palette berubah tanpa approval.
- Tidak ada error state untuk async flow.
- Tidak ada acceptance criteria yang bisa diuji.
