import 'package:flutter/material.dart';
import 'package:flutter_app/Pelanggan/chat_page.dart';
import 'package:flutter_app/Pelanggan/homes_page.dart';
import 'package:flutter_app/Pelanggan/profil_page.dart';
import 'package:flutter_app/Pelanggan/service_page.dart';

class HomePage extends StatefulWidget {
  HomePage({this.username});
  final String username;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomesPage(),
    ServicePage(),
    ChatPage(),
    ProfilPage()
  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        //backgroundColor: Colors.orange,
        iconSize: 20,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: Text('Home'),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              // ignore: deprecated_member_use
              title: Text('Service'),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              // ignore: deprecated_member_use
              title: Text('Chat'),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              // ignore: deprecated_member_use
              title: Text('Profil'),
              backgroundColor: Colors.red),
        ],
      ),
    );
  }
}
