import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:josenian_check/providers/classlistprovider.dart';
import 'package:josenian_check/providers/eventprovider.dart';
import 'package:provider/provider.dart';

import '../models/event.dart';

class EventInfo extends StatelessWidget {
  Event event;
  EventInfo({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(event.name)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: event.students.map((e) {
                return Text('${e.id}. ${e.last}, ${e.first} ${e.middle}');
              }).toList(),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => addList(context, event)));
              },
              child: const Text('Add Class')),
        ],
      ),
    );
  }

  Widget addList(BuildContext context, Event event) {
    var classes = context.read<ClassListProvider>().classes;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Select class to add'),
      ),
      body: ListView(
        children: classes.map((e) {
          return GestureDetector(
            onTap: () {
              var selClass = e.list;
              context.read<EventProvider>().addList(event.eventID, selClass);
              Navigator.pop(context);
            },
            child: Text(e.name),
          );
        }).toList(),
      ),
    );
  }
}
