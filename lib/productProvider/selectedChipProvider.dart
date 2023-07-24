import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedChipProvider = StateNotifierProvider<SelectedChip, String>((ref) {
  return SelectedChip();
});

class SelectedChip extends StateNotifier<String> {
  SelectedChip() : super('All');
  void updateState(String chipState) {
    state = chipState;
  }
}
