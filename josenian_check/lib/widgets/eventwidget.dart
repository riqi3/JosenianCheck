import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:josenian_check/models/event.dart';
import 'package:josenian_check/providers/eventprovider.dart';
import 'package:provider/provider.dart';

class EventWidget extends StatelessWidget {
  final UnmodifiableListView<Event> events;
  const EventWidget({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.read<EventProvider>().empty()
            ? emptyCard(context)
            : SizedBox(
                height: 200,
                child: Expanded(
                  child: ListView(
                    children: events.map((e) {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          child: Text(
                            e.eventName,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
        ElevatedButton(onPressed: () {
          addEvent(context);
        }, child: const Text('Add Event'))
      ],
    );
  }

  Future<void> addEvent(BuildContext context) async {
    TextEditingController eventController = TextEditingController();
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: const Text(
              "Add Event",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            content: TextField(
              controller: eventController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input here',
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (() {
                    if (eventController.text.isNotEmpty) {
                      context
                          .read<EventProvider>()
                          .add(Event(eventName: eventController.text));
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
      child: Text('There are no events'),
    ),
  );
}
