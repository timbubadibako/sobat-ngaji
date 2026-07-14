import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/recording_state.dart';

/// Realtime WebSocket event list for recording progress.
class RealtimeEventList extends StatelessWidget {
  const RealtimeEventList({
    required this.sessionId,
    required this.events,
    super.key,
  });

  final String sessionId;
  final List<RecordingEvent> events;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      borderColor: AppColors.line,
      elevation: AppElevation.level1,
      shadowColor: AppColors.ink.withValues(alpha: 0.10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Realtime events',
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Text(sessionId, style: theme.textTheme.labelMedium),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          if (events.isEmpty)
            Text(
              'Event akan muncul saat rekaman dimulai.',
              style: theme.textTheme.bodyMedium,
            )
          else
            ...events.map(
              (event) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColors.aqua,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.aqua.withValues(alpha: 0.26),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(event.name, style: theme.textTheme.bodyMedium),
                          Text(
                            event.description,
                            style: theme.textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
