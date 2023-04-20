import 'package:flutter/material.dart';
import 'package:josenian_check/constants.dart';
import 'package:josenian_check/models/events.dart';
import 'package:josenian_check/providers/eventprovider.dart';
import 'package:josenian_check/widgets/eventwidget.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<EventProvider>(
        builder: (context, value, child) {
          return EventWidget(events: value.eventList);
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<EventProvider>().add(Event(eventName: 'Test'));
      }),
    );
  }
}
