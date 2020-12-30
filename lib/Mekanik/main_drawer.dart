import 'package:flutter/material.dart';
import 'package:flutter_app/login_mekanik_page.dart';

final Color backgroundColor = Colors.red;

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          // height: 200,
          // width: MediaQuery.of(context).size.width * 0.8,
          // decoration: BoxDecoration(color: backgroundColor),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 50, backgroundImage: AssetImage('Person.jpg')),
                SizedBox(height: 10),
                Text('$usernames',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    )),
                SizedBox(height: 10),
                Text('Mekanik',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    )),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'mekanikprofil-page');
            },
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
            title: Text('Profil')),
        ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'mekanikhome-page');
            },
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text('Home')),
        ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'mekanikservice-page');
            },
            leading: Icon(
              Icons.pan_tool_sharp,
              color: Colors.black,
            ),
            title: Text('Service')),
        ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'mekanikchat-page');
            },
            leading: Icon(
              Icons.chat_sharp,
              color: Colors.black,
            ),
            title: Text('Chat')),
        ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'mekaniksparepart-page');
            },
            leading: Icon(
              Icons.handyman_sharp,
              color: Colors.black,
            ),
            title: Text('Sparepart')),
        ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'loginmekanik-page');
            },
            leading: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: Text('Keluar')),
      ],
    );
  }
}
