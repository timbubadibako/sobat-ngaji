import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sobat_ngaji/features/practice/data/datasources/practice_local_data_source.dart';
import 'package:sobat_ngaji/features/practice/data/repositories/practice_repository_impl.dart';
import 'package:sobat_ngaji/features/practice/presentation/screens/practice_detail_screen.dart';
import 'package:sobat_ngaji/features/practice/presentation/screens/practice_screen.dart';

void main() {
  testWidgets('PracticeScreen renders curated practice list', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          practiceLocalDataSourceProvider.overrideWithValue(
            const MockPracticeLocalDataSource(),
          ),
        ],
        child: const MaterialApp(home: PracticeScreen()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Latihan'), findsOneWidget);
    expect(find.text('Frasa kurasi'), findsOneWidget);
    expect(find.text('Progres latihan'), findsOneWidget);
    expect(find.text('Ad-Dhuha'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -320));
    await tester.pumpAndSettle();

    expect(find.text('Al-Fatihah'), findsOneWidget);
  });

  testWidgets('PracticeDetailScreen renders selected ayah', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          practiceLocalDataSourceProvider.overrideWithValue(
            const MockPracticeLocalDataSource(),
          ),
        ],
        child: const MaterialApp(
          home: PracticeDetailScreen(practiceId: 'ad_dhuha_1'),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Ad-Dhuha'), findsOneWidget);
    expect(find.text('وَالضُّحَىٰ'), findsOneWidget);
    expect(find.text('Dengar referensi'), findsOneWidget);
  });
}
