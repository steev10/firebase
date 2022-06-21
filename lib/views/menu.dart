import 'package:flutter/material.dart';
import 'dart:math';

import 'list_views.dart';
import 'new.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuS createState() => _MenuS();
}

class _MenuS extends State<Menu> {
  int _selectedIndex = 0;

  static const TextStyle optionsStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('service', style: optionsStyle),
    CallFirebase(),
    Text('people', style: optionsStyle),
  ];
  Color _tema2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  void _onTimeTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tema2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.black, title: const Text('movies')),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Service'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'movie'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'people'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onTimeTapped,
          backgroundColor: _tema2),
    );
  }
}
