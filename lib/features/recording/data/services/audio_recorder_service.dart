import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Audio recorder abstraction for microphone permission and lifecycle.
abstract interface class AudioRecorderService {
  Future<bool> requestPermission();

  Future<void> start(String sessionId);

  Future<void> stop(String sessionId);
}

/// Mock recorder used until native recording integration lands.
class MockAudioRecorderService implements AudioRecorderService {
  const MockAudioRecorderService();

  @override
  Future<bool> requestPermission() async {
    // TODO(jrilym): Replace with platform microphone permission package.
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return true;
  }

  @override
  Future<void> start(String sessionId) async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
  }

  @override
  Future<void> stop(String sessionId) async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
  }
}

final audioRecorderServiceProvider = Provider<AudioRecorderService>((ref) {
  return const MockAudioRecorderService();
});
