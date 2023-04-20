import 'package:josenian_check/models/student.dart';
import 'package:uuid/uuid.dart';

class ClassList {
  String classID;
  List<Student> students = [];
  
  ClassList() : classID = const Uuid().v4();
}