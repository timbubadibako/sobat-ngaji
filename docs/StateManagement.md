# State Management

## Tool
Riverpod adalah state management dan dependency injection utama.

## Provider Types
- `Provider`: service, repository, config.
- `FutureProvider`: read-only async data sederhana.
- `NotifierProvider`: state yang punya action.
- `AsyncNotifierProvider`: async state dengan action.
- `StreamProvider`: realtime state dari WebSocket.
- WebSocket stream menjadi sumber event untuk recording/evaluation progress.

## Controller Rule
Controller bertanggung jawab:
- Mengelola state screen/feature.
- Memanggil repository.
- Mengubah result menjadi state UI.

Controller tidak bertanggung jawab:
- Build widget.
- Menyimpan BuildContext.
- Menampilkan dialog langsung.

## Example Shape
```dart
final practiceControllerProvider =
    AsyncNotifierProvider<PracticeController, PracticeState>(
  PracticeController.new,
);
```

## State Shape
State harus eksplisit:
```text
idle
loading
success
empty
error
```

Untuk recording:
```text
idle
permissionRequired
recording
paused
uploading
processing
completed
failed
```

## WebSocket State Flow
```text
WebSocket event
-> RealtimeService
-> Repository
-> Controller / AsyncNotifier
-> UI state
```

Widget tidak boleh subscribe WebSocket langsung.

## Anti-Patterns
- `setState` untuk business flow.
- Global mutable singleton.
- API call di `build`.
- Provider yang melakukan terlalu banyak hal lintas feature.
