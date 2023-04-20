import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:josenian_check/models/events.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  UnmodifiableListView<Event> get eventList => UnmodifiableListView(_events);

  void add(Event event) {
    _events.add(event);
    notifyListeners();
  }

  int getIndex(String id) {
    int index = _events.indexWhere((e) => e.id == id);

    return index;
  }

  void edit(String id, String name) {
    _events[getIndex(id)].setName = name;
    notifyListeners();
  }

  void remove(String id) {
    _events.removeAt(getIndex(id));
    notifyListeners();
  }
}
