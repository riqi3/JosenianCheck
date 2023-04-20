import 'package:josenian_check/models/student.dart';
import 'package:uuid/uuid.dart';

class Event {
  String eventID;
  String eventName;
  List<Student> collaborators = [];
  List<Student> students = [];

  Event({required this.eventName}) : eventID = const Uuid().v4();

  String get id => eventID;
  String get name => eventName;
  List<Student> get list => students;
  
  set setID(String id)
  {
    eventID = id;
  }

  set setName(String name)
  {
    eventName = name;
  }

  void addCollaborator(Student student)
  {
    collaborators.add(student);
    addStudent(student);
  }

  void addStudent(Student student)
  {
    students.add(student);
  }

  void removeCollaborator(Student student)
  {
    int index = collaborators.indexWhere((e) => e.id == student.id);
    collaborators.removeAt(index);
    removeStudent(student);
  }

  void removeStudent(Student student)
  {
    int index = students.indexWhere((e) => student.id == e.id);
    students.removeAt(index);
  }
  
}

