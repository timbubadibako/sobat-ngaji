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

    expect(find.text('Latihan hari ini'), findsOneWidget);
    expect(find.text('وَالضُّحَىٰ'), findsOneWidget);
    expect(find.text('Ad-Dhuha · Ayat 1'), findsOneWidget);
  });
}
