import 'package:flutter_riverpod/flutter_riverpod.dart';

final messagetitleProvider =
    StateNotifierProvider<MessageTitleProvider, String>((ref) {
  return MessageTitleProvider();
});

class MessageTitleProvider extends StateNotifier<String> {
  MessageTitleProvider() : super("Offer");
  void updateMessage(String selectedMessage) {
    state = selectedMessage;
  }
}

final messagebodyProvider =
    StateNotifierProvider<MessageBodyProvider, String>((ref) {
  return MessageBodyProvider();
});

class MessageBodyProvider extends StateNotifier<String> {
  MessageBodyProvider()
      : super(" 30% off on purchase of products in our store ");
  void updateMessage(String newMessage) {
    state = newMessage;
  }
}
