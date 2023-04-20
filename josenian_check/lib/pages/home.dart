import 'package:flutter/material.dart';
import 'package:josenian_check/constants.dart';
import 'package:josenian_check/providers/classlistprovider.dart';
import 'package:josenian_check/providers/eventprovider.dart';
import 'package:josenian_check/widgets/classlistwidget.dart';
import 'package:josenian_check/widgets/eventwidget.dart';
import 'package:provider/provider.dart';

import '../models/event.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    Home(),
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

  String title = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
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
      
      // classListConsumer(context),
      // classListConsumer(context)
      //       body: Consumer<EventProvider>(
      //   builder: (context, value, child) {
      //     return EventWidget(events: value.eventList);
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   context.read<EventProvider>().add(Event(eventName: 'Test'));
      // }),
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
