import 'package:flutter/material.dart';

class LupaPaswordPage extends StatefulWidget {
  LupaPaswordPage({Key key}) : super(key: key);

  @override
  _LupaPaswordPageState createState() => _LupaPaswordPageState();
}

class _LupaPaswordPageState extends State<LupaPaswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Image(image: AssetImage('Logo_I-Repair.jpeg')),
                ),
                SizedBox(height: 40),
                Text("Ubah Pasword",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  decoration:
                      InputDecoration(hintText: "Email", labelText: "Email"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Password Baru", labelText: "Password Baru"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Ulangi Pasword", labelText: "Ulangi Password"),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text("", style: TextStyle(fontSize: 15, color: Colors.black)),
              ButtonTheme(
                  child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login-page');
                },
                child: Text("Kembali",
                    style: TextStyle(fontSize: 15, color: Colors.blue)),
              )),
              SizedBox(width: 100),
              ButtonTheme(
                  child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login-page');
                },
                child: Text("Konfirmasi",
                    style: TextStyle(fontSize: 15, color: Colors.blue)),
              )),
            ],
          )
        ],
      ),
    ));
  }
}
