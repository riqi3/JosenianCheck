import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';
import '../providers/classlistprovider.dart';

class RosterWidget extends StatelessWidget {
  String id;
  String className;
  List<Student> students;
  RosterWidget(
      {super.key,
      required this.id,
      required this.className,
      required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(className),
        ),
        body: Column(
          children: [
            context.read<ClassListProvider>().checkEmpty(id)
                ? emptyCard(context)
                : Expanded(
                    child: ListView(
                        children: students.map((e) {
                      return Text('${e.id}. ${e.last}, ${e.first} ${e.middle}');
                    }).toList()),
                  ),
            ElevatedButton(
                onPressed: () {
                  addStudent(context, id);
                },
                child: const Text('Add Student'))
          ],
        ));
  }

  Future<void> addStudent(BuildContext context, String id) async {
    TextEditingController studentNumController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController middleNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController programController = TextEditingController();
    TextEditingController degreeController = TextEditingController();
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: const Text(
              "Add Student",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            content: Column(
              children: [
                TextField(
                  controller: studentNumController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Student No.',
                  ),
                ),
                TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                ),
                TextField(
                  controller: middleNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Middle Name',
                  ),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                ),
                TextField(
                  controller: programController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Program',
                  ),
                ),
                TextField(
                  controller: degreeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Degree',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: (() {
                    if (firstNameController.text.isNotEmpty) {
                      var newStudent = Student(
                          studentNo: studentNumController.text,
                          firstName: firstNameController.text,
                          middleName: middleNameController.text,
                          lastName: lastNameController.text,
                          program: programController.text,
                          degree: degreeController.text);
                      context
                          .read<ClassListProvider>()
                          .addStudent(id, newStudent);
                      Navigator.pop(context);
                    }
                  }),
                  child: const Text("Ok")),
              TextButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.red[200],
                    ),
                  ))
            ],
          );
        }));
  }
}

Widget emptyCard(BuildContext context) {
  return const SizedBox(
    height: 200,
    child: Card(
      child: Text('There are no students in this class'),
    ),
  );
}
