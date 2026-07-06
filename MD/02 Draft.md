# Draft

## Draft Utama

### Abstrak

Pembelajaran bacaan Al-Qur'an masih sangat bergantung pada guru atau pendamping untuk memberikan koreksi langsung, sehingga latihan mandiri sering berlangsung tanpa umpan balik yang memadai. Kondisi ini dialami oleh pelajar di lingkungan pendidikan terstruktur maupun masyarakat umum yang belajar membaca Al-Qur'an secara mandiri. Sobat Ngaji dikembangkan sebagai aplikasi mobile berbasis Flutter yang memanfaatkan AI dengan komponen Arabic Automatic Speech Recognition (ASR) untuk membantu pengguna mengevaluasi kecocokan bacaannya terhadap ayat referensi yang dipilih. Alur utamanya meliputi pemilihan ayat, perekaman bacaan, pemrosesan audio, dan penyajian hasil evaluasi berupa skor kecocokan serta indikator bagian bacaan yang perlu diperbaiki. Pada tahap awal, pengembangan difokuskan pada koreksi kecocokan lafaz dan kelancaran bacaan agar prototype tetap realistis, terukur, dan layak divalidasi. Sobat Ngaji tidak diposisikan sebagai pengganti guru ngaji, melainkan sebagai alat bantu latihan mandiri yang memberi umpan balik awal secara cepat dan terarah. Dengan menggabungkan mobile learning, pemrosesan audio, dan evaluasi berbasis AI, Sobat Ngaji diharapkan menjadi inovasi teknologi digital pendidikan yang relevan dan berdampak dalam mendukung pembelajaran bacaan Al-Qur'an.

### 1. Latar Belakang

Pembelajaran Al-Qur'an tidak hanya menuntut kemampuan membaca, tetapi juga ketepatan pelafalan huruf, kelancaran, dan kesesuaian bacaan terhadap kaidah dasar yang berlaku. Dalam praktiknya, proses koreksi bacaan masih sangat bergantung pada kehadiran guru, ustaz, atau pendamping yang mendengarkan bacaan secara langsung. Pola ini efektif dalam pembelajaran tatap muka, tetapi tidak selalu mampu menjawab kebutuhan pengguna yang ingin berlatih secara mandiri, fleksibel, dan berulang di luar jam belajar formal.

Kondisi tersebut dirasakan baik oleh pelajar di lingkungan pendidikan terstruktur seperti santri dan siswa, maupun oleh masyarakat umum yang sedang belajar membaca Al-Qur'an secara mandiri. Banyak pengguna memiliki akses terhadap materi bacaan, tetapi tidak memiliki alat bantu yang dapat memberikan evaluasi langsung terhadap bacaannya. Akibatnya, proses latihan sering berjalan tanpa umpan balik yang memadai, sehingga kesalahan bacaan dapat terus berulang tanpa koreksi yang cepat dan terarah.

Di sisi lain, perkembangan teknologi kecerdasan buatan, khususnya pada bidang pengenalan suara, membuka peluang untuk membangun sistem evaluasi bacaan yang lebih adaptif. Berbagai penelitian terdahulu telah mengonfirmasi efektivitas teknologi *Arabic Automatic Speech Recognition* (ASR) dalam pembelajaran Al-Qur'an. Sebagai contoh, penelitian Al-Zaro dkk. (2025) serta Al-Fadhli dkk. (2023) dalam jurnal internasional bereputasi (Scopus) menunjukkan bahwa pemanfaatan *Deep Learning* (seperti model *Transformer*) mampu mengenali pelafalan huruf Arab sesuai kaidah tajwid dengan tingkat *Word Error Rate* (WER) yang rendah. Dalam konteks pembelajaran Al-Qur'an, potensi ini sangat relevan untuk membantu mendeteksi kecocokan lafaz, menandai bagian bacaan yang meleset, dan memberikan gambaran performa bacaan secara lebih objektif.

Namun demikian, dari tinjauan tersebut ditemukan adanya *research gap* atau kesenjangan penerapan. Secara fungsional, banyak solusi aplikasi yang beredar di masyarakat masih berfokus pada penyediaan audio murottal, materi belajar statis, atau sekadar fitur hafalan, bukan pada **koreksi bacaan yang aktif dan terukur**. Secara teknis, banyak riset ASR berupaya membangun sistem yang langsung mengenali bacaan secara bebas (*open-ended recognition*) tanpa batasan ayat referensi. Pendekatan seperti itu cenderung sangat berat secara komputasi, berisiko menurunkan akurasi pada pengguna tahap pemula, dan kurang realistis untuk diimplementasikan sebagai prototipe yang siap pakai.

Berdasarkan *research gap* dan kondisi tersebut, dibutuhkan sebuah inovasi teknologi digital pendidikan yang lebih terfokus, yaitu aplikasi mobile yang mengharuskan pengguna memilih ayat yang sudah tersedia di dalam sistem terlebih dahulu, lalu sistem memberikan evaluasi terhadap kecocokan bacaannya. Dengan pendekatan spesifik ini, proses pembandingan (*matching*) oleh AI menjadi jauh lebih akurat dan terarah, sementara pengguna tetap memperoleh pengalaman belajar mandiri yang praktis dan mendapatkan umpan balik yang terukur.

Oleh karena itu, gagasan yang diajukan dalam LIDM 2026 divisi ITDP ini adalah pengembangan aplikasi mobile bernama Sobat Ngaji berbasis Flutter untuk koreksi bacaan Al-Qur'an berbasis AI. Aplikasi ini memanfaatkan model AI hasil fine-tuning dengan komponen Arabic Automatic Speech Recognition (ASR) untuk membantu mengevaluasi kecocokan bacaan pengguna terhadap ayat yang dipilih, menampilkan bagian yang meleset, memberikan skor kelancaran, dan menyediakan umpan balik dasar sebagai pendukung proses belajar. Dengan konsep tersebut, aplikasi diharapkan menjadi solusi pendidikan digital yang relevan, berdampak, dan realistis untuk dikembangkan sebagai prototype kompetisi.

### 2. Permasalahan

Permasalahan utama yang ingin dijawab dalam gagasan ini adalah:

1. Bagaimana membantu pengguna melakukan koreksi bacaan Al-Qur'an secara mandiri ketika akses terhadap pendamping tidak selalu tersedia?
2. Bagaimana merancang aplikasi mobile yang mampu mengevaluasi kecocokan bacaan pengguna terhadap ayat yang telah dipilih di dalam sistem?
3. Bagaimana memanfaatkan model AI hasil fine-tuning dengan komponen Arabic Automatic Speech Recognition (ASR) agar proses koreksi bacaan dapat berjalan lebih terarah, terukur, dan layak digunakan sebagai alat bantu belajar?
4. Bagaimana menghadirkan solusi yang cukup realistis untuk dibangun sebagai prototype tahap awal, tanpa membuat klaim teknis yang terlalu luas?

### 3. Solusi yang Ditawarkan

Solusi yang ditawarkan adalah aplikasi mobile pembelajaran Al-Qur'an berbasis Flutter yang berfokus pada koreksi bacaan ayat secara terarah. Pengguna tidak membaca secara bebas tanpa konteks, tetapi terlebih dahulu memilih ayat atau potongan ayat yang sudah tersedia di dalam sistem. Setelah itu, pengguna merekam bacaannya dan sistem akan memproses suara tersebut menggunakan model AI hasil fine-tuning dengan komponen Arabic Automatic Speech Recognition (ASR) untuk membandingkannya dengan referensi bacaan yang sesuai.

Hasil evaluasi yang ingin ditampilkan pada versi awal meliputi:

- kecocokan bacaan terhadap ayat referensi
- penandaan bagian yang terdeteksi meleset atau tidak sesuai
- skor kelancaran atau tingkat kemiripan bacaan

Pendekatan ini dipilih karena lebih realistis untuk tahap prototype dibandingkan sistem yang langsung mencoba mengenali semua ayat secara bebas. Dengan basis ayat yang sudah tersedia, proses pembandingan dapat dibuat lebih fokus, kualitas demo lebih mudah dikendalikan, dan nilai edukatifnya tetap kuat.

Sebagai pengembangan tambahan pada tahap awal, sistem dapat dilengkapi dengan umpan balik dasar dan riwayat hasil latihan sederhana. Sementara itu, fitur pengenalan ayat otomatis tanpa harus dipilih terlebih dahulu ditempatkan sebagai tahap lanjutan agar ruang lingkup MVP tetap terjaga.

### 4. Target Pengguna / Penerima Manfaat

Target pengguna utama aplikasi ini adalah:

- pelajar Qur'an di lingkungan pendidikan terstruktur seperti santri, siswa, dan peserta kelas ngaji
- masyarakat umum yang ingin berlatih membaca Al-Qur'an secara mandiri

Penerima manfaat tidak hanya terbatas pada pengguna akhir, tetapi juga lembaga pembelajaran yang membutuhkan alat bantu latihan mandiri untuk mendukung proses pembelajaran di luar sesi tatap muka. Dengan demikian, aplikasi memiliki nilai dampak yang lebih luas karena dapat digunakan baik dalam konteks belajar formal maupun nonformal.

### 4.1 Tujuan

Tujuan yang ingin dicapai melalui pengembangan Sobat Ngaji adalah:

1. Menghadirkan alat bantu latihan mandiri untuk membantu pengguna melakukan evaluasi awal terhadap bacaan Al-Qur'an.
2. Mengembangkan aplikasi mobile berbasis Flutter yang mampu memproses rekaman bacaan dan mencocokkannya dengan ayat referensi yang dipilih pengguna.
3. Menerapkan model AI hasil fine-tuning dengan komponen Arabic Automatic Speech Recognition (ASR) untuk menghasilkan evaluasi bacaan yang lebih terarah dan terukur.
4. Menyusun prototype yang realistis untuk divisi ITDP, dengan fokus pada fitur inti yang dapat didemonstrasikan dan divalidasi kepada pengguna awal.

### 4.2 Manfaat

Manfaat yang diharapkan dari pengembangan Sobat Ngaji adalah sebagai berikut:

1. Bagi pengguna, aplikasi membantu latihan bacaan Al-Qur'an secara mandiri dengan umpan balik awal yang lebih cepat.
2. Bagi pelajar di lingkungan pendidikan terstruktur, aplikasi dapat menjadi media pendukung latihan di luar sesi talaqqi atau pendampingan langsung.
3. Bagi guru atau pembimbing, aplikasi dapat berfungsi sebagai alat bantu awal untuk mendorong latihan berulang sebelum evaluasi langsung dilakukan.
4. Bagi pengembangan teknologi pendidikan, Sobat Ngaji menjadi contoh penerapan AI dan Arabic Automatic Speech Recognition (ASR) pada pembelajaran bacaan Al-Qur'an yang relevan, terukur, dan bertahap.
5. Bagi pengembangan karya lomba, Sobat Ngaji menunjukkan inovasi digital pendidikan yang tidak hanya menghadirkan materi belajar, tetapi juga evaluasi aktif terhadap performa bacaan pengguna.

### 5. Cara Implementasi

Implementasi produk dirancang dalam bentuk aplikasi mobile dengan stack utama Flutter agar mendukung pengembangan antarmuka yang fleksibel dan mudah diuji sebagai prototype. Pada sisi kecerdasan buatan, sistem memanfaatkan model pengenalan suara yang telah ada sebagai basis, kemudian diarahkan ke pendekatan fine-tuning agar lebih sesuai untuk kebutuhan koreksi bacaan Al-Qur'an.

Alur kerja sistem pada MVP dirancang sebagai berikut:

1. Pengguna memilih surah, ayat, atau potongan ayat yang tersedia.
2. Sistem menampilkan teks ayat sebagai referensi latihan.
3. Pengguna merekam bacaan melalui aplikasi.
4. Audio diproses oleh komponen AI untuk mencocokkan hasil bacaan dengan referensi.
5. Sistem menampilkan hasil evaluasi dalam bentuk kecocokan bacaan, skor kelancaran, dan indikator bagian yang perlu diperbaiki.

Secara konseptual, komponen sistem dapat dibagi menjadi:

- antarmuka mobile Flutter untuk memilih ayat, merekam audio, dan menampilkan hasil evaluasi
- basis data ayat dan referensi bacaan yang menjadi acuan sistem
- modul pemrosesan audio dan inferensi model AI dengan komponen Arabic Automatic Speech Recognition (ASR)
- modul evaluasi hasil yang mengubah keluaran model menjadi umpan balik yang mudah dipahami pengguna

Pendekatan implementasi ini sengaja dibuat bertahap agar sesuai dengan kebutuhan proposal LIDM, yaitu menunjukkan inovasi yang jelas sekaligus memungkinkan terwujudnya prototype minimal 50% pada tahap seleksi nasional.

### 5.1 Metode Pengembangan Produk

Metode pengembangan produk Sobat Ngaji dirancang secara bertahap agar sesuai dengan kebutuhan lomba, kapasitas tim, dan target terwujudnya prototype yang dapat didemonstrasikan. Pengembangan difokuskan pada pembuatan produk minimum yang fungsional, terukur, dan relevan terhadap permasalahan latihan bacaan Al-Qur'an mandiri.

Tahapan pengembangan yang diusulkan adalah sebagai berikut:

1. Analisis kebutuhan pengguna
   Tahap awal dilakukan dengan mengidentifikasi kebutuhan pengguna utama, yaitu pelajar Qur'an dan masyarakat umum yang ingin berlatih membaca secara mandiri. Analisis ini difokuskan pada kebutuhan latihan mandiri, kebutuhan umpan balik cepat, dan keterbatasan pengguna ketika tidak didampingi guru secara langsung.

2. Penentuan ruang lingkup MVP
   Setelah kebutuhan utama dipetakan, tahap berikutnya adalah menentukan batas fitur prototype agar tetap realistis. MVP difokuskan pada pemilihan ayat, perekaman bacaan, pencocokan terhadap ayat referensi, skor kecocokan, dan penandaan bagian bacaan yang kurang sesuai. Pembatasan ini penting agar proses pengembangan tidak melebar ke fitur yang belum kritis seperti pengenalan ayat bebas atau koreksi tajwid menyeluruh.

3. Perancangan sistem dan antarmuka
   Tim merancang alur penggunaan aplikasi, struktur halaman utama, komponen input audio, serta tampilan hasil evaluasi. Pada tahap ini juga disusun rancangan arsitektur sederhana yang menghubungkan aplikasi Flutter, data ayat referensi, modul pemrosesan audio, dan komponen AI berbasis Arabic Automatic Speech Recognition (ASR).

4. Persiapan data dan model
   Tahap ini mencakup penyusunan data ayat referensi, penyiapan audio uji, serta pemilihan model dasar yang memungkinkan dilakukan fine-tuning. Data yang digunakan harus memiliki sumber yang jelas dan legal. Jika tersedia, data rekaman pengguna awal dan masukan evaluator juga dapat dipakai untuk membantu validasi performa sistem pada ruang lingkup terbatas.

5. Pengembangan prototype
   Pada tahap ini tim mulai membangun aplikasi mobile menggunakan Flutter dan menghubungkannya dengan modul pemrosesan audio dan evaluasi bacaan. Hasil dari tahap ini adalah prototype yang sudah mampu menjalankan alur inti dari pemilihan ayat sampai menampilkan hasil evaluasi dasar.

6. Pengujian internal
   Prototype yang telah dibangun diuji secara internal untuk memastikan alur aplikasi berjalan dengan baik, rekaman suara dapat diproses, dan hasil evaluasi dapat ditampilkan dengan cukup jelas. Pengujian ini penting untuk menemukan masalah teknis sebelum aplikasi diuji ke pengguna awal.

7. Validasi awal ke pengguna
   Setelah pengujian internal, prototype divalidasi secara terbatas kepada pengguna awal dan evaluator seperti guru ngaji atau ustaz. Tujuannya bukan untuk mengklaim akurasi sempurna, tetapi untuk menilai apakah aplikasi cukup mudah digunakan, cukup membantu latihan mandiri, dan cukup jelas dalam menyajikan hasil evaluasi.

8. Evaluasi dan penyempurnaan
   Hasil pengujian dan validasi digunakan untuk memperbaiki antarmuka, alur penggunaan, serta kejelasan hasil evaluasi. Tahap ini menjadi dasar penyempurnaan prototype agar lebih layak dipresentasikan dan dikembangkan pada tahap berikutnya.

Secara umum, metode pengembangan ini menekankan tiga prinsip utama, yaitu fokus pada kebutuhan belajar nyata, menjaga scope produk tetap realistis, dan membangun sistem yang dapat divalidasi secara bertahap.

### 5.2 Analisis Fungsional

Analisis fungsional Sobat Ngaji disusun untuk menjelaskan fungsi utama sistem dan bagaimana tiap komponen mendukung tujuan pembelajaran mandiri. Pada tahap awal, sistem difokuskan pada satu peran utama, yaitu pengguna akhir yang ingin melatih bacaan Al-Qur'an secara mandiri.

Fungsi-fungsi utama sistem yang direncanakan adalah sebagai berikut:

1. Fungsi pemilihan ayat
   Sistem menyediakan daftar surah, ayat, atau potongan ayat yang dapat dipilih pengguna sebagai bahan latihan. Fungsi ini penting agar proses evaluasi memiliki acuan yang jelas dan terarah.

2. Fungsi penyajian referensi bacaan
   Setelah ayat dipilih, sistem menampilkan teks ayat sebagai referensi latihan. Pada pengembangan berikutnya, fungsi ini dapat dilengkapi dengan audio referensi, tetapi pada tahap awal fokus utamanya adalah penyediaan teks yang jelas dan mudah diakses.

3. Fungsi perekaman audio
   Sistem memungkinkan pengguna merekam bacaan langsung dari aplikasi. Fungsi ini menjadi pintu masuk utama bagi proses evaluasi otomatis.

4. Fungsi pemrosesan audio
   Audio yang direkam pengguna diproses agar sesuai dengan kebutuhan modul evaluasi. Proses ini dapat mencakup normalisasi format audio, pembersihan sederhana, atau penyesuaian teknis lain yang dibutuhkan sebelum inferensi model dilakukan.

5. Fungsi evaluasi kecocokan bacaan
   Sistem membandingkan hasil bacaan pengguna dengan ayat referensi menggunakan model AI hasil fine-tuning dengan komponen Arabic Automatic Speech Recognition (ASR). Fungsi ini menjadi inti dari Sobat Ngaji karena menentukan apakah sistem mampu memberikan nilai edukatif yang nyata.

6. Fungsi penyajian hasil evaluasi
   Hasil evaluasi ditampilkan dalam bentuk skor kecocokan, indikator bagian yang kurang sesuai, dan jika memungkinkan umpan balik dasar. Fungsi ini harus dirancang sesederhana mungkin agar hasil evaluasi mudah dipahami oleh pengguna awam.

7. Fungsi pengulangan latihan
   Setelah menerima hasil evaluasi, pengguna dapat mengulang latihan pada ayat yang sama. Fungsi ini penting karena inti manfaat aplikasi terletak pada proses latihan berulang dengan umpan balik yang cepat.

8. Fungsi penyimpanan riwayat sederhana
   Pada tahap tambahan MVP, sistem dapat menyimpan hasil latihan secara sederhana agar pengguna dapat melihat riwayat percobaan sebelumnya. Fungsi ini belum menjadi inti demo, tetapi tetap bernilai untuk mendukung pengalaman belajar mandiri.

Berdasarkan fungsi-fungsi tersebut, hubungan komponen sistem dapat dijelaskan secara ringkas:

- antarmuka mobile menangani interaksi pengguna
- basis data referensi menyediakan ayat yang menjadi acuan
- modul audio memproses rekaman pengguna
- modul AI/ASR melakukan evaluasi kecocokan bacaan
- modul hasil menerjemahkan keluaran teknis menjadi feedback yang mudah dipahami

Analisis fungsional ini menunjukkan bahwa Sobat Ngaji tidak dirancang sebagai sistem pembelajaran yang terlalu luas, melainkan sebagai alat bantu evaluasi awal yang fokus, terarah, dan relevan untuk kebutuhan prototype kompetisi.

### 5.3 Desain Produk Teknologi Digital

Desain produk Sobat Ngaji disusun untuk menghadirkan pengalaman latihan bacaan yang sederhana, terarah, dan mudah dipahami oleh pengguna dari berbagai latar belakang. Karena produk ditujukan sebagai aplikasi mobile pendidikan, rancangan antarmuka dan alur penggunaan perlu dibuat ringkas agar pengguna dapat langsung memahami langkah latihan tanpa beban interaksi yang rumit.

#### a. Desain Alur Penggunaan

Alur penggunaan utama Sobat Ngaji pada tahap prototype dirancang sebagai berikut:

1. Pengguna membuka aplikasi dan masuk ke halaman utama.
2. Pengguna memilih surah, ayat, atau potongan ayat yang tersedia.
3. Sistem menampilkan teks ayat sebagai referensi latihan.
4. Pengguna menekan tombol rekam dan membaca ayat sesuai referensi.
5. Sistem memproses audio bacaan pengguna.
6. Sistem menampilkan hasil evaluasi berupa skor kecocokan dan penandaan bagian yang perlu diperbaiki.
7. Pengguna dapat mengulang latihan pada ayat yang sama atau memilih ayat lain.

Alur ini dipilih karena sederhana, mudah didemonstrasikan, dan selaras dengan kebutuhan latihan mandiri yang berulang.

#### b. Desain Antarmuka Utama

Pada tahap awal, desain antarmuka Sobat Ngaji dapat dibagi ke dalam empat halaman inti:

1. Halaman pilih ayat
   Menampilkan daftar surah atau ayat pendek yang dapat dipilih pengguna sebagai bahan latihan.

2. Halaman latihan
   Menampilkan teks ayat referensi dan tombol untuk memulai perekaman suara.

3. Halaman proses rekaman
   Menunjukkan bahwa suara sedang direkam atau sedang diproses oleh sistem.

4. Halaman hasil evaluasi
   Menampilkan skor kecocokan, indikator bagian bacaan yang kurang sesuai, serta saran untuk mengulang latihan.

Rancangan ini bertujuan agar hasil evaluasi tidak tampil terlalu teknis, melainkan mudah dibaca dan langsung berguna untuk pengguna.

#### c. Desain Arsitektur Sederhana

Secara konseptual, arsitektur Sobat Ngaji terdiri dari beberapa komponen utama:

- aplikasi mobile berbasis Flutter sebagai lapisan antarmuka pengguna
- basis data ayat referensi sebagai sumber teks dan struktur ayat
- modul perekaman dan pemrosesan audio
- model AI hasil fine-tuning dengan komponen Arabic Automatic Speech Recognition (ASR)
- modul evaluasi hasil untuk menghasilkan skor dan indikator kesesuaian bacaan

Hubungan antar komponen tersebut berjalan secara berurutan. Aplikasi menerima input pengguna, mengambil ayat referensi, merekam bacaan, mengirim atau memproses audio ke modul AI, lalu menampilkan hasil evaluasi ke pengguna dalam bentuk yang mudah dipahami.

#### d. Prinsip Desain Produk

Sobat Ngaji dibangun dengan beberapa prinsip desain utama:

- sederhana: pengguna tidak perlu memahami proses teknis di balik AI
- terarah: evaluasi selalu berbasis ayat referensi yang dipilih
- informatif: hasil latihan harus memberi makna yang bisa ditindaklanjuti
- realistis: fitur awal dibatasi agar prototype dapat benar-benar diwujudkan
- edukatif: aplikasi membantu latihan, bukan menggantikan pendampingan guru

Dengan pendekatan desain tersebut, Sobat Ngaji diposisikan sebagai produk teknologi digital pendidikan yang tidak hanya menarik secara konsep, tetapi juga masuk akal untuk dikembangkan dan diuji pada tahap prototype.

### 5.4 Pembahasan Implementasi, Validasi, Demo, dan Dampak

Bagian ini menjelaskan bagaimana Sobat Ngaji diproyeksikan untuk diimplementasikan, divalidasi, didemonstrasikan, dan dinilai dampaknya dalam konteks proposal LIDM ITDP.

#### a. Implementasi Prototype

Prototype Sobat Ngaji diimplementasikan sebagai aplikasi mobile berbasis Flutter dengan fokus pada fungsi inti yang paling relevan terhadap masalah latihan bacaan mandiri. Pada tahap proposal, target implementasi bukan membangun sistem final yang sangat lengkap, melainkan menyiapkan prototype yang telah mampu menunjukkan alur utama produk.

Implementasi minimal yang diharapkan pada tahap ini mencakup:

- pemilihan ayat referensi
- tampilan teks ayat
- perekaman suara pengguna
- pemrosesan audio bacaan
- pencocokan terhadap ayat referensi
- tampilan skor kecocokan dan indikator kesalahan awal

Dengan capaian tersebut, prototype sudah cukup untuk menunjukkan bahwa Sobat Ngaji bukan hanya ide konseptual, tetapi sudah memiliki bentuk produk yang bisa diuji dan dipresentasikan.

#### b. Rencana Validasi Awal

Validasi awal dilakukan untuk menilai kelayakan fungsi produk dari sisi penggunaan dan manfaat edukatif. Karena proposal ini masih berada pada tahap prototype, validasi difokuskan pada bukti awal bahwa sistem dapat membantu latihan mandiri secara masuk akal.

Validasi dapat dilakukan melalui:

- uji coba terbatas kepada 10-20 pengguna awal
- masukan dari 2-3 guru ngaji atau ustaz sebagai evaluator
- observasi terhadap kemudahan penggunaan aplikasi
- pengumpulan tanggapan terhadap kejelasan hasil evaluasi

Aspek yang divalidasi meliputi:

- apakah alur penggunaan mudah dipahami
- apakah hasil evaluasi mudah dibaca
- apakah pengguna merasa terbantu saat latihan mandiri
- apakah evaluator menilai aplikasi cukup relevan sebagai alat bantu awal

Hasil validasi tidak diarahkan untuk mengklaim bahwa sistem sudah sempurna, tetapi untuk menunjukkan bahwa Sobat Ngaji memiliki nilai guna awal yang layak dikembangkan lebih lanjut.

#### c. Strategi Demo Produk

Demo produk menjadi bagian penting pada proposal ITDP karena juri perlu melihat bahwa inovasi benar-benar memiliki bentuk implementasi. Oleh sebab itu, demo Sobat Ngaji harus difokuskan pada alur yang paling mudah dipahami dan paling mewakili nilai produknya.

Urutan demo yang disarankan adalah:

1. Menunjukkan masalah pengguna saat ingin latihan bacaan mandiri tanpa feedback.
2. Menampilkan halaman pilih ayat.
3. Menampilkan proses perekaman bacaan.
4. Menampilkan hasil evaluasi berupa skor kecocokan dan bagian yang perlu diperbaiki.
5. Menjelaskan bahwa sistem bekerja berbasis ayat referensi agar evaluasi lebih terarah dan realistis.

Demo seperti ini akan lebih kuat daripada menjelaskan teknologi secara abstrak, karena langsung memperlihatkan hubungan antara masalah, proses, dan hasil.

#### d. Dampak Pendidikan yang Diharapkan

Sobat Ngaji diharapkan memberikan dampak pendidikan dalam beberapa aspek utama:

1. Membantu latihan mandiri
   Pengguna dapat berlatih membaca Al-Qur'an di luar sesi pembelajaran formal dengan memperoleh umpan balik awal yang lebih cepat.

2. Mendorong pengulangan latihan
   Karena hasil evaluasi dapat langsung dilihat, pengguna terdorong untuk mengulang latihan sampai bacaan terasa lebih baik.

3. Memperluas akses pembelajaran digital
   Pengguna yang tidak selalu memiliki akses pendamping dapat tetap memperoleh pengalaman belajar yang lebih interaktif.

4. Mendukung pembelajaran terstruktur
   Di lingkungan sekolah, pesantren, atau kelas ngaji, aplikasi dapat menjadi alat bantu latihan tambahan di luar pertemuan langsung.

#### e. Dampak Teknologi dan Pengembangan Lanjutan

Dari sisi teknologi, Sobat Ngaji menunjukkan bahwa AI dan Arabic Automatic Speech Recognition (ASR) dapat diarahkan ke konteks pendidikan yang spesifik dan praktis. Nilai pentingnya bukan sekadar penggunaan AI, tetapi bagaimana AI tersebut diposisikan untuk menyelesaikan masalah belajar yang nyata.

Jika prototype awal berhasil, arah pengembangan lanjutan yang logis meliputi:

- penambahan ayat dan cakupan latihan
- peningkatan kualitas evaluasi bacaan
- pengembangan umpan balik tajwid dasar yang lebih rinci
- penyediaan dashboard pembimbing
- pengenalan ayat otomatis tanpa dipilih terlebih dahulu

Dengan demikian, Sobat Ngaji tidak berhenti sebagai prototype lomba, tetapi memiliki jalur pengembangan yang jelas menuju produk yang lebih matang.

### 6. Dampak dan Keunggulan

Keunggulan utama gagasan ini terletak pada posisinya sebagai alat bantu koreksi bacaan yang lebih terfokus daripada aplikasi belajar Al-Qur'an biasa. Produk ini tidak hanya menyediakan materi atau audio, tetapi berupaya memberi evaluasi aktif terhadap performa bacaan pengguna. Nilai inovasinya juga diperkuat oleh penggunaan AI hasil fine-tuning dengan komponen Arabic Automatic Speech Recognition (ASR) yang diarahkan khusus untuk konteks koreksi bacaan.

Kebaruan utama Sobat Ngaji bukan hanya pada penggunaan Arabic Automatic Speech Recognition (ASR), tetapi pada penerapannya sebagai evaluasi bacaan yang terarah berbasis ayat referensi sehingga lebih realistis, terukur, dan relevan untuk pembelajaran mandiri.

Dari sisi dampak pendidikan, aplikasi ini berpotensi:

- membantu pengguna belajar secara mandiri dengan umpan balik yang lebih cepat
- mendukung proses latihan berulang tanpa selalu menunggu pendamping
- memperluas akses terhadap alat bantu belajar bacaan Al-Qur'an yang lebih interaktif
- menjadi media pendukung pembelajaran digital yang relevan dengan kebutuhan pendidikan masa kini

Dari sisi teknis dan strategis lomba, gagasan ini juga memiliki kelebihan karena:

- ruang lingkup MVP masih realistis untuk dibangun
- fokus produknya jelas, yaitu koreksi bacaan, bukan hafalan
- bentuk produknya sesuai dengan divisi ITDP sebagai inovasi teknologi digital pendidikan
- ada potensi pengembangan lanjutan yang tetap logis setelah prototype awal berhasil

### 7. Penutup

Pengembangan aplikasi mobile koreksi bacaan Al-Qur'an berbasis AI melalui Sobat Ngaji merupakan upaya menghadirkan pembelajaran digital yang lebih adaptif, terarah, dan berdampak. Dengan memanfaatkan Flutter sebagai stack aplikasi mobile dan pendekatan fine-tuning pada model AI dengan komponen Arabic Automatic Speech Recognition (ASR), solusi ini dirancang untuk membantu pengguna membaca ayat yang telah tersedia, memperoleh evaluasi otomatis, dan memperbaiki bacaannya secara mandiri.

Dalam konteks LIDM 2026 divisi ITDP, gagasan ini memiliki kekuatan pada kejelasan masalah, relevansi teknologi, dan peluang dampak pendidikan yang nyata. Agar proposal tetap kuat dan defensible, pengembangan tahap awal perlu difokuskan pada scope MVP yang terukur, yaitu pemilihan ayat yang tersedia, perekaman bacaan, pencocokan hasil bacaan, skor kecocokan, dan penandaan bagian bacaan yang perlu diperbaiki.

Secara keseluruhan, Sobat Ngaji menawarkan inovasi yang relevan dengan kebutuhan pembelajaran digital masa kini karena menghubungkan latihan mandiri, teknologi mobile, dan evaluasi bacaan berbasis AI dalam satu produk yang terarah. Dengan strategi pengembangan yang bertahap, validasi yang realistis, dan positioning sebagai alat bantu awal, Sobat Ngaji memiliki landasan yang cukup kuat untuk diajukan sebagai karya pada divisi Inovasi Teknologi Digital Pendidikan (ITDP) LIDM 2026.

## Catatan Pengembangan Draft

- Basis referensi: struktur narasi diadaptasi dari proposal PKM-PI, tetapi fokus diubah penuh dari hafalan ke koreksi bacaan
- Fitur yang sengaja tidak dijadikan inti: gamification, monitoring wali murid, dan administrasi lembaga
- Arah teknis sementara: Flutter + model AI hasil fine-tuning + Arabic Automatic Speech Recognition (ASR) + ayat referensi yang sudah tersedia
