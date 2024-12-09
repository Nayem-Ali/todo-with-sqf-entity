import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({
    super.key,
    required this.todoTitleController,
    required this.onPressed,
  });

  final TextEditingController todoTitleController;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: todoTitleController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.title),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.send),
        ),
      ),
    );
  }
}
