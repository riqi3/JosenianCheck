import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:josenian_check/models/classlist.dart';
import 'package:josenian_check/providers/classlistprovider.dart';
import 'package:josenian_check/widgets/rosterwidget.dart';
import 'package:provider/provider.dart';

class ClassListWidget extends StatelessWidget {
  final UnmodifiableListView<ClassList> classList;
  const ClassListWidget({super.key, required this.classList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          context.read<ClassListProvider>().empty()
              ? emptyCard(context)
              : SizedBox(
                  height: 200,
                  child: Expanded(
                    child: ListView(
                      children: classList.map((e) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Consumer<ClassListProvider>(
                                      builder: (context, value, child) {
                                        String id = value.getClassID(e);
                                        return RosterWidget(
                                            id: id,
                                            className: value.getName(id),
                                            students: value.getStudents(id));
                                      },
                                    )));
                          },
                          child: Card(
                            child: Text(
                              e.name,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'AddClass',
        onPressed: () {
          addClass(context);
        },
        label: Text('Add Class'),
      ),
    );
  }
}

Widget emptyCard(BuildContext context) {
  return const SizedBox(
    height: 200,
    child: Card(
      child: Text('There are no classes'),
    ),
  );
}

Future<void> addClass(BuildContext context) async {
  TextEditingController classNameController = TextEditingController();
  return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: const Text(
            "Add Class",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          content: TextField(
            controller: classNameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Input here',
            ),
          ),
          actions: [
            TextButton(
                onPressed: (() {
                  if (classNameController.text.isNotEmpty) {
                    context
                        .read<ClassListProvider>()
                        .add(ClassList(className: classNameController.text));
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
