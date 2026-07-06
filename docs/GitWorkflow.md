# Git Workflow

## Branching
Gunakan branch per feature:

```text
feature/authentication
feature/home
feature/practice
fix/recording-permission
chore/project-docs
```

## Commit Message
Gunakan format ringkas:

```text
feat: add authentication feature
fix: handle microphone permission error
docs: add flutter architecture guide
refactor: split practice widgets
test: add practice controller tests
```

## Pull Request Checklist
- Requirement dan acceptance criteria disebutkan.
- Screenshot atau screen recording untuk UI changes.
- Test/analyze result disebutkan.
- File yang dimodifikasi relevan dengan feature.
- Tidak ada unrelated refactor.

## Rule
Jangan gabungkan banyak sprint dalam satu PR. Satu PR idealnya satu feature atau satu fix yang jelas.

