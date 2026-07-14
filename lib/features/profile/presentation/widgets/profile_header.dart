import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../features/auth/domain/entities/auth_user.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/profile_summary.dart';

/// User identity header.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({required this.user, required this.profile, super.key});

  final AuthUser? user;
  final ProfileSummary profile;

  @override
  Widget build(BuildContext context) {
    final name = user?.name ?? 'Sobat';
    final initial = name.trim().isEmpty ? 'S' : name.trim()[0].toUpperCase();

    return AppCard(
      borderColor: AppColors.line,
      elevation: AppElevation.level1,
      shadowColor: AppColors.ink.withValues(alpha: 0.10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 72,
                height: 72,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.hero),
                  gradient: const LinearGradient(
                    colors: [AppColors.aqua, AppColors.cyan],
                  ),
                ),
                child: Text(
                  initial,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.navy,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: Theme.of(context).textTheme.titleLarge),
                    Text(
                      'Pemula · ${profile.streakDays} hari beruntun',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              _HeaderStat(value: '${profile.streakDays}', label: 'Streak'),
              const SizedBox(width: AppSpacing.xs),
              _HeaderStat(value: '${profile.totalSessions}', label: 'Sesi'),
              const SizedBox(width: AppSpacing.xs),
              _HeaderStat(value: '${profile.averageScore}', label: 'Rata-rata'),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderStat extends StatelessWidget {
  const _HeaderStat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surfaceSoft,
          borderRadius: BorderRadius.circular(AppRadius.medium),
          border: Border.all(color: AppColors.line),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: Theme.of(context).textTheme.titleLarge),
              Text(label, style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ),
      ),
    );
  }
}
