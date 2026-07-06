# Database Schema

## Principles
- Simpan data yang diperlukan untuk latihan dan insight.
- Audio recording dianggap sensitif.
- Evaluation result adalah evaluasi awal, bukan keputusan final.

## Tables
### users
```text
id
name
email
created_at
updated_at
```

### practice_items
```text
id
surah_name
ayah_number
arabic_text
latin_hint
translation_hint
reference_audio_url
difficulty
created_at
updated_at
```

### practice_sessions
```text
id
user_id
practice_item_id
status
started_at
completed_at
audio_url
created_at
updated_at
```

Status:
```text
started
recording
processing
completed
failed
```

### evaluation_results
```text
id
session_id
match_score
confidence_level
summary
recommendation
created_at
```

Confidence:
```text
low
medium
high
```

### ayah_highlights
```text
id
evaluation_result_id
text_segment
status
note
start_index
end_index
created_at
```

Status:
```text
read
current
needs_check
needs_retry
```

### letter_mastery
```text
id
user_id
letter
mastery_score
mistake_count
last_practiced_at
updated_at
```

### weekly_reports
```text
id
user_id
week_start
week_end
average_score
practice_count
focus_letter
summary
created_at
```

## Relationship
- users has many practice_sessions.
- practice_items has many practice_sessions.
- practice_sessions has one evaluation_result.
- evaluation_results has many ayah_highlights.
- users has many letter_mastery rows.
- users has many weekly_reports.

## Privacy
- Private audio URL tidak boleh public by default.
- Retention audio harus bisa dikonfigurasi.
- User harus tahu saat audio dikirim ke evaluation service.

