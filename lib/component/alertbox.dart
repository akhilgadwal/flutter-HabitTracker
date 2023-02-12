import 'package:flutter/material.dart';

class EnterNewHabit extends StatelessWidget {
  final controller;
  final Function()? onsave;
  final Function()? onCancel;
  const EnterNewHabit(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade900,
      title: const Text(
        'Add New Habit',
        style: TextStyle(color: Colors.green),
      ),
      content: TextField(
        controller: controller,
        style: TextStyle(color: Colors.green),
        decoration: InputDecoration(
          hintText: 'Enter Habit',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
      ),
      actions: [
        ElevatedButton(onPressed: onsave, child: const Text('Save')),
        ElevatedButton(onPressed: onCancel, child: const Text('Cancel'))
      ],
    );
  }
}
