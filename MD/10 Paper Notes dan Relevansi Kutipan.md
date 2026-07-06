# Paper Notes dan Relevansi Kutipan

Catatan ini dipakai untuk menentukan paper mana yang dikutip di bagian proposal LIDM ITDP. Fokusnya bukan membuat ringkasan semua PDF, tetapi memilih referensi yang paling berguna untuk memperkuat latar belakang, gap, metode, batasan MVP, dan dampak Sobat Ngaji.

## Peta Cepat Kutipan

| Bagian Proposal        | Referensi Utama                                                                  | Fungsi Kutipan                                                                                                            |
| ---------------------- | -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Latar belakang         | Paper tahsin/tajwid, systematic review Al-Quran sound processing, Sujjada et al. | Menjelaskan kebutuhan koreksi bacaan, keterbatasan pendamping, dan peluang teknologi.                                     |
| Research gap           | Al-Fadhli overview, qArI, Al-Zaro et al.                                         | Menjelaskan bahwa Quran ASR masih berkembang dan penuh tantangan.                                                         |
| Solusi yang ditawarkan | Sujjada et al., QVR PocketSphinx, qArI                                           | Menunjukkan bahwa ASR bisa dipakai untuk aplikasi bacaan Al-Qur'an, tetapi Sobat Ngaji mengambil pendekatan ayat referensi. |
| Metode pengembangan    | qArI, Al-Zaro et al., CNN-MFCC tajwid paper                                      | Mendukung desain audio processing, ASR, pencocokan bacaan, dan evaluasi berbasis skor.                                    |
| Analisis fungsional    | Sujjada et al., QVR PocketSphinx                                                 | Mendukung fitur rekam suara, proses audio, dan hasil evaluasi.                                                            |
| Desain produk          | Sujjada et al., mobile learning references                                       | Mendukung bentuk aplikasi mobile sebagai media latihan mandiri.                                                           |
| Batasan MVP            | Al-Zaro et al., qArI, CNN-MFCC tajwid paper                                      | Membenarkan kenapa Sobat Ngaji tidak mengklaim koreksi tajwid penuh.                                                        |
| Dampak karya           | Systematic review, paper pembelajaran tahsin/tajwid                              | Mendukung dampak pada akses latihan mandiri dan pembelajaran digital.                                                     |
| Fitur lanjutan         | Deterding et al.                                                                 | Dipakai hanya jika gamification dimasukkan sebagai pengembangan, bukan inti MVP.                                          |

## Paper Notes Prioritas

### 1. qArI: Hybrid CTC/Attention-Based Quran Recitation Recognition

**File:** `qArI_A_Hybrid_CTC_Attention-Based_Model_for_Quran_Recitation_Recognition_Using_Bidirectional_LSTMP_in_an_End-to-End_Architecture.pdf`

**Inti paper:** Paper ini membahas model end-to-end untuk Quran recitation recognition menggunakan kombinasi CTC/attention dan BLSTMP. Paper juga menyoroti tantangan Quran speech recognition seperti kompleksitas bahasa, aturan tajwid, variasi reciter, dan kebutuhan dataset komprehensif.

**Relevansi untuk Sobat Ngaji:** Sangat kuat untuk membangun research gap dan dasar teknis. Paper ini membantu menjelaskan bahwa teknologi Quran ASR memang relevan, tetapi problemnya kompleks sehingga Sobat Ngaji harus mengambil scope MVP yang terarah.

**Masuk ke bagian:** Latar belakang, research gap, metode, batasan MVP.

**Cara mengutip dalam narasi:** Gunakan untuk menyatakan bahwa pengenalan bacaan Al-Qur'an berbasis ASR masih merupakan area riset yang menantang karena faktor dataset, variasi reciter, dan kompleksitas tajwid.

### 2. Speaker-Independent Phoneme-Based Automatic Quranic Speech Recognition

**File:** `Speaker-Independent_Phoneme-Based_Automatic_Quranic_Speech_Recognition_Using_Deep_Learning.pdf`

**Inti paper:** Paper ini membahas Quranic ASR berbasis fonem untuk berbagai kelompok pengguna. Poin pentingnya: banyak sistem lebih kuat pada reciter profesional, sedangkan pengguna normal, anak-anak, perempuan, variasi aksen, tempo, dan tingkat tajwid membuat performa sistem lebih menantang.

**Relevansi untuk Sobat Ngaji:** Sangat penting untuk membatasi klaim. Sobat Ngaji menargetkan pemula dan pengguna mandiri, sehingga proposal harus jujur bahwa sistem ini memberi evaluasi awal, bukan koreksi mutlak.

**Masuk ke bagian:** Research gap, target pengguna, batasan MVP, validasi.

**Cara mengutip dalam narasi:** Gunakan untuk menjelaskan bahwa aplikasi pembelajaran nyata harus mempertimbangkan variasi pengguna, sehingga validasi kepada pengguna awal dan pembatasan fitur MVP menjadi penting.

### 3. Speech Recognition Models for Holy Quran Recitation: Comprehensive Overview

**File:** `Paper_97-Speech_Recognition_Models_for_Holy_Quran_Recitation.pdf`

**Inti paper:** Review tentang model speech recognition untuk bacaan Al-Qur'an. Paper ini menekankan bahwa Holy Quran Speech Recognition masih berkembang, memiliki keterbatasan dataset, dan banyak riset belum mencakup seluruh surah atau seluruh variasi bacaan.

**Relevansi untuk Sobat Ngaji:** Ini referensi utama untuk research gap. Bisa dipakai sebagai payung teori sebelum masuk ke solusi Sobat Ngaji.

**Masuk ke bagian:** Latar belakang, research gap, daftar pustaka utama.

**Cara mengutip dalam narasi:** Gunakan untuk menyatakan bahwa meskipun ASR berkembang pesat, penerapan pada bacaan Al-Qur'an masih memiliki tantangan spesifik dan belum sepenuhnya matang.

### 4. Al-Quran Recitation or Sound Processing Analysis: Systematic Literature Review

**File:** `Al-Quran_Recitation_or_Sound_Processing_Analysis__A_Systematic_Literature_Review_on_Methods.pdf`

**Inti paper:** Systematic review tentang metode analisis suara dan recitation processing untuk Al-Qur'an. Paper ini mendukung gagasan bahwa AI dan sound processing dapat membantu verifikasi bacaan/hafalan, terutama saat pendamping tidak selalu tersedia.

**Relevansi untuk Sobat Ngaji:** Kuat untuk latar belakang dan dampak. Paper ini menjelaskan kenapa pemrosesan suara relevan untuk pembelajaran Al-Qur'an.

**Masuk ke bagian:** Latar belakang, urgensi, dampak karya.

**Cara mengutip dalam narasi:** Gunakan untuk memperkuat klaim bahwa teknologi sound processing dapat memperluas akses pembelajaran dan membantu proses verifikasi bacaan.

### 5. Implementasi ASR pada Penilaian Hafalan Al-Quran Berbasis Android

**File:** `cices,+Journal+editor,+7.+Implementasi+Automatic+Speech+Recognition+Pada+Penilaian+Hafalan+Al-Quran+Dengan+Metode+Muroja’ah+Berbasis+Android (2).pdf`

**Inti paper:** Paper ini mengimplementasikan ASR pada aplikasi Android untuk penilaian hafalan Al-Qur'an dengan metode muroja'ah.

**Relevansi untuk Sobat Ngaji:** Cocok sebagai pembanding aplikasi sejenis. Sobat Ngaji bisa dibedakan karena fokusnya bukan hanya hafalan, tetapi evaluasi bacaan berdasarkan ayat referensi, skor kecocokan, dan indikator bagian yang perlu diperbaiki.

**Masuk ke bagian:** Latar belakang, solusi, analisis fungsional, desain produk.

**Cara mengutip dalam narasi:** Gunakan untuk menunjukkan bahwa pendekatan aplikasi mobile berbasis ASR sudah pernah diterapkan, lalu jelaskan celah yang diambil Sobat Ngaji.

### 6. QVR: Quranic Verses Recitation Recognition System using PocketSphinx

**File:** `QVR Quranic Verses Recitation Recognition System using PocketSphinx.pdf`

**Inti paper:** Paper ini mengembangkan sistem pengenalan bacaan ayat Al-Qur'an menggunakan PocketSphinx, dengan cakupan ayat/surah tertentu.

**Relevansi untuk Sobat Ngaji:** Berguna untuk membenarkan pendekatan berbasis ayat referensi. Sistem yang dibatasi pada ayat tertentu lebih realistis untuk dievaluasi pada tahap prototype dibanding sistem yang mengenali semua bacaan bebas.

**Masuk ke bagian:** Research gap, metode, desain sistem, batasan MVP.

**Cara mengutip dalam narasi:** Gunakan untuk mendukung keputusan desain bahwa pengguna memilih ayat terlebih dahulu agar sistem memiliki acuan evaluasi yang jelas.

### 7. Dataset Ratio Experiment for Tajweed Law Recognition Using MFCC CNN Features

**File:** `DATASE~1.PDF` dan/atau `15546-Article Text-60013-58999-10-20251128 (1).pdf`

**Inti paper:** Paper ini menggunakan MFCC dan CNN untuk klasifikasi hukum tajwid tertentu, seperti nun sukun/tanwin. Ini menunjukkan bahwa fitur audio dapat dipakai untuk mendeteksi pola tajwid, tetapi cakupannya masih spesifik.

**Relevansi untuk Sobat Ngaji:** Penting untuk batasan klaim. Paper ini mendukung bahwa koreksi tajwid berbasis audio memungkinkan, tetapi tidak berarti Sobat Ngaji harus langsung mengoreksi semua tajwid.

**Masuk ke bagian:** Metode, batasan MVP, pengembangan lanjutan.

**Cara mengutip dalam narasi:** Gunakan untuk menjelaskan bahwa analisis tajwid detail membutuhkan dataset dan model khusus, sehingga fitur tersebut ditempatkan sebagai pengembangan lanjutan.

### 8. Automatic Speech Recognition (ASR) Systems Learning Arabic Language Al-Quran Recitation: Review

**File:** `Automatic Speech Recognition (ASR).pdf`

**Inti paper:** Review umum tentang sistem ASR untuk pembelajaran bahasa Arab dan bacaan Al-Qur'an.

**Relevansi untuk Sobat Ngaji:** Dipakai sebagai referensi pendukung untuk teori ASR dan penerapannya dalam pembelajaran.

**Masuk ke bagian:** Landasan teori, metode, daftar pustaka pendukung.

**Cara mengutip dalam narasi:** Gunakan saat menjelaskan definisi dan relevansi ASR dalam konteks pembelajaran bacaan.

### 9. Deep Neural Networks for Acoustic Modeling in Speech Recognition

**File:** `DeepNeuralNetworksforAcousticModelinginSpeechRecognitioneditorbyYoesoepEdhieRachmad.pdf`

**Inti paper:** Paper klasik/teoretis tentang penggunaan deep neural networks dalam acoustic modeling untuk speech recognition.

**Relevansi untuk Sobat Ngaji:** Dipakai sebagai dasar teori bahwa deep learning menjadi fondasi penting dalam sistem ASR modern.

**Masuk ke bagian:** Landasan teori dan metode.

**Cara mengutip dalam narasi:** Gunakan jika proposal perlu menjelaskan dasar teknis AI/ASR secara lebih akademik.

### 10. Speech Recognition with Deep Recurrent Neural Networks

**File:** `SpeechRecognitionWithDeepRecurrentNeuralNetworkseditorbyYoesoepEdhieRachmad.pdf`

**Inti paper:** Paper ini mendukung penggunaan deep recurrent neural networks untuk speech recognition, terutama karena suara merupakan data sekuensial.

**Relevansi untuk Sobat Ngaji:** Pendukung teori model sekuensial dalam pemrosesan suara.

**Masuk ke bagian:** Landasan teori dan metode.

**Cara mengutip dalam narasi:** Gunakan jika ingin menjelaskan bahwa pemrosesan bacaan membutuhkan model yang mampu menangani urutan suara.

### 11. Deterding et al. - Defining Gamification

**File:** `deterding11.pdf`

**Inti paper:** Paper ini mendefinisikan gamification sebagai penggunaan elemen desain game dalam konteks non-game.

**Relevansi untuk Sobat Ngaji:** Tidak wajib untuk MVP. Dipakai hanya jika proposal memasukkan fitur lanjutan seperti streak latihan, badge, level, progress, atau rekomendasi latihan.

**Masuk ke bagian:** Fitur lanjutan atau pengembangan produk.

**Cara mengutip dalam narasi:** Gunakan untuk membenarkan fitur motivasi latihan, bukan untuk inti ASR.

### 12. Paper Tahsin, Tajwid, dan Makharijul Huruf

**File:** `12+Lusianasta.pdf`, `1225-Article Text-1569-1-10-20231230.pdf`, `1710-Article Text-3488-1-10-20230825.pdf`

**Inti paper:** Kelompok paper ini mendukung kebutuhan pendidikan: bacaan Al-Qur'an membutuhkan ketepatan tajwid, makharijul huruf, dan pendampingan dalam pembelajaran.

**Relevansi untuk Sobat Ngaji:** Dipakai untuk latar belakang non-teknis. Ini penting agar proposal tidak terasa hanya seperti proyek AI, tetapi tetap berakar pada kebutuhan pembelajaran.

**Masuk ke bagian:** Latar belakang, urgensi masalah, target pengguna, dampak.

**Cara mengutip dalam narasi:** Gunakan untuk menyatakan bahwa pembelajaran bacaan Al-Qur'an membutuhkan ketepatan pelafalan dan koreksi yang terarah.

## Rekomendasi Penempatan Kutipan per Bab

### Abstrak

Tidak perlu terlalu banyak kutipan. Cukup rangkum masalah, solusi, teknologi, dan batasan.

### Latar Belakang

Gunakan 3 jenis kutipan:

1. Paper tahsin/tajwid untuk pentingnya ketepatan bacaan.
2. Systematic review untuk peluang AI dan sound processing.
3. Al-Fadhli atau qArI untuk menyatakan Quran ASR masih menantang.

### Permasalahan

Tidak perlu kutipan berlebihan. Masalah bisa dirumuskan dari gap:

- keterbatasan pendamping
- kebutuhan latihan mandiri
- kebutuhan evaluasi berbasis audio
- risiko scope teknologi yang terlalu luas

### Solusi yang Ditawarkan

Gunakan Sujjada et al. dan QVR sebagai pembanding. Setelah itu tekankan pembeda Sobat Ngaji:

- berbasis ayat referensi
- fokus pada evaluasi awal bacaan
- tidak mengklaim koreksi penuh tajwid

### Metode Pengembangan Produk

Gunakan qArI, Al-Zaro, dan CNN-MFCC paper untuk menjelaskan:

- audio processing
- ASR/recognition module
- matching terhadap ayat referensi
- skor kecocokan
- rencana validasi terbatas

### Analisis Fungsional

Gunakan referensi aplikasi Android ASR dan QVR untuk mendukung fitur:

- pilih ayat
- rekam bacaan
- proses audio
- tampilkan hasil evaluasi

### Desain Produk Teknologi Digital

Kutipan tidak perlu banyak. Fokus pada arsitektur:

- Flutter mobile app
- database ayat
- audio processing
- ASR module
- evaluation engine

### Pembahasan Implementasi, Validasi, Demo, dan Dampak

Gunakan Al-Zaro untuk validasi pada pengguna beragam, systematic review untuk dampak akses pembelajaran, dan Deterding hanya jika ada gamification.

### Batasan dan Pengembangan Lanjutan

Gunakan Al-Zaro, qArI, dan CNN-MFCC paper. Ini bagian penting untuk menunjukkan kedewasaan proposal:

- MVP belum mengoreksi seluruh tajwid.
- Sistem tidak menggantikan guru.
- Pengenalan ayat bebas dan analisis makhraj detail menjadi fitur lanjutan.

## Narasi Gap Final yang Disarankan

Penelitian sebelumnya menunjukkan bahwa teknologi ASR dan pemrosesan suara memiliki potensi besar dalam mendukung pengenalan serta evaluasi bacaan Al-Qur'an. Namun, penerapan Quran ASR masih menghadapi tantangan berupa keterbatasan dataset, variasi reciter, kondisi audio, serta kompleksitas aturan tajwid. Beberapa penelitian juga masih berfokus pada reciter profesional, surah tertentu, hafalan, atau klasifikasi hukum tajwid yang terbatas. Berdasarkan gap tersebut, Sobat Ngaji mengambil pendekatan yang lebih terarah dan realistis untuk tahap prototype, yaitu meminta pengguna memilih ayat referensi terlebih dahulu, merekam bacaan, lalu menerima evaluasi awal berupa skor kecocokan dan indikator bagian yang perlu diperbaiki.

## Kutipan yang Paling Aman Dipakai

- ASR dan sound processing relevan untuk membantu evaluasi bacaan Al-Qur'an.
- Quran ASR masih menghadapi tantangan dataset, variasi reciter, dan kompleksitas tajwid.
- Sistem untuk pengguna normal/pemula lebih menantang dibanding reciter profesional.
- Analisis tajwid detail membutuhkan dataset dan model khusus.
- Aplikasi mobile dapat menjadi media latihan mandiri yang mendukung, bukan menggantikan, pembimbing.

## Kutipan yang Sebaiknya Dihindari

- Klaim bahwa Sobat Ngaji bisa mengoreksi semua tajwid.
- Klaim bahwa sistem menjamin bacaan benar secara mutlak.
- Klaim bahwa sistem real-time jika prototype belum membuktikan itu.
- Klaim bahwa model sudah setara guru atau ustaz.
- Klaim akurasi dari paper lain seolah-olah menjadi akurasi Sobat Ngaji.
