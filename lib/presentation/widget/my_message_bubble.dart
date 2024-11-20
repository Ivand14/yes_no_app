import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessage extends StatelessWidget {

  final Message message;


  const MyMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final bubbleColor = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
          child: Container(
            width: 250,
            decoration: BoxDecoration(
                color: bubbleColor.primary,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                message.text,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
