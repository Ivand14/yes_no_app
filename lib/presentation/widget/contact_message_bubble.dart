import 'package:flutter/material.dart';

class ContactMessage extends StatelessWidget {
  const ContactMessage({super.key});

  @override
  Widget build(BuildContext context) {
    // final bubbleColor = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
          child: Container(
            width: 250,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                'Ipsum pariatur qui adipisicing ',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}