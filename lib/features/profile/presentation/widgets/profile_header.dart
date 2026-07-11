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
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.navy,
            child: Text(
              initial,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.surfaceElevated,
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
                  'Beginner track · Juz 30 focus',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.xs),
                Wrap(
                  spacing: AppSpacing.xs,
                  children: [
                    Chip(label: Text('${profile.streakDays} day streak')),
                    const Chip(label: Text('AI companion')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
