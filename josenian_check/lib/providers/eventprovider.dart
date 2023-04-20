import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:josenian_check/models/event.dart';

import '../models/student.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  UnmodifiableListView<Event> get eventList => UnmodifiableListView(_events);

  void add(Event event) {
    _events.add(event);
    notifyListeners();
  }

  bool empty()
  {
    return _events.isEmpty;
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

  void addCollaborator(String id, Student student)
  {
    _events[getIndex(id)].addCollaborator(student);
    notifyListeners();
  }

  void addStudent(String id, Student student)
  {
    _events[getIndex(id)].addStudent(student);
    notifyListeners();
  }

  void removeCollaborator(String id, Student student)
  {
    _events[getIndex(id)].removeCollaborator(student);
    notifyListeners();    
  }

  void removeStudent(String id, Student student)
  {
    _events[getIndex(id)].removeStudent(student);
    notifyListeners();
  }

  void addList(String id, List<Student> students)
  {
    _events[getIndex(id)].setList(students);
    notifyListeners();
  }
}
