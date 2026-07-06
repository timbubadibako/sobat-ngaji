# AI Architecture and Flow

## Principle
AI adalah learning companion. AI memberi evaluasi awal, confidence, insight, dan rekomendasi latihan. AI tidak menggantikan guru atau pembimbing.

## MVP Evaluation Flow
```text
Practice Item
-> Reference Audio
-> User Recording
-> WebSocket session opened
-> Audio upload / mock input
-> AI processing event stream
-> Evaluation result event
-> Retry / Next Practice
```

## Processing States
- `idle`: belum mulai.
- `listening`: user sedang merekam.
- `uploading`: audio dikirim.
- `thinking`: AI memproses.
- `completed`: hasil tersedia.
- `failed`: proses gagal.

## Realtime Transport
WebSocket adalah transport utama untuk status recording, upload, AI processing, completed, dan failed. Prototype boleh memakai mock adapter, tetapi event name dan state transition harus mengikuti contract final.

## Evaluation Output
```text
matchScore
confidenceLevel
summary
recommendation
highlights
letterInsights
```

## Highlight Status
- `read`: sudah terbaca baik.
- `current`: sedang dibaca.
- `needs_check`: perlu dicek.
- `needs_retry`: perlu diulang.

## Mock AI Rules
Selama MVP belum memakai backend AI real:
- Mock result harus memakai contract yang sama dengan API final.
- Mock tidak boleh tersebar di widget.
- Mock ditempatkan di EvaluationService atau repository implementation.

## Real AI Direction
Fase lanjut:
- ASR untuk transkripsi atau phonetic approximation.
- Alignment antara audio user dan referensi.
- Analisis pola huruf yang sering meleset.
- Confidence scoring.
- Personalized practice recommendation.

## Scope Guard
Realtime WebSocket di MVP berarti realtime progress/session event. MVP tidak mengklaim real-time correction penuh per huruf saat user sedang membaca kecuali prototype benar-benar membuktikan kemampuan itu.

## Copywriting
Gunakan:
- "AI menemukan..."
- "Evaluasi awal menunjukkan..."
- "Bagian ini perlu dicek..."
- "Coba ulangi bagian ini..."

Hindari:
- "Pasti salah"
- "Pasti benar"
- "AI menjamin"
- "Bacaan kamu salah total"
