import 'package:flutter/material.dart';
import 'package:flutter_app/Mekanik/main_drawer.dart';

// import '../login_mekanik_page.dart';

class MekanikHomePage extends StatefulWidget {
  MekanikHomePage({this.usernames});
  final String usernames;

  @override
  _MekanikHomePageState createState() => _MekanikHomePageState();
}

class _MekanikHomePageState extends State<MekanikHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), backgroundColor: Colors.red),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Head(),
          Body(),
          Bottom()
        ],
      ),
    );
  }
}

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
                child: Image(image: AssetImage('Logo_I-Repair.jpeg')),
              ),
              SizedBox(height: 20),
              Text("Welcome Mekanik",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black)),
              SizedBox(height: 0),
              // Text("$usernames",
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 30,
              //         color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 300,
          child: Image(image: AssetImage('Jadwal_Service.png')),
        ),
      ],
    );
  }
}

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }
}
