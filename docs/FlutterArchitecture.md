# Flutter Architecture

## Architecture
Sobat Ngaji memakai feature-first architecture dengan Repository Pattern dan MVVM-style presentation layer. Setiap feature memiliki UI, state/controller, model, dan repository sendiri jika domainnya spesifik.

## Principles
- Feature-first, bukan screen-first.
- UI hanya membaca state dan mengirim user intent.
- Controller/notifier mengatur state dan orchestrate use case.
- Repository menjadi boundary data.
- Service menangani integrasi teknis seperti audio, HTTP, storage, dan realtime.
- Shared component hanya dibuat jika dipakai lintas feature.

## Layers
```text
Presentation
├── Screen
├── Widget
└── Controller / Notifier

Domain
├── Entity / Model
├── Repository contract
└── Use case jika flow mulai kompleks

Data
├── Repository implementation
├── API client
├── Local data source
└── Service integration
```

## State
- Riverpod adalah state management utama.
- `ConsumerWidget` menjadi default widget.
- `ConsumerStatefulWidget` hanya dipakai untuk lifecycle lokal yang tidak bisa dihindari.
- State async tidak boleh disimpan sebagai bool terpisah yang rawan tidak sinkron jika `AsyncValue` cukup.

## Navigation
- GoRouter mengatur route.
- Main shell route berisi bottom navigation.
- Feature route didefinisikan modular.
- Jangan menaruh logic feature di router.

## Networking
- Dio menjadi HTTP client.
- Semua endpoint lewat API client atau data source.
- Repository melakukan mapping response ke model domain.
- Widget tidak tahu URL endpoint.

## Realtime
- WebSocket adalah bagian wajib dari arsitektur realtime Sobat Ngaji.
- WebSocket dipakai untuk recording session state, upload/evaluation progress, dan result event.
- Flow realtime tidak didesain dengan polling sebagai default.
- Untuk prototype, realtime boleh dimock melalui adapter lokal, tetapi interface dan event contract harus tetap menyerupai WebSocket final.

## Realtime Boundary
- Mobile app tidak melakukan inferensi AI berat secara langsung di widget.
- Recording UI mengirim intent ke controller.
- Controller berkomunikasi dengan repository.
- Repository memakai WebSocket service untuk subscribe progress dan result.
- UI hanya merender state dari Riverpod.

## Storage
- Hive untuk local cache dan preferences.
- Secure storage untuk credential/token.
- Jangan menyimpan audio sensitif tanpa alasan produk yang jelas.

## Dependency Injection
- Riverpod provider menjadi DI layer.
- Setiap service dan repository punya provider eksplisit.

Contoh:
```dart
final audioServiceProvider = Provider<AudioService>((ref) {
  return AudioService();
});

final practiceRepositoryProvider = Provider<PracticeRepository>((ref) {
  return PracticeRepositoryImpl(
    apiClient: ref.watch(apiClientProvider),
  );
});
```

## Repository Pattern
Repository bertanggung jawab:
- Mengambil data dari API/local.
- Menyembunyikan detail teknis.
- Mapping error teknis ke failure yang bisa dipahami UI.

Repository tidak bertanggung jawab:
- Menentukan layout.
- Menyimpan BuildContext.
- Menampilkan snackbar/dialog.

## MVVM Application
- View: Screen dan widget.
- ViewModel: Riverpod Notifier/Controller.
- Model: immutable data class.

## Public API Rule
Setiap feature harus punya entry point yang jelas. Feature lain tidak boleh import file internal secara acak jika cukup memakai exported widget/provider yang memang disediakan.
