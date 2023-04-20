import 'package:uuid/uuid.dart';

class Event {
  String eventID;
  String eventName;

  Event({required this.eventName}) : eventID = const Uuid().v4();

  String get id => eventID;
  String get name => eventName;
  
  set setID(String id)
  {
    eventID = id;
  }

  set setName(String name)
  {
    eventName = name;
  }
}
