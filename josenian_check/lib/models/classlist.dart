import 'package:josenian_check/models/student.dart';
import 'package:uuid/uuid.dart';

class ClassList {
  String classID;
  String className;
  List<Student> students = [];

  ClassList({required this.className}) : classID = const Uuid().v4();

  List<Student> get list => students;
  String get id => classID;
  String get name => className;

  set setName(String name) {
    className = name;
  }

  void addStudent(Student student) {
    students.add(student);
  }

  void removeStudent(Student student) {
    int index = students.indexWhere((e) => e.id == student.id);
    students.removeAt(index);
  }
}
