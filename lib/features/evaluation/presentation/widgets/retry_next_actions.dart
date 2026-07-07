import 'package:flutter/material.dart';

/// Retry recording or continue to Insight.
class RetryNextActions extends StatelessWidget {
  const RetryNextActions({
    required this.onRetry,
    required this.onNext,
    super.key,
  });

  final VoidCallback onRetry;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.tonalIcon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FilledButton.icon(
            onPressed: onNext,
            icon: const Icon(Icons.insights),
            label: const Text('Next'),
          ),
        ),
      ],
    );
  }
}
