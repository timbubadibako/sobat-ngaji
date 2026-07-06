# Matriks Konteks Referensi

Catatan ini mengubah folder `Referensi/` menjadi bahan kerja proposal: setiap paper diposisikan sebagai sumber klaim, gap, batasan, atau justifikasi desain Sobat Ngaji. Format sitasi bibliografi masih perlu dirapikan saat proposal final disusun.

## Ringkasan Arah Akademik

Referensi yang paling kuat mendukung Sobat Ngaji berada pada tiga poros:

1. Kebutuhan pembelajaran: koreksi bacaan Al-Qur'an masih bergantung pada guru atau pembimbing, sehingga latihan mandiri membutuhkan alat bantu umpan balik awal.
2. Kelayakan teknologi: ASR, deep learning, MFCC, CNN, CTC, attention, dan model fonem sudah banyak dipakai untuk pengenalan/analisis suara bacaan Al-Qur'an.
3. Gap implementasi: banyak riset masih fokus pada pengenalan bacaan, hafalan, reciter profesional, surah terbatas, atau klasifikasi tajwid tertentu. Sobat Ngaji bisa mengambil posisi sebagai aplikasi MVP yang terarah, yaitu membandingkan rekaman pengguna terhadap ayat referensi yang dipilih.

## Paper Prioritas

| Prioritas | File | Fungsi untuk Proposal | Klaim yang Bisa Dipakai |
|---|---|---|---|
| Sangat tinggi | `qArI_A_Hybrid_CTC_Attention-Based_Model_for_Quran_Recitation_Recognition_Using_Bidirectional_LSTMP_in_an_End-to-End_Architecture.pdf` | Dasar teknis Quran recitation recognition modern | Quran speech recognition masih menantang karena kompleksitas bahasa, aturan tajwid, variasi reciter, dan keterbatasan dataset komprehensif. |
| Sangat tinggi | `Speaker-Independent_Phoneme-Based_Automatic_Quranic_Speech_Recognition_Using_Deep_Learning.pdf` | Gap pengguna normal/non-profesional | Banyak sistem lebih kuat pada reciter profesional; performa pada perempuan, anak-anak, dan reciter normal lebih menantang. |
| Sangat tinggi | `Paper_97-Speech_Recognition_Models_for_Holy_Quran_Recitation.pdf` | Literatur review dan gap riset | Holy Quran Speech Recognition masih tahap berkembang; riset sering terbatas pada dataset kecil, surah tertentu, dan pendekatan yang belum end-to-end. |
| Tinggi | `Al-Quran_Recitation_or_Sound_Processing_Analysis__A_Systematic_Literature_Review_on_Methods.pdf` | Justifikasi metode audio processing | Kajian sistematis menunjukkan teknologi AI dan sound processing berpotensi membantu verifikasi hafalan dan bacaan Al-Qur'an ketika pendamping tidak selalu tersedia. |
| Tinggi | `cices,+Journal+editor,+7.+Implementasi+Automatic+Speech+Recognition+Pada+Penilaian+Hafalan+Al-Quran+Dengan+Metode+Muroja’ah+Berbasis+Android (2).pdf` | Bukti aplikasi mobile/Android sejenis | ASR sudah diimplementasikan pada aplikasi Android untuk penilaian hafalan Al-Qur'an dan mendukung pembelajaran mandiri. |
| Tinggi | `DATASE~1.PDF` / `15546-Article Text-60013-58999-10-20251128 (1).pdf` | Bukti klasifikasi tajwid berbasis audio | MFCC + CNN dapat digunakan untuk klasifikasi pola tajwid tertentu, tetapi ruang lingkupnya masih terbatas pada hukum tajwid tertentu. |
| Sedang | `QVR Quranic Verses Recitation Recognition System using PocketSphinx.pdf` | Contoh sistem pengenalan ayat terbatas | Pengenalan bacaan berbasis surah/ayat tertentu dapat menghasilkan evaluasi yang baik, tetapi cakupannya perlu diperluas untuk penggunaan umum. |
| Sedang | `Automatic Speech Recognition (ASR).pdf` | Dasar umum ASR untuk pembelajaran Arab/Qur'an | ASR relevan untuk pembelajaran bahasa Arab dan bacaan Al-Qur'an. |
| Sedang | `DeepNeuralNetworksforAcousticModelinginSpeechRecognitioneditorbyYoesoepEdhieRachmad.pdf` | Dasar teori deep learning untuk ASR | Deep neural networks menjadi fondasi penting dalam acoustic modeling untuk speech recognition. |
| Sedang | `SpeechRecognitionWithDeepRecurrentNeuralNetworkseditorbyYoesoepEdhieRachmad.pdf` | Dasar RNN untuk speech recognition | RNN/deep recurrent model relevan untuk memproses urutan suara. |
| Pendukung | `deterding11.pdf` | Gamification sebagai fitur lanjutan | Gamification dapat diposisikan sebagai penggunaan elemen desain game di konteks non-game, cocok untuk fitur motivasi latihan. |
| Pendukung | `12+Lusianasta.pdf`, `1225-Article Text-1569-1-10-20231230.pdf`, `1710-Article Text-3488-1-10-20230825.pdf` | Dasar pembelajaran tahsin/tajwid | Pembelajaran bacaan Al-Qur'an membutuhkan ketepatan makharijul huruf, tajwid, dan pendampingan. |

## Gap yang Bisa Dijadikan Narasi Proposal

### Gap 1: Ketergantungan pada Guru atau Pendamping

Banyak proses belajar membaca Al-Qur'an mengandalkan guru, ustaz, atau pembimbing yang mendengar bacaan secara langsung. Metode ini efektif, tetapi tidak selalu tersedia untuk latihan mandiri yang fleksibel.

**Posisi Sobat Ngaji:** menjadi alat bantu latihan awal di luar sesi tatap muka, bukan pengganti guru.

### Gap 2: Sistem Quran ASR Masih Menantang untuk Pengguna Umum

Referensi Quran ASR modern menunjukkan bahwa performa sistem dipengaruhi variasi reciter, usia, gender, aksen, tempo, tingkat tajwid, dan kualitas audio. Sistem yang baik pada reciter profesional belum tentu sama kuat pada pengguna pemula.

**Posisi Sobat Ngaji:** tidak mengklaim koreksi sempurna, tetapi memberi evaluasi awal dan umpan balik dasar pada ruang lingkup MVP.

### Gap 3: Banyak Riset Masih Terbatas pada Dataset, Surah, atau Aturan Tertentu

Beberapa sistem memakai surah atau ayat tertentu, dataset terbatas, atau fokus pada hukum tajwid tertentu seperti nun sukun/tanwin. Ini menunjukkan bahwa sistem penuh untuk seluruh bacaan Al-Qur'an masih kompleks.

**Posisi Sobat Ngaji:** menggunakan pendekatan berbasis ayat referensi yang dipilih pengguna agar evaluasi lebih terarah dan realistis untuk prototype.

### Gap 4: Aplikasi yang Ada Cenderung Fokus pada Hafalan atau Materi Pasif

Referensi aplikasi Android menunjukkan ASR bisa digunakan untuk penilaian hafalan. Namun Sobat Ngaji dapat dibedakan dengan fokus pada latihan bacaan berbasis ayat referensi, skor kecocokan, dan indikator bagian yang perlu diperbaiki.

**Posisi Sobat Ngaji:** bukan sekadar aplikasi teks/audio murottal atau hafalan, tetapi asisten evaluasi bacaan aktif.

### Gap 5: Koreksi Tajwid Detail Masih Perlu Batasan

Paper tajwid berbasis CNN/MFCC menunjukkan klasifikasi tajwid bisa dilakukan, tetapi biasanya pada kategori tertentu dan membutuhkan dataset terlabel. Koreksi seluruh tajwid, makhraj, dan sifat huruf terlalu luas untuk MVP.

**Posisi Sobat Ngaji:** fitur inti adalah kecocokan lafaz dan kelancaran bacaan; koreksi tajwid detail ditempatkan sebagai pengembangan lanjutan.

## Klaim Aman untuk Proposal

Gunakan klaim berikut di proposal:

- Sobat Ngaji membantu evaluasi awal bacaan Al-Qur'an secara mandiri.
- Sobat Ngaji mencocokkan rekaman pengguna dengan ayat referensi yang dipilih.
- Sobat Ngaji memberikan skor kecocokan dan indikator bagian bacaan yang perlu diperbaiki.
- Sobat Ngaji memanfaatkan pendekatan ASR/audio processing sebagai dasar evaluasi bacaan.
- Sobat Ngaji mendukung latihan mandiri di luar sesi pendampingan langsung.
- Sobat Ngaji tidak menggantikan peran guru, ustaz, atau pembimbing.
- Sobat Ngaji menjaga scope MVP agar realistis untuk prototype LIDM ITDP.

Hindari klaim berikut:

- Mengoreksi seluruh tajwid secara sempurna.
- Menjamin bacaan benar secara mutlak.
- Menggantikan guru ngaji.
- Mendeteksi semua ayat secara otomatis tanpa batasan.
- Menganalisis seluruh makhraj dan sifat huruf secara lengkap.
- Real-time penuh jika prototype belum benar-benar memproses langsung tanpa jeda.

## Contoh Paragraf Latar Belakang Berbasis Referensi

Pembelajaran bacaan Al-Qur'an membutuhkan ketepatan pelafalan, kelancaran, serta kesesuaian terhadap kaidah tajwid. Dalam praktiknya, koreksi bacaan masih banyak bergantung pada guru atau pembimbing yang mendengarkan bacaan secara langsung. Pola tersebut efektif, tetapi tidak selalu dapat memenuhi kebutuhan latihan mandiri yang fleksibel. Sejumlah penelitian menunjukkan bahwa teknologi automatic speech recognition dan pemrosesan suara mulai digunakan untuk membantu pengenalan, verifikasi, dan evaluasi bacaan Al-Qur'an. Namun, riset Quran speech recognition masih menghadapi tantangan seperti keterbatasan dataset, variasi reciter, kondisi audio, serta kompleksitas tajwid. Oleh karena itu, Sobat Ngaji dirancang sebagai aplikasi mobile yang berfokus pada evaluasi awal berbasis ayat referensi, sehingga cakupan prototype tetap realistis, terarah, dan dapat divalidasi.

## Contoh Paragraf Research Gap

Kajian terhadap penelitian sebelumnya menunjukkan bahwa pengembangan sistem pengenalan bacaan Al-Qur'an masih memiliki beberapa keterbatasan. Sebagian riset berfokus pada pengenalan bacaan oleh reciter profesional, surah tertentu, atau klasifikasi hukum tajwid tertentu. Di sisi lain, aplikasi pembelajaran yang tersedia cenderung menekankan penyediaan materi, audio, atau hafalan, belum sepenuhnya memberi umpan balik aktif terhadap bacaan pengguna pemula. Kesenjangan ini membuka peluang pengembangan Sobat Ngaji sebagai asisten evaluasi bacaan yang membandingkan rekaman pengguna dengan ayat referensi yang dipilih, lalu menyajikan skor kecocokan dan umpan balik dasar.

## Pemetaan ke Struktur Proposal

| Bagian Proposal | Referensi Utama | Cara Pakai |
|---|---|---|
| Latar belakang | Paper pembelajaran tahsin/tajwid, systematic review, Al-Fadhli overview | Jelaskan pentingnya koreksi bacaan dan kebutuhan alat bantu mandiri. |
| Research gap | Al-Fadhli overview, qArI, Al-Zaro | Tunjukkan bahwa Quran ASR masih menantang dan banyak riset terbatas pada dataset/skenario tertentu. |
| Solusi | Android ASR muroja'ah, QVR, qArI | Jelaskan bahwa ASR dapat diterapkan pada aplikasi, tetapi Sobat Ngaji mengambil pendekatan referensi ayat agar lebih realistis. |
| Metode | qArI, Al-Zaro, MFCC-CNN paper | Jelaskan komponen audio processing, ASR, pencocokan ayat referensi, dan evaluasi. |
| Batasan MVP | Al-Zaro, MFCC-CNN paper, QVR | Justifikasi bahwa koreksi tajwid penuh dan pengguna umum sangat kompleks, sehingga MVP dibatasi. |
| Dampak | systematic review, pembelajaran tahsin/tajwid | Tekankan latihan mandiri, akses pembelajaran, dan pendampingan guru. |
| Fitur lanjutan | Deterding et al. | Gamification bisa dipakai untuk riwayat latihan, badge, streak, atau rekomendasi latihan. |

## Rekomendasi Daftar Pustaka Final

Untuk proposal tahap awal, prioritaskan 8-10 referensi berikut:

1. Al-Fadhli et al. tentang overview speech recognition model untuk Holy Quran recitation.
2. Alfadhli et al. tentang qArI hybrid CTC/attention untuk Quran recitation recognition.
3. Al-Zaro et al. tentang speaker-independent phoneme-based Quranic ASR.
4. Paper systematic literature review tentang Al-Quran recitation/sound processing.
5. Al-Kaf et al. tentang QVR menggunakan PocketSphinx.
6. Sujjada et al. tentang implementasi ASR untuk penilaian hafalan berbasis Android.
7. Salim et al. tentang CNN-MFCC untuk pengenalan hukum tajwid.
8. Hinton/Graves/deep learning speech recognition sebagai dasar teori ASR modern.
9. Satu sampai dua paper pembelajaran tahsin/tajwid sebagai dasar kebutuhan pendidikan.
10. Deterding et al. hanya jika proposal memasukkan gamification sebagai fitur lanjutan.

## Catatan Strategis

Framing paling kuat untuk Sobat Ngaji:

> Banyak riset membuktikan ASR dan audio processing berpotensi membantu pengenalan bacaan Al-Qur'an, tetapi sistem yang benar-benar akurat untuk semua pengguna dan seluruh aspek tajwid masih kompleks. Karena itu Sobat Ngaji mengambil pendekatan bertahap: pengguna memilih ayat referensi, membaca ayat tersebut, lalu sistem memberi evaluasi awal berupa skor kecocokan dan indikator bagian yang perlu diperbaiki.

Framing ini defensible karena tidak overclaim, tetap inovatif, dan cocok untuk target prototype LIDM ITDP.
