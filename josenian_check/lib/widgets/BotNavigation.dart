import 'package:flutter/material.dart';
import 'package:josenian_check/constants.dart';

class BotNavigation extends StatefulWidget {
  const BotNavigation({super.key});

  @override
  State<BotNavigation> createState() => _BotNavigationState();
}

class _BotNavigationState extends State<BotNavigation> {
  int _selectedIndex = 0;


  static const TextStyle optionStyle =
      TextStyle(fontSize: 60, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
        Text(
      'Index 1: DDDDDD',
      style: optionStyle,
    ),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
      ],
      currentIndex: _selectedIndex,
        selectedItemColor: brandColor3,
        onTap: _onItemTapped,
    );
    
  }
}
