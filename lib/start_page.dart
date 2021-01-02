import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(100),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 0,
                ),
                SizedBox(
                  height: 100,
                  child: Image(image: AssetImage('Logo_I-Repair.jpeg')),
                ),
                SizedBox(height: 200),
                ButtonTheme(
                    padding: EdgeInsets.all(8.0),
                    buttonColor: Colors.lightBlue,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'login-page');
                      },
                      child: Text("Masuk"),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
