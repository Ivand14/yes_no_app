import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ContactMessage extends StatelessWidget {
  final Message herMessage;

  const ContactMessage({super.key, required this.herMessage});

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                herMessage.text,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        _ImageBubble(
          imageUrl: herMessage.imageUrl!,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Image.network(
        imageUrl,
        height: size.height * 0.3,
        width: size.width * 0.7,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            height: size.height * 0.3,
            width: size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text('Loading...'),
          );
        },
      ),
    );
  }
}
