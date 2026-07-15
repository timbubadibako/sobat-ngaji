import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/aqua_screen_scaffold.dart';
import '../../../../shared/widgets/app_card.dart';

/// Quran reading surface placeholder for standard mushaf page flow.
class MushafScreen extends StatelessWidget {
  const MushafScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AquaScreenScaffold(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.md,
          128,
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mushaf', style: theme.textTheme.headlineMedium),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      'Baca per halaman standar.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton.filledTonal(
                onPressed: () => _showNavigationSheet(context),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.navy,
                  foregroundColor: AppColors.surfaceElevated,
                ),
                icon: const Icon(Icons.tune_rounded),
                tooltip: 'Navigasi mushaf',
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            color: AppColors.surfaceElevated,
            borderColor: AppColors.cyan.withValues(alpha: 0.26),
            elevation: AppElevation.level2,
            shadowColor: AppColors.ink.withValues(alpha: 0.14),
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                Row(
                  children: [
                    _MetaPill(label: 'Halaman 1'),
                    const Spacer(),
                    _MetaPill(label: 'Al-Fatihah'),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: AppColors.navy,
                    fontWeight: FontWeight.w800,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'اَلْحَمْدُ لِلّٰهِ رَبِّ الْعٰلَمِيْنَ ۝ '
                  'الرَّحْمٰنِ الرَّحِيْمِ ۝ مٰلِكِ يَوْمِ الدِّيْنِ ۝ '
                  'اِيَّاكَ نَعْبُدُ وَاِيَّاكَ نَسْتَعِيْنُ ۝',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 28,
                    height: 2.05,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                const Divider(color: AppColors.line),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    IconButton.outlined(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_left_rounded),
                      tooltip: 'Halaman sebelumnya',
                    ),
                    Expanded(
                      child: Text(
                        'Sumber mushaf standar akan dipasang setelah format data final.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.muted,
                          height: 1.35,
                        ),
                      ),
                    ),
                    IconButton.outlined(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_rounded),
                      tooltip: 'Halaman berikutnya',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            color: AppColors.navy,
            borderColor: AppColors.aqua.withValues(alpha: 0.34),
            elevation: AppElevation.level2,
            shadowColor: AppColors.ink.withValues(alpha: 0.18),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [AppColors.aqua, AppColors.cyan],
                    ),
                  ),
                  child: const Icon(Icons.mic_rounded, color: AppColors.navy),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'Practice akan memakai ayat aktif dari halaman ini setelah navigasi mushaf final.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.surfaceElevated.withValues(alpha: 0.82),
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showNavigationSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: AppColors.surfaceElevated,
      builder: (context) {
        final theme = Theme.of(context);

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.xs,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Navigasi mushaf', style: theme.textTheme.titleLarge),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Surah, juz, dan lompat halaman akan dipasang setelah data mushaf final.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                FilledButton.tonalIcon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded),
                  label: const Text('Tutup'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MetaPill extends StatelessWidget {
  const _MetaPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.infoSoft,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: AppColors.info.withValues(alpha: 0.24)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xxs,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.navy,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
