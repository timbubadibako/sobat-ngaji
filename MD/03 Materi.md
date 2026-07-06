# Materi

Dokumen ini menjadi bahan kerja ringkas untuk proposal dan prototype **Sobat Ngaji**. Detail akademik tetap ada di [[09 Matriks Konteks Referensi]] dan [[10 Paper Notes dan Relevansi Kutipan]].

## Identitas Karya

- Nama produk: Sobat Ngaji
- Divisi lomba: Inovasi Teknologi Digital Pendidikan (ITDP)
- Jenis karya: aplikasi mobile pendidikan berbasis AI
- Fokus: evaluasi awal bacaan Al-Qur'an secara mandiri
- Target pengguna: pemula, siswa, santri, mahasiswa, peserta kelas ngaji, dan masyarakat umum

## Judul Rekomendasi

Sobat Ngaji: Inovasi Asisten Pintar Evaluasi Bacaan Al-Qur'an Berbasis Artificial Intelligence sebagai Solusi Literasi Digital Berdampak Nyata

## Deskripsi Singkat

Sobat Ngaji merupakan aplikasi pendidikan cerdas yang membantu pelajar dan pemula mengevaluasi bacaan Al-Qur'an secara mandiri. Dengan memanfaatkan Artificial Intelligence (AI) dan Automatic Speech Recognition (ASR), sistem menganalisis rekaman suara pengguna dan mencocokkannya dengan frasa ayat referensi yang telah dipilih. Pengguna menerima skor kecocokan, indikator bagian yang perlu diperbaiki, serta umpan balik dasar sebagai panduan latihan. Aplikasi ini menjadi alat bantu latihan mandiri tanpa menggantikan peran guru atau pembimbing.

## Masalah Utama

- Latihan membaca Al-Qur'an masih sangat bergantung pada guru atau pendamping.
- Pengguna yang belajar mandiri sering tidak mendapat umpan balik setelah membaca.
- Banyak aplikasi masih berfokus pada teks, audio, hafalan, atau materi pasif.
- Koreksi bacaan bebas tanpa referensi terlalu berat untuk MVP.

## Gagasan Solusi

Sobat Ngaji memakai pendekatan **latihan per frasa**. Pengguna memilih surah, ayat, lalu frasa pendek yang dikurasi. Setelah mendengar referensi dan merekam bacaan, sistem mencocokkan audio pengguna dengan frasa referensi lalu menampilkan evaluasi awal.

Pendekatan per frasa dipilih agar demo lebih fokus, feedback lebih mudah dipahami, dan scope prototype tetap realistis.

## Prinsip Produk

- Alat bantu latihan, bukan pengganti guru.
- Evaluasi awal, bukan penentu benar-salah mutlak.
- Fokus MVP pada frasa kurasi, bukan seluruh Al-Qur'an.
- Tajwid detail dan makhraj lengkap menjadi fitur lanjutan.
- Klaim proposal harus selalu didukung referensi atau batasan yang jelas.

## Struktur Aplikasi

Navbar final:

```text
Home | Practice | Insight | Profile
```

### Home

Dashboard awal untuk mengarahkan pengguna.

- Daily Qira sebagai hero card
- Continue Practice
- Weekly Progress ringkas
- Recent Practice

Daily Qira bukan menu navbar. Daily Qira adalah pemicu latihan harian yang langsung masuk ke Practice.

### Practice

Tempat latihan utama.

```text
Choose Surah
↓
Choose Ayat
↓
Choose Frasa
↓
Listen Reference
↓
Record Reading
↓
AI Processing
↓
Result
```

### Insight

Untuk MVP, Insight cukup sederhana:

- skor latihan terakhir
- rata-rata skor minggu ini
- frasa yang perlu diulang
- rekomendasi latihan sederhana

### Profile

Untuk MVP, Profile cukup sederhana:

- nama pengguna
- target latihan
- streak
- settings

## MVP Wajib

1. Home dengan Daily Qira.
2. Practice per frasa.
3. Listen reference.
4. Record reading.
5. AI processing atau mock processing untuk demo awal.
6. Result berisi skor, indikator bagian, dan feedback dasar.
7. Retry Frasa atau Next Frasa.

## MVP Pendukung

- Insight sederhana.
- Profile sederhana.
- Riwayat latihan ringkas.
- Rekomendasi latihan sederhana berdasarkan hasil terakhir.

## Fitur Lanjutan

- Koreksi tajwid detail.
- Deteksi makhraj huruf.
- Pengenalan ayat otomatis.
- Dashboard guru.
- Gamification lanjutan.
- Rekomendasi latihan personal.
- Riwayat audio lengkap.

## Batasan MVP

MVP tidak mencakup:

- seluruh surah Al-Qur'an
- koreksi tajwid menyeluruh
- deteksi makhraj lengkap
- real-time correction
- sertifikasi kemampuan baca
- monitoring wali murid
- administrasi lembaga

## Output Evaluasi

Contoh hasil:

```text
Frasa:
ٱهْدِنَا ٱلصِّرَٰطَ

Score:
82%

Perlu diperhatikan:
- Huruf ص perlu dibaca lebih tebal.
- Panjang mad perlu lebih stabil.

Feedback:
Ulangi frasa ini dengan fokus pada ketebalan huruf ص dan kestabilan panjang bacaan.
```

## Kebutuhan Data

- Teks ayat Al-Qur'an yang valid.
- Segmentasi frasa yang dikurasi tim.
- Audio referensi dengan lisensi jelas.
- Rekaman pengguna untuk uji coba terbatas.
- Masukan guru/pembimbing untuk validasi awal.

## Komponen Sistem

1. Mobile app: Home, Practice, Result, Insight, Profile.
2. Data referensi: surah, ayat, frasa, fokus huruf/tajwid dasar, audio referensi.
3. Audio processing: rekaman, normalisasi, preprocessing dasar.
4. AI/ASR module: transkripsi atau matching audio terhadap frasa referensi.
5. Evaluation engine: skor, indikator bagian, feedback, pembaruan Insight.

## Klaim Aman

- Membantu evaluasi awal bacaan.
- Membantu pengguna mengetahui bagian yang perlu diperbaiki.
- Mendukung latihan mandiri di luar pendampingan langsung.
- Mencocokkan rekaman bacaan dengan frasa referensi yang dipilih.
- Memberikan skor kecocokan dan umpan balik dasar.

## Klaim yang Harus Dihindari

- Mengoreksi seluruh tajwid secara sempurna.
- Menggantikan guru ngaji.
- Menjamin bacaan benar secara mutlak.
- Mendeteksi semua ayat otomatis.
- Menganalisis seluruh makhraj dan sifat huruf.
- Mengklaim akurasi tinggi sebelum validasi.

## Rencana Validasi

Responden:

- 5-10 pengguna pemula atau pelajar.
- 1-2 guru ngaji, ustaz, atau pembimbing.

Aspek yang diuji:

- kemudahan memilih frasa
- kemudahan merekam bacaan
- kejelasan hasil evaluasi
- kegunaan feedback
- kesesuaian positioning sebagai alat bantu

## Risiko dan Mitigasi

| Risiko | Mitigasi |
|---|---|
| ASR belum stabil untuk semua pengguna | Batasi MVP pada frasa kurasi dan gunakan klaim evaluasi awal. |
| Tajwid terlalu luas | Fokus pada indikator dasar; tajwid detail masuk fitur lanjutan. |
| Data audio terbatas | Gunakan data uji terbatas dengan persetujuan pengguna. |
| Demo terlalu kompleks | Gunakan flow Daily Qira ke satu frasa latihan. |
| Klaim terlalu tinggi | Ikuti bagian "Klaim Aman" dan "Klaim yang Harus Dihindari". |

## Demo LIDM 3 Menit

1. Masalah: pengguna sulit mengevaluasi bacaan secara mandiri.
2. Solusi: Sobat Ngaji sebagai asisten evaluasi awal berbasis AI/ASR.
3. Flow demo: Home -> Daily Qira -> Practice -> Listen -> Record -> Result -> Insight.
4. Kebaruan: evaluasi per frasa berbasis referensi.
5. Batasan: bukan pengganti guru dan bukan koreksi tajwid sempurna.
6. Dampak: latihan mandiri menjadi lebih terarah.

## Definisi Selesai untuk MVP

MVP cukup untuk proposal/demo jika:

- user bisa masuk dari Home ke Practice lewat Daily Qira.
- user bisa memilih frasa latihan.
- user bisa mendengar referensi.
- user bisa merekam bacaan.
- sistem menampilkan hasil berupa skor dan feedback dasar.
- Insight sederhana menunjukkan perkembangan latihan.
