import 'package:flutter/material.dart';
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
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Expanded(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return index % 2 == 0 ? const ContactMessage() : const MyMessage();
        },
        itemCount: 100,
      )),
    ));
  }
}
