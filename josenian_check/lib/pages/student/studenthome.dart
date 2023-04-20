import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:flutter/material.dart';
import 'package:josenian_check/constants.dart';
import 'package:josenian_check/providers/classlistprovider.dart';
import 'package:josenian_check/providers/eventprovider.dart';
import 'package:josenian_check/widgets/classlistwidget.dart';
import 'package:josenian_check/widgets/eventwidget.dart';
import 'package:provider/provider.dart';

import '../profile.dart';


class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> with SingleTickerProviderStateMixin {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    StudentHome(),
    UserProfile(),
  ];

  TabController? _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  String title = "StudentHome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: shadeBC1,
        title: Text(
          'Homepage',
        ),
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: [
            Tab(
              child: Text('Events'),
            ),
            Tab(
              child: Text('Classes'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          eventListConsumer(context),
          classListConsumer(context),
        ],
      ),
    );
  }
}

Widget classListConsumer(BuildContext context) {
  return Consumer<ClassListProvider>(
    builder: (context, value, child) {
      return ClassListWidget(classList: value.classes);
    },
  );
}

Widget eventListConsumer(BuildContext context) {
  return Consumer<EventProvider>(
    builder: (context, value, child) {
      return EventWidget(events: value.eventList);
    },
  );
}
