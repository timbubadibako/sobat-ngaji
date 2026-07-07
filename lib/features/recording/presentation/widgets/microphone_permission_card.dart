import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';

/// Permission failure card with actionable copy.
class MicrophonePermissionCard extends StatelessWidget {
  const MicrophonePermissionCard({this.message, super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.surfaceMuted,
      child: Row(
        children: [
          const Icon(Icons.mic_off_outlined, color: AppColors.warning),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              message ??
                  'Izin mikrofon belum aktif. Aktifkan untuk mulai merekam.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
