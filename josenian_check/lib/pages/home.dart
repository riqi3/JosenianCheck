import 'package:flutter/material.dart';
import 'package:josenian_check/constants.dart';
import 'package:josenian_check/widgets/BotNavigation.dart';
import 'package:josenian_check/providers/eventprovider.dart';
import 'package:josenian_check/widgets/eventwidget.dart';
import 'package:provider/provider.dart';

import '../models/event.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 60, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: DDDDDD',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Homepage',
        ),
      ),
      body: Consumer<EventProvider>(
        builder: (context, value, child) {
          return EventWidget(events: value.eventList);
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<EventProvider>().add(Event(eventName: 'Test'));
      }),
      bottomNavigationBar: BotNavigation(),
    );
  }
}
