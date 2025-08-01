import 'package:annale_driver/modules/help_support/models/chat_model.dart';
import 'package:get/get.dart';

class HelpSupportController extends GetxController {
  RxList<ChatMessage> messages = <ChatMessage>[
    ChatMessage(text: "Hi there! How can I assist you today?", isUser: false),
    ChatMessage(
      text: "I'm having trouble with my ride. It seems to be delayed.",
      isUser: true,
    ),
    ChatMessage(
      text:
          "I'm sorry to hear that. Can you please provide your booking number?",
      isUser: false,
    ),
    ChatMessage(text: "I'm sorry to hear that", isUser: true),
  ].obs;

  void sendMessage(String message) {
    if (message.trim().isEmpty) return;
    messages.add(ChatMessage(text: message.trim(), isUser: true));
  }
}
