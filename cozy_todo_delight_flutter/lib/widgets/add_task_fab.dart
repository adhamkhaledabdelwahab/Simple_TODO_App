import 'package:flutter/material.dart';

class AddTaskFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const AddTaskFAB({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
