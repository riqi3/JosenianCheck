import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:josenian_check/models/events.dart';

class EventWidget extends StatelessWidget {
  final UnmodifiableListView<Event> events;
  const EventWidget({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: events.map((e) {
        return Text(
          e.eventName,
        );
      }).toList(),
    );
  }
}