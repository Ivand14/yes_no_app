import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/main.dart';
import 'package:yes_no_app/presentation/provider/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/shared/message_field_box.dart';
import 'package:yes_no_app/presentation/widget/contact_message_bubble.dart';
import 'package:yes_no_app/presentation/widget/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trini ❤️'),
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/bd/88/95/bd88954a01152a01763ae356e665a251.jpg'),
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  
                  return (message.fromWho == FromWho.other)
                      ? ContactMessage(herMessage: message)
                      : MyMessage(message: message);
                },
                itemCount: chatProvider.messageList.length,
              ),
            ),
          ),
          MessageFieldBox(
            onValue: (value) => chatProvider.sendMessage(value),
          ),
        ],
      ),
    );
  }
}
