import 'package:flutter_riverpod/flutter_riverpod.dart';

class HoversNotifier extends StateNotifier<List<bool>> {
  HoversNotifier({int initialLength = 9})
      : super(List<bool>.filled(initialLength, false));
  void setHover(int index, bool value) {
    if (index >= state.length) {
      final extended = List<bool>.from(state);
      extended.addAll(List<bool>.filled(index - state.length + 1, false));
      state = extended;
    }
    final next = List<bool>.from(state);
    next[index] = value;
    state = next;
  }
}

final hoversProvider =
    StateNotifierProvider<HoversNotifier, List<bool>>((ref) {
  return HoversNotifier();
});

