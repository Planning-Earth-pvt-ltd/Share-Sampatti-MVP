import 'dart:async';
import 'dart:convert';

import 'package:share_sampatti_mvp/app/app.dart';

class AssistantState {
  final Map<String, dynamic>? jsonData;
  final List<Map<String, dynamic>> assistant;
  final bool isLoading;

  AssistantState({
    this.jsonData,
    this.assistant = const [],
    this.isLoading = false,
  });

  AssistantState copyWith({
    Map<String, dynamic>? jsonData,
    List<Map<String, dynamic>>? assistant,
    bool? isLoading,
  }) {
    return AssistantState(
      jsonData: jsonData ?? this.jsonData,
      assistant: assistant ?? this.assistant,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AssistantNotifier extends StateNotifier<AssistantState> {
  Timer? _timer;

  AssistantNotifier() : super(AssistantState());

  Future<void> startAssistant() async {
    final String jsonString = await rootBundle.loadString(
      AppConstants.jsonChatBot,
    );
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);

    state = state.copyWith(jsonData: jsonData, assistant: [jsonData["start"]]);
  }

  Future<void> nextInstruction(Map<String, dynamic> value) async {
    final updateAssistant = List<Map<String, dynamic>>.from(state.assistant)
      ..add(value)
      ..add(state.jsonData![value["next"]]);

    state = state.copyWith(assistant: updateAssistant, isLoading: true);

    _timer?.cancel();
    _timer = Timer(Duration(seconds: 1), () {
      if (mounted) {
        state = state.copyWith(isLoading: false);
      }
    });
  }
}

final chatBotProvider =
    StateNotifierProvider.autoDispose<AssistantNotifier, AssistantState>(
      (ref) => AssistantNotifier(),
    );
