import 'package:flutter/material.dart';

import '../../../../app/theme.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../domain/entities/evaluation_result.dart';

/// Highlighted Arabic result with semantic status legend.
class AyahHighlightCard extends StatelessWidget {
  const AyahHighlightCard({required this.result, super.key});

  final EvaluationResult result;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ayah highlight', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            textDirection: TextDirection.rtl,
            alignment: WrapAlignment.end,
            children: result.highlights.map((segment) {
              return Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xs,
                  vertical: AppSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: _backgroundColor(segment.status),
                  borderRadius: BorderRadius.circular(AppRadius.small),
                  border: Border(
                    bottom: BorderSide(color: _color(segment.status), width: 3),
                  ),
                ),
                child: Text(
                  segment.segment,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(fontSize: 30, height: 44 / 30),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.sm),
          const HighlightLegend(),
        ],
      ),
    );
  }

  Color _color(HighlightStatus status) {
    return switch (status) {
      HighlightStatus.read => AppColors.success,
      HighlightStatus.current => AppColors.info,
      HighlightStatus.needsCheck => AppColors.warning,
      HighlightStatus.needsRetry => AppColors.error,
    };
  }

  Color _backgroundColor(HighlightStatus status) {
    return switch (status) {
      HighlightStatus.read => AppColors.successSoft,
      HighlightStatus.current => AppColors.infoSoft,
      HighlightStatus.needsCheck => AppColors.warningSoft,
      HighlightStatus.needsRetry => AppColors.errorSoft,
    };
  }
}

/// Semantic legend for highlight colors.
class HighlightLegend extends StatelessWidget {
  const HighlightLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: const [
        _LegendDot(color: AppColors.success, label: 'Terbaca baik'),
        _LegendDot(color: AppColors.info, label: 'Sedang dibaca'),
        _LegendDot(color: AppColors.warning, label: 'Perlu dicek'),
        _LegendDot(color: AppColors.error, label: 'Perlu diulang'),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, size: 10, color: color),
        const SizedBox(width: AppSpacing.xxs),
        Text(label, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
