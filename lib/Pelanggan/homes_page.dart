import 'package:flutter/material.dart';
import 'package:flutter_app/login_page.dart';

class HomesPage extends StatefulWidget {
  HomesPage({Key key}) : super(key: key);

  @override
  _HomesPageState createState() => _HomesPageState();
}

class _HomesPageState extends State<HomesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(null),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'login-page');
            },
          )
        ],
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
              Text("Selamat Datang $username",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black)),
              SizedBox(height: 0),
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
        // Container(
        //   width: double.infinity,
        //   height: 100.0,
        //   padding: const EdgeInsets.only(left: 100.0),
        //   child: ListView(
        //     scrollDirection: Axis.horizontal,
        //     children: <Widget>[
        //       Container(
        //         decoration: BoxDecoration(
        //             gradient: LinearGradient(
        //                 begin: Alignment.topCenter,
        //                 end: Alignment.bottomCenter,
        //                 colors: [
        //                   Colors.white,
        //                   Colors.white,
        //                 ]),
        //             borderRadius: BorderRadius.circular(8.0),
        //             image: DecorationImage(
        //                 image: AssetImage('Jadwal_Service.png'))),
        //         margin: EdgeInsets.only(left: 10.0),
        //         height: 100.0,
        //         width: 200.0,
        //         child: null,
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            'Sparepart',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
          ),
          trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            onPressed: () {
              Navigator.pushNamed(context, 'sparepart-page');
            },
          ),
        ),
      ],
    );
  }
}
