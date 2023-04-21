import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:josenian_check/constants.dart';
import 'package:josenian_check/models/event.dart';
import 'package:josenian_check/providers/eventprovider.dart';
import 'package:provider/provider.dart';

import 'eventinfo.dart';

class EventWidget extends StatelessWidget {
  final UnmodifiableListView<Event> events;
  const EventWidget({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          context.read<EventProvider>().empty()
              ? emptyCard(context)
              : SizedBox(
                  child: Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: events.map((e) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Consumer<EventProvider>(
                                      builder: (context, value, child) {
                                        return EventInfo(
                                          event: e,
                                        );
                                      },
                                    )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  e.eventName,
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ),
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
        heroTag: 'AddEvent',
        backgroundColor: shadeBC1,
        onPressed: () {
          addEvent(context);
        },
        label: Text('Add Event'),
      ),
    );
  }

  Widget emptyCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        child: Text(
          'There are no events :^(',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: Colors.black.withOpacity(
              .5,
            ),
          ),
        ),
      ),
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
              color: shadeBC1,
            ),
          ),
          content: TextField(
            controller: eventController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name of Event',
            ),
          ),
          actions: [
            TextButton(
              onPressed: (() {
                if (eventController.text.isNotEmpty) {
                  context.read<EventProvider>().add(
                        Event(eventName: eventController.text),
                      );
                  Navigator.pop(context);
                }
              }),
              child: const Text(
                "Ok",
                style: TextStyle(
                  color: shadeBC1,
                ),
              ),
            ),
            TextButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: brandColor3,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
