import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final yesOrNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola como estas?', fromWho: FromWho.me),
    Message(text: 'Regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String message) async {
    final newMessage = Message(text: message, fromWho: FromWho.me);

    if (message.isEmpty) return;

    messageList.add(newMessage);

    if (message.endsWith('?')) {
      await herResponse();
    }

    notifyListeners();
    chatController();
  }

  Future<void> chatController() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceOut);
  }

  Future<void> herResponse() async {
    final response = await yesOrNoAnswer.getAnswer();
    messageList.add(response);
    notifyListeners();
    chatController();
  }
}
