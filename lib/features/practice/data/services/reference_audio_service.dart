import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Controls reference-audio playback behind a replaceable abstraction.
abstract interface class ReferenceAudioService {
  Future<void> play(String audioUrl);
}

/// Mock reference audio adapter for Sprint 3.
class MockReferenceAudioService implements ReferenceAudioService {
  const MockReferenceAudioService();

  @override
  Future<void> play(String audioUrl) async {
    // TODO(jrilym): Replace with real audio player package integration.
    await Future<void>.delayed(const Duration(milliseconds: 250));
  }
}

final referenceAudioServiceProvider = Provider<ReferenceAudioService>((ref) {
  return const MockReferenceAudioService();
});
