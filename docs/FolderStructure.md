# Folder Structure

## Target Structure
```text
lib/
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme.dart
├── core/
│   ├── config/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── storage/
│   └── utils/
├── shared/
│   ├── models/
│   ├── providers/
│   ├── theme/
│   └── widgets/
└── features/
    ├── auth/
    ├── home/
    ├── practice/
    ├── recording/
    ├── evaluation/
    ├── insight/
    └── profile/
```

## Feature Structure
```text
features/practice/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   └── repositories/
├── presentation/
│   ├── controllers/
│   ├── screens/
│   └── widgets/
└── practice.dart
```

## Rules
- `core/` berisi infrastruktur global.
- `shared/` berisi komponen reusable lintas feature.
- `features/` berisi domain aplikasi.
- Jangan taruh widget spesifik feature di `shared/`.
- Jangan taruh API client spesifik feature langsung di screen.
- Export feature melalui file barrel jika membantu, misalnya `practice.dart`.

## Initial Feature Ownership
- `auth`: login, signup, session.
- `home`: Daily Qira, AI greeting, snapshot.
- `practice`: materi latihan dan reference audio.
- `recording`: recorder, waveform, microphone permission.
- `evaluation`: AI processing dan result.
- `insight`: weekly report, mastery, trend.
- `profile`: user profile dan preferences.

