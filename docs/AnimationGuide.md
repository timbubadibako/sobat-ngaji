# Animation Guide

Motion di Sobat Ngaji harus membantu user memahami state, bukan menjadi dekorasi berlebihan.

## Motion Tokens
```text
Fast: 160ms
Normal: 220ms
Hero: 300ms
Slow: 420ms
Wave: linear / continuous
```

## Screen Motion
| Element | Motion | Duration | Curve |
| --- | --- | --- | --- |
| Screen enter | Fade + slight slide up | 220ms | easeOut |
| Daily Qira hero | Fade + scale 0.98 to 1 | 300ms | easeOutCubic |
| Card reveal | Fade + translateY 8 | 200ms | easeOut |
| Bottom nav active | Color + background transition | 250ms | easeOut |
| Dialog | Fade + scale | 220ms | easeOutBack |

## Recording Motion
| Element | Motion | Rule |
| --- | --- | --- |
| Waveform | Continuous height animation | Hanya saat recording/listening |
| Record button | Pulse ring | Tidak terlalu cepat |
| Timer | No animation | Harus mudah dibaca |
| AI listening | Dots thinking | 1.2s loop |

## Evaluation Motion
| Element | Motion | Duration |
| --- | --- | --- |
| Score ring | Sweep reveal | 700ms |
| Highlight word | Soft background fade | 220ms |
| Recommendation card | Fade in after score | 260ms |

## Reduced Motion
Jika reduced motion aktif:
- Matikan pulse dan waveform loop.
- Pakai static waveform.
- Pertahankan state change lewat warna, label, dan icon.

## Rule
Motion tidak boleh mengganggu pembacaan Arabic text.

