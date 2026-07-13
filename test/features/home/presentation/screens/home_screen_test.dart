import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sobat_ngaji/features/home/data/datasources/home_remote_data_source.dart';
import 'package:sobat_ngaji/features/home/data/repositories/home_repository_impl.dart';
import 'package:sobat_ngaji/features/home/presentation/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen renders static Daily Qira content', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeRemoteDataSourceProvider.overrideWithValue(
            const MockHomeRemoteDataSource(),
          ),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.pump();
    expect(find.text('Menyiapkan Daily Qira...'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Siap lanjut latihan hari ini?'), findsOneWidget);
    expect(find.text('CONTINUE LEARNING'), findsOneWidget);
    expect(find.text('Weekly Progress'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -420));
    await tester.pumpAndSettle();

    expect(find.text('Latihan Terakhir'), findsOneWidget);
    expect(find.text('AI Insight'), findsOneWidget);
  });
}
