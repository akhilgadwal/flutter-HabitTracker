import 'package:flutter/material.dart';

import '../component/alertbox.dart';
import '../component/floating.dart';
import '../component/habitTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todayShabitList = [
    ['Moring run', false],
    ['Break Fast', false]
  ];

  bool habitcontroled = false;

  //function for checking tap
  void checkTap(bool? value, int index) {
    setState(() {
      todayShabitList[index][1] = value!;
    });
  }

//text editing controller

  final habittextcontroller = TextEditingController();
  void creatnewHabit() {
    showDialog(
        context: context,
        builder: (context) {
          return EnterNewHabit(
            onsave: savehabit,
            onCancel: cancelhabit,
            controller: habittextcontroller,
          );
        });
  }

  void savehabit() {
    setState(() {
      if (habittextcontroller.text.isEmpty) {
        return;
      }
      todayShabitList.add([habittextcontroller.text, false]);
    });
    habittextcontroller.clear();
    Navigator.of(context).pop();
  }

  void cancelhabit() {
    habittextcontroller.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: ListView.builder(
          itemCount: todayShabitList.length,
          itemBuilder: (context, index) {
            return HabitTile(
              habitTitle: todayShabitList[index][0],
              ishabitCom: todayShabitList[index][1],
              onchanged: (value) => checkTap(value, index),
            );
          }),
      floatingActionButton: MyFloatingActionButton(
        onPressed: creatnewHabit,
      ),
    );
  }
}
