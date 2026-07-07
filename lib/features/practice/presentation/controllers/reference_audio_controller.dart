import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/services/reference_audio_service.dart';

/// Tracks reference audio playback request state.
class ReferenceAudioController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> play(String audioUrl) async {
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(
      () => ref.read(referenceAudioServiceProvider).play(audioUrl),
    );
  }
}

final referenceAudioControllerProvider =
    AsyncNotifierProvider<ReferenceAudioController, void>(
      ReferenceAudioController.new,
    );
