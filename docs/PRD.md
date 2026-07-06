# Product Requirement Document

## Vision
Sobat Ngaji menjadi pendamping latihan membaca Al-Qur'an yang tenang, presisi, dan mudah dipakai setiap hari. Aplikasi ini membantu pengguna berlatih secara mandiri dengan referensi audio, rekaman suara, dan evaluasi awal berbasis AI.

## Mission
- Membuat latihan bacaan Al-Qur'an terasa ringan untuk dimulai.
- Membantu pengguna memahami bagian bacaan yang sudah baik dan bagian yang perlu diulang.
- Menjadikan AI sebagai learning companion yang memberi arahan personal, bukan hakim benar-salah.
- Menjaga pengalaman belajar tetap hormat terhadap teks Al-Qur'an.

## Problem
Pembelajar sering ingin latihan di luar kelas, tetapi tidak punya feedback langsung. Mereka tidak selalu tahu apakah pelafalan sudah mendekati contoh, huruf mana yang perlu dilatih, atau bagian mana yang sebaiknya diulang.

## Solution
Sobat Ngaji menyediakan alur latihan singkat:
1. Pilih latihan harian atau materi.
2. Dengarkan audio referensi.
3. Rekam bacaan.
4. Terima evaluasi awal dari AI.
5. Ulangi bagian yang direkomendasikan atau lanjut ke latihan berikutnya.

## Target User
- Pemula yang sedang belajar membaca Al-Qur'an.
- Siswa, santri, mahasiswa, dan peserta kelas ngaji.
- Pengguna umum yang ingin menjaga rutinitas latihan pendek.
- Pembimbing yang pada fase lanjut membutuhkan ringkasan perkembangan murid.

## Use Case
- Pengguna membuka aplikasi dan langsung memulai Daily Qira.
- Pengguna memilih surah pendek untuk latihan mandiri.
- Pengguna mendengar audio referensi sebelum merekam.
- Pengguna merekam bacaan dan melihat bagian yang perlu dicek.
- Pengguna melihat Insight untuk tahu huruf yang paling perlu dilatih.
- Pengguna mengikuti rekomendasi AI untuk latihan berikutnya.

## Feature Tree
```text
Sobat Ngaji
├── Authentication
│   ├── Sign in
│   ├── Sign up
│   └── Session restore
├── Home
│   ├── Daily Qira
│   ├── AI greeting
│   └── Weekly snapshot
├── Practice
│   ├── Practice item list
│   ├── Reference audio
│   ├── Recording
│   ├── AI processing
│   └── Evaluation result
├── Insight
│   ├── Weekly report
│   ├── Letter mastery
│   ├── Score trend
│   └── Smart suggestion
├── Profile
│   ├── User profile
│   ├── Preferences
│   └── Learning summary
└── System
    ├── Local storage
    ├── API client
    ├── Error handling
    └── Analytics events
```

## User Journey
### First Open
1. User membuka aplikasi.
2. User melihat onboarding singkat tentang fungsi Sobat Ngaji.
3. User login atau masuk sebagai guest jika mode guest diaktifkan.
4. User diarahkan ke Home.

### Daily Practice
1. User melihat Daily Qira sebagai hero utama.
2. User tap Start Practice.
3. User mendengar reference audio.
4. User merekam bacaan.
5. User melihat state AI sedang memproses.
6. User menerima score kecocokan, highlight, dan rekomendasi.
7. User mengulang atau lanjut.

### Weekly Review
1. User membuka Insight.
2. User melihat tren mingguan.
3. User melihat huruf dengan mastery rendah.
4. User mendapat rekomendasi latihan berikutnya.

## MVP
- Authentication dasar.
- Home dengan Daily Qira.
- Bottom navigation: Home, Practice, Insight, Profile.
- Practice item list berbasis data lokal atau mock API.
- Reference audio player.
- Recording UI.
- Mock AI evaluation.
- Evaluation result dengan score, highlight, dan recommendation.
- Insight sederhana.
- Profile dasar.

## Soon
- Backend API.
- Upload audio.
- Real AI evaluation pipeline.
- Persistent practice history.
- Letter mastery berdasarkan data aktual.
- Weekly report yang lebih personal.

## Future
- Review pembimbing atau guru.
- Kurikulum belajar bertahap.
- Mode latihan makhraj per huruf.
- Multi-device sync.
- Offline-first practice mode.
- Teacher dashboard.

## Product Principles
- Jangan menyebut hasil AI sebagai keputusan final.
- Gunakan istilah "evaluasi awal", "kecocokan", "perlu dicek", dan "perlu diulang".
- Arabic text adalah konten utama dan harus selalu diperlakukan dengan ruang visual yang baik.
- Jangan membuat UI terasa seperti dashboard admin, finance app, atau aplikasi Islam generik.

