# Dokumentasi Inference Model ASR Quran

Dokumen ini menjelaskan cara menjalankan inference model untuk Sobat Ngaji, baik dari CLI maupun lewat FastAPI.

## Ringkasan Jalur Inference

Ada 3 jalur inference di repo ini:

| Jalur | File | Dipakai untuk |
|---|---|---|
| Live/file HF inference | `scripts/live_infer_asr.py` | Tes cepat model Hugging Face atau checkpoint lokal |
| Corrector CLI | `scripts/correct.py` | Cek bacaan audio terhadap teks ayat referensi |
| FastAPI evaluation | `POST /v1/practice-sessions/{sessionId}/evaluate` | Inference dari app mobile/web |

## 1. Live/File HF Inference

Script utama:

```bash
python scripts/live_infer_asr.py
```

Default model:

```text
TBOGamer22/wav2vec2-quran-phonetics
```

### Inference dari File Audio

```bash
python scripts/live_infer_asr.py \
  --model TBOGamer22/wav2vec2-quran-phonetics \
  --audio data/raw/audio/Husary_128kbps_Mujawwad/094001.mp3 \
  --surah 94 \
  --ayah 1
```

Kalau `--surah` dan `--ayah` diisi, reference text otomatis diambil dari:

```text
data/raw/text/quran_uthmani.json
```

### Inference dengan Reference Manual

```bash
python scripts/live_infer_asr.py \
  --audio sample.wav \
  --reference "أَلَمْ نَشْرَحْ لَكَ صَدْرَكَ"
```

`--reference` menang atas `--surah` dan `--ayah`.

### Rekam Mic Sekali

Butuh dependency optional `sounddevice`.

```bash
python scripts/live_infer_asr.py \
  --record-seconds 5 \
  --surah 94 \
  --ayah 1
```

### Live Chunk dari Mic

```bash
python scripts/live_infer_asr.py \
  --live \
  --chunk-seconds 4 \
  --surah 94 \
  --ayah 1
```

Tekan `Ctrl+C` untuk stop.

### Device

Auto pilih CUDA jika tersedia, selain itu CPU:

```bash
python scripts/live_infer_asr.py --audio sample.wav --device auto
```

Paksa CPU:

```bash
python scripts/live_infer_asr.py --audio sample.wav --device cpu
```

Paksa CUDA:

```bash
python scripts/live_infer_asr.py --audio sample.wav --device cuda
```

## Output Live Inference

Output penting:

| Field | Arti |
|---|---|
| `pred` | Hasil transkripsi model |
| `target` | Teks ayat referensi |
| `latency_ms` | Waktu decode audio |
| `confidence` | Rata-rata probabilitas token tertinggi per frame |
| `non_blank_confidence` | Confidence hanya untuk frame non-blank |
| `blank_rate` | Rasio frame CTC blank |
| `wer` | Word Error Rate dengan harakat |
| `cer` | Character Error Rate dengan harakat |
| `wer_plain` | WER setelah harakat dibuang |
| `cer_plain` | CER setelah harakat dibuang |
| `correction` | Diff kata antara target dan prediksi |
| `top_tokens` | Token paling dominan selama decode |

Interpretasi praktis:

- `wer_plain` rendah tapi `wer` tinggi berarti kata cenderung benar, harakat masih salah.
- `blank_rate` sangat tinggi bisa berarti audio terlalu pelan, kosong, atau model tidak menangkap ucapan.
- `confidence` bukan skor tajwid. Ini hanya sinyal teknis dari probabilitas CTC.

## 2. Corrector CLI

Script:

```bash
uv run python scripts/correct.py
```

Dipakai untuk mencocokkan audio dengan ayat referensi dan memberi status per kata.

### Pakai Model Lokal

```bash
uv run python scripts/correct.py \
  --model-dir data/artifacts/checkpoints/final \
  --audio data/raw/audio/Husary_128kbps_Mujawwad/001001.wav \
  --text "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ"
```

### Pakai Model Hugging Face

```bash
uv run python scripts/correct.py \
  --hf-model rabah2026/wav2vec2-large-xlsr-53-arabic-quran-v_final \
  --audio data/raw/audio/Husary_128kbps_Mujawwad/001001.wav \
  --text "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ" \
  --show-asr
```

Output kolom:

| Kolom | Arti |
|---|---|
| `#` | Index kata |
| `status` | Status koreksi kata |
| `conf` | Confidence kata |
| `start-end` | Estimasi waktu audio |
| `word` | Kata referensi |

Status yang mungkin:

- `correct`
- `low_confidence`
- `skipped`
- `extra`

Catatan: corrector ini berbasis forced alignment. Ia bagus untuk cek "apakah bacaan cocok dengan ayat target", bukan validasi tajwid final.

## 3. FastAPI Inference untuk App

Endpoint inference app:

```http
POST /v1/practice-sessions/{sessionId}/evaluate
GET /v1/evaluation-results/{resultId}
```

Flow dari app:

1. Buat session: `POST /v1/practice-sessions`.
2. Upload audio: `POST /v1/practice-sessions/{sessionId}/audio` atau chunked upload.
3. Request evaluasi: `POST /v1/practice-sessions/{sessionId}/evaluate`.
4. Ambil hasil: `GET /v1/evaluation-results/{resultId}`.

Contoh request evaluasi:

```json
{
  "audioId": "audio_..."
}
```

`audioId` boleh kosong jika ingin memakai audio upload terbaru di session itu.

Contoh response awal:

```json
{
  "evaluation": {
    "resultId": "result_...",
    "sessionId": "session_...",
    "status": "queued"
  }
}
```

Hasil akhir diambil dari:

```http
GET /v1/evaluation-results/{resultId}
```

Response hasil berisi:

- `matchScore`
- `confidenceLevel`
- `summary`
- `recommendation`
- `highlights`
- `letterInsights`
- `status`

## Model ONNX untuk Backend

FastAPI evaluation memakai `sherpa_onnx` lewat:

```text
web/services/asr_service.py
api/services/asr_provider.py
api/services/evaluation_pipeline.py
```

Model harus ada di:

```text
external/zipformer_p-quran/
```

File wajib:

```text
external/zipformer_p-quran/quran_phoneme_zipformer.int8.onnx
external/zipformer_p-quran/tokens.txt
external/zipformer_p-quran/quran_text2phoneme.json
external/zipformer_p-quran/data/reference/quran_verses_uthmani.json
```

Kalau file ini tidak ada, backend tetap bisa start, tapi endpoint evaluasi akan gagal dengan error model belum tersedia.

Install dependency backend + ASR:

```bash
uv sync --extra backend --extra asr
```

Jalankan API:

```bash
make backend
```

## Audio Input

Target inference:

- sample rate: `16000 Hz`
- channel: mono
- format internal backend: float32 PCM

Backend menerima format app:

- `audio/webm`
- `audio/mp4`
- `audio/m4a`
- `audio/wav`

Backend decode audio memakai `ffmpeg`, jadi server perlu punya binary `ffmpeg`.

Durasi maksimum default:

```text
120 detik
```

Ukuran upload simple maksimum default:

```text
25 MB
```

## Data Reference

Untuk CLI HF inference:

```text
data/raw/text/quran_uthmani.json
```

Untuk backend ONNX:

```text
external/zipformer_p-quran/data/reference/quran_verses_uthmani.json
external/zipformer_p-quran/quran_text2phoneme.json
```

Backend evaluation mengubah target ayat menjadi phoneme target, lalu membandingkan prediksi model dengan target tersebut.

## Troubleshooting

### `Model ASR belum tersedia di server ini`

Penyebab:

- folder `external/zipformer_p-quran/` belum ada
- file ONNX/tokens/phoneme map/reference tidak lengkap
- belum install extra ASR

Cek:

```bash
ls -la external/zipformer_p-quran
```

Install:

```bash
uv sync --extra asr
```

### `ffmpeg tidak tersedia di server`

Install `ffmpeg` di OS.

Ubuntu/Debian:

```bash
sudo apt-get install ffmpeg
```

macOS:

```bash
brew install ffmpeg
```

### Mic tidak jalan di `live_infer_asr.py`

Install `sounddevice`:

```bash
uv add sounddevice
```

Untuk server/headless, pakai mode `--audio`, bukan mic.

### CUDA requested tapi tidak tersedia

Pakai CPU:

```bash
python scripts/live_infer_asr.py --audio sample.wav --device cpu
```

Atau pastikan PyTorch CUDA sudah benar.

### Hasil kosong atau blank rate tinggi

Cek:

- audio bukan silence
- sample rate bisa didecode ke 16 kHz
- durasi tidak terlalu pendek
- mic permission aktif
- reference ayat sesuai audio

## Catatan Batasan

- Inference saat ini memberi evaluasi awal, bukan penilaian tajwid final.
- Confidence bukan ukuran kebenaran bacaan secara agama.
- `wer_plain` lebih relevan untuk cek urutan kata tanpa harakat.
- Harakat dan fonem masih lebih sulit dibanding plain text matching.
- Backend menyerialkan ASR CPU-heavy agar mesin kecil tidak OOM.
