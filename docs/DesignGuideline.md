# Design Guideline

## Design Direction
Sobat Ngaji menggunakan visual language yang calm, precise, trustworthy, dan modern. Aplikasi harus terasa seperti mobile AI learning companion untuk latihan bacaan Al-Qur'an, bukan aplikasi dashboard umum.

## Design Foundation
- Base system: Material 3.
- Layout: mobile-first.
- UI density: nyaman untuk latihan harian, tidak terlalu padat.
- Primary pattern: feature-first screen, reusable components, consistent state.
- Main navigation: bottom navigation dengan Home, Practice, Insight, Profile.

## Color Palette
### Brand
- Ink Deep: `#0B1220`
- Ink / Navy: `#101A2E`
- Navy 2: `#1A2A46`
- Surface: `#F7FAFC`
- Surface Muted: `#EEF4F7`
- Surface Soft: `#F3F8FA`
- Surface Elevated: `#FFFFFF`
- Line: `#DBE6ED`
- Muted Text: `#6B7A8C`
- Aqua: `#32D5C8`
- Cyan: `#53C7F0`
- Teal: `#17B8A6`

### Semantic
- Success: `#20C997`
- Success Soft: `#DDF8EF`
- Warning: `#F5A524`
- Warning Soft: `#FFF1CF`
- Error: `#EF476F`
- Error Soft: `#FFE3EA`
- Info: `#4DA3FF`
- Info Soft: `#E0F0FF`

### Usage Rules
- Aqua/cyan dipakai untuk AI, brand action, dan current recitation.
- Navy + Navy 2 dipakai untuk hero, auth header, dan strong AI/brand panels.
- Surface Elevated dipakai untuk card dan floating navigation.
- Green dipakai untuk bacaan yang terbaca baik.
- Red dipakai untuk bagian yang perlu diulang atau error.
- Yellow/orange dipakai untuk warning atau perlu dicek.
- Soft semantic colors dipakai untuk badge, chip, progress background, dan low-emphasis state.
- Jangan membuat semua state hijau.
- Jangan mengganti palette tanpa update dokumen ini.

## Typography
### Latin
- Font target: Inter, SF Pro, atau system sans.
- H1: 32/40, semibold.
- H2: 24/32, semibold.
- H3: 20/28, semibold.
- Body: 16/24, regular.
- Caption: 12/16, medium.

### Arabic
- Font target: Noto Naskh Arabic atau font Arabic yang mudah dibaca.
- Arabic Display: 34/52.
- Arabic Body: 26/44.
- Arabic Small: 20/34.
- Arabic text harus punya line-height lega dan tidak boleh tertutup control UI.

## Spacing
Gunakan kelipatan 4, dengan token utama:
- `4`: micro gap.
- `8`: compact gap.
- `16`: default spacing.
- `24`: section spacing.
- `32`: large section spacing.
- `40`: hero spacing.

## Border Radius
- Small: 10.
- Medium: 14.
- Default card: 18.
- Hero card: 24.
- Pill/chip: full radius.

## Elevation
- Level 0: no shadow, flat surface.
- Level 1: subtle card shadow.
- Level 2: floating component seperti FAB.
- Level 3: modal/dialog.

Shadow harus soft, tidak keras, dan tidak membuat UI terlihat seperti admin panel.

## Component Rules
### Daily Qira
- Harus menjadi hero di Home.
- Bukan card biasa.
- Memuat focus letter, estimated time, AI confidence, dan primary action.

### AI Insight
- Harus terasa personal.
- Copy memakai gaya "AI menemukan..." atau "Kami menyarankan...".
- Jangan menampilkan AI sebagai card statistik kaku.

### Recording UI
- Harus punya state jelas: idle, recording, processing, completed, failed.
- Waveform atau visual audio dipakai untuk memberi rasa hidup.

### Evaluation Result
- Score tidak berdiri sendiri.
- Harus selalu disertai summary, highlight, dan next action.

### Bottom Navigation
- Final item: Home, Practice, Insight, Profile.
- Jangan menambah tab baru tanpa alasan produk yang kuat.

## Motion Rules
- Gunakan motion untuk recording, AI thinking, loading, progress, dan score reveal.
- Motion harus halus dan tidak mengganggu pembacaan.
- Implementasi final harus mempertimbangkan reduced motion.

## UX Copy Rules
Gunakan:
- "AI menemukan..."
- "Perlu dicek"
- "Coba ulangi bagian ini"
- "Kecocokan bacaan"
- "Evaluasi awal"

Hindari:
- "Pasti benar"
- "Pasti salah"
- "AI menjamin"
- "Bacaan kamu salah total"
