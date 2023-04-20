import 'package:flutter/material.dart';
import 'package:josenian_check/constants.dart';
import 'package:josenian_check/providers/classlistprovider.dart';
import 'package:josenian_check/widgets/BotNavigation.dart';
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

class _HomeState extends State<Home> {

  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    Home(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Homepage',
        ),
      ),
      body: classListConsumer(context),
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

Widget classListConsumer(BuildContext context)
{
  return Consumer<ClassListProvider>(
    builder: (context, value, child) {
      return ClassListWidget(classList: value.classes);
    },
  );
}