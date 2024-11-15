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
        ),
        _ImageBubble()
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Image.network(
        'https://yesno.wtf/assets/no/30-d37eee83c3c2180de4edb7da6fa9f5b7.gif',
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
