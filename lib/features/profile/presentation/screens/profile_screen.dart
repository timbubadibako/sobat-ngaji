import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme.dart';
import '../../../../features/auth/presentation/controllers/auth_controller.dart';
import '../../../../shared/widgets/state_views.dart';
import '../controllers/profile_controller.dart';
import '../widgets/achievement_card.dart';
import '../widgets/learning_summary_card.dart';
import '../widgets/logout_button.dart';
import '../widgets/preference_row.dart';
import '../widgets/profile_header.dart';

/// Profile screen with lightweight identity, summary, preferences, and logout.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileControllerProvider);
    final user = ref.watch(authControllerProvider).valueOrNull?.user;

    return Scaffold(
      body: SafeArea(
        child: profileState.when(
          loading: () => const LoadingState(message: 'Memuat profile...'),
          error: (error, _) => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              ErrorStateView(
                error: error,
                onRetry: () =>
                    ref.read(profileControllerProvider.notifier).refresh(),
              ),
              const SizedBox(height: AppSpacing.md),
              LogoutButton(
                onLogout: () =>
                    ref.read(authControllerProvider.notifier).logout(),
              ),
            ],
          ),
          data: (profile) => RefreshIndicator(
            onRefresh: () =>
                ref.read(profileControllerProvider.notifier).refresh(),
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                Text(
                  'Profile',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  'Learning powered by AI.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.md),
                ProfileHeader(user: user, profile: profile),
                const SizedBox(height: AppSpacing.md),
                LearningSummaryCard(profile: profile),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Preferences',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpacing.xs),
                for (final preference in profile.preferences)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                    child: PreferenceRow(preference: preference),
                  ),
                const SizedBox(height: AppSpacing.md),
                AchievementCard(text: profile.achievement),
                const SizedBox(height: AppSpacing.md),
                LogoutButton(
                  onLogout: () =>
                      ref.read(authControllerProvider.notifier).logout(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
