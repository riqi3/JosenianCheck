import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:josenian_check/models/classlist.dart';

import '../models/student.dart';

class ClassListProvider extends ChangeNotifier
{
  final List<ClassList> _classes = [];

  UnmodifiableListView<ClassList> get classes => UnmodifiableListView(_classes);

  bool empty()
  {
    return _classes.isEmpty;
  }

  int getIndex(String id) {
    int index = _classes.indexWhere((e) => e.id == id);

    return index;
  }

  void add(ClassList cls)
  {
    _classes.add(cls);
    notifyListeners();
  }
  
  void remove(String id)
  {
    _classes.removeAt(getIndex(id));
    notifyListeners();
  }

  void addStudent(String id, Student student)
  {
    _classes[getIndex(id)].addStudent(student);
    notifyListeners();
  }

  void removeStudent(String id, Student student)
  {
    _classes[getIndex(id)].removeStudent(student);
    notifyListeners();
  }

  String getClassID(ClassList list)
  {
    int index = _classes.indexWhere((e) => e == list);
    return _classes[index].id;
  }

  String getName(String id)
  {
    return _classes[getIndex(id)].name;
  }

  List<Student> getStudents(String id)
  {
    return _classes[getIndex(id)].list;
  }

  bool checkEmpty(String id)
  {
    return _classes[getIndex(id)].list.isEmpty;
  }
}