# Feature Roadmap

## Sprint 1: Authentication
Requirement:
- User dapat login, signup, logout, dan restore session.

Output:
- Auth feature dengan repository, provider, screen, dan route.

Acceptance Criteria:
- App dapat menentukan user authenticated atau unauthenticated.
- UI tidak memanggil API auth langsung.
- Session restore berjalan saat app start.

## Sprint 2: Home
Requirement:
- Home menampilkan Daily Qira sebagai hero, AI greeting, dan weekly snapshot.

Output:
- Home feature dengan DailyQiraHero dan AI insight preview.

Acceptance Criteria:
- Daily Qira menjadi elemen visual utama.
- Bottom navigation aktif pada Home.
- Data berasal dari provider, bukan hardcoded langsung di widget final.

## Sprint 3: Practice
Requirement:
- User dapat memilih materi, memutar reference audio, dan masuk recording flow.

Output:
- Practice list, practice detail, audio reference controls.

Acceptance Criteria:
- Audio service terpisah dari UI.
- Practice item berasal dari repository.
- State loading, empty, dan error tersedia.

## Sprint 4: Realtime Recording
Requirement:
- User dapat merekam bacaan dengan visual waveform dan state recording berbasis WebSocket event.

Output:
- Recording feature/service.
- WebSocket realtime service.
- Mock WebSocket adapter untuk prototype jika backend belum siap.

Acceptance Criteria:
- Permission microphone ditangani.
- UI menampilkan recording duration.
- Recording lifecycle tidak bocor ke screen lain.
- Widget tidak subscribe WebSocket langsung.
- Realtime event masuk melalui service, repository, lalu controller.

## Sprint 5: AI Evaluation
Requirement:
- Recording diproses menjadi evaluation result dengan progress realtime melalui WebSocket.

Output:
- Evaluation repository, mock/real evaluation service, result UI.

Acceptance Criteria:
- Result menampilkan score, confidence, highlight, summary, dan recommendation.
- Copy menggunakan istilah evaluasi awal.
- Failed state dapat retry.
- Processing/completed/failed state diterima melalui event contract.

## Sprint 6: Insight
Requirement:
- User melihat tren latihan dan letter mastery.

Output:
- Insight screen, weekly report, letter accuracy visualization.

Acceptance Criteria:
- User dapat melihat huruf yang perlu dilatih.
- Data visualization mengikuti design guideline.

## Sprint 7: Profile
Requirement:
- User melihat profil, preferensi, dan ringkasan latihan.

Output:
- Profile feature.

Acceptance Criteria:
- Preferences tersimpan lokal atau remote sesuai backend readiness.
- Logout tersedia jika auth aktif.

## Sprint 8: Optimization
Requirement:
- Stabilkan performance, testing, accessibility, dan polish.

Output:
- Test coverage flow utama, reduced motion, cache handling, error polish.

Acceptance Criteria:
- Flutter analyze bersih.
- Test utama pass.
- UI konsisten dengan design guideline.
