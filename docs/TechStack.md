# Tech Stack

## Mobile App
- Flutter 3+
- Dart 3+
- Material 3

## State Management
- Riverpod.
- Provider digunakan sebagai dependency injection layer.
- Async state memakai `AsyncValue` atau sealed state class sesuai kebutuhan fitur.

## Navigation
- GoRouter.
- Bottom navigation untuk main shell.
- Route per feature agar modular.

## Networking
- Dio untuk HTTP client.
- Interceptor untuk auth token, logging, timeout, dan error mapping.
- API client tidak boleh dipanggil langsung dari widget.

## Realtime
- WebSocket adalah transport realtime utama.
- Dipakai untuk recording session state, upload/evaluation progress, dan event hasil evaluasi.
- MVP tidak boleh memakai polling sebagai desain utama untuk flow realtime.
- Jika backend realtime belum siap, mock WebSocket adapter harus tetap mengikuti contract event WebSocket final.

## Local Storage
- Hive untuk cache ringan, preferences, dan local practice draft.
- Secure storage untuk token jika auth dipakai.

## Model Generation
- Freezed untuk immutable model dan union state.
- json_serializable untuk serialization.
- build_runner untuk generated files.

## Audio
- Audio player package untuk reference audio.
- Recorder package untuk microphone capture.
- Audio service dibungkus dalam abstraction agar mudah diganti.

## Backend Direction
- Supabase atau backend custom dapat dipakai pada fase API.
- Storage audio harus private.
- Evaluation service dipisah dari mobile app.

## Testing
- flutter_test untuk unit dan widget test.
- mocktail untuk mocking repository/service.
- integration_test untuk flow utama setelah MVP stabil.
