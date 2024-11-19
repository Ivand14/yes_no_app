import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color.fromARGB(51, 0, 0, 0)));

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final inputDecoration = InputDecoration(
        hintText: 'Enter a message whit a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_sharp),
          onPressed: () {
            textController.clear();
            focusNode.requestFocus();
          },
        ));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      decoration: inputDecoration,
      controller: textController,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
