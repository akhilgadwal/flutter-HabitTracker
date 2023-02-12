import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  final String habitTitle;
  final bool ishabitCom;
  //function for checking
  final Function(bool?)? onchanged;
  const HabitTile(
      {super.key,
      required this.habitTitle,
      required this.ishabitCom,
      this.onchanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9), color: Colors.white),
        child: Row(children: [
          Checkbox(
            value: ishabitCom,
            onChanged: onchanged,
            checkColor: Colors.white,
          ),
          Text(
            habitTitle,
            style: const TextStyle(fontSize: 20),
          ),
        ]),
      ),
    );
  }
}
