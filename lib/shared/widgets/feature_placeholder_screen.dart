import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../../features/auth/presentation/controllers/auth_controller.dart';

class FeaturePlaceholderScreen extends ConsumerWidget {
  const FeaturePlaceholderScreen({
    required this.title,
    required this.subtitle,
    this.showLogout = false,
    super.key,
  });

  final String title;
  final String subtitle;
  final bool showLogout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final userName = authState.valueOrNull?.user.name;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: AppSpacing.xs),
            Text(subtitle, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: AppSpacing.md),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName == null ? 'Authenticated' : 'Halo, $userName',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    const Text(
                      'Feature ini sengaja placeholder agar auth redirect dan app shell bisa diuji tanpa mengimplementasikan sprint lain.',
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            if (showLogout)
              FilledButton.tonalIcon(
                onPressed: () =>
                    ref.read(authControllerProvider.notifier).logout(),
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
          ],
        ),
      ),
    );
  }
}
