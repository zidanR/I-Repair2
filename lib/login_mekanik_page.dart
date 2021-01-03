import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

String usernames = '';

class LoginMekanikPage extends StatefulWidget {
  LoginMekanikPage({Key key}) : super(key: key);

  @override
  _LoginMekanikPageState createState() => _LoginMekanikPageState();
}

class _LoginMekanikPageState extends State<LoginMekanikPage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String msg = '';
  Future<List> _login() async {
    final response = await http
        .post("http://bengkelirepair.masuk.id/flutter/loginmekanik.php", body: {
      "usernames": user.text,
      "passwords": pass.text,
    });
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "User name or password Invalid";
      });
    } else {
      if (datauser[0]['level'] == '3') {
        Navigator.pushReplacementNamed(context, 'mekanikhome-page');
      } else if (null) {
        Navigator.pushReplacementNamed(context, 'homes-page');
      }

      setState(() {
        usernames = datauser[0]['usernames'];
      });
    }

    return datauser;
  }

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
                  height: 80,
                  child: Image(image: AssetImage('Logo_I-Repair.jpeg')),
                ),
                SizedBox(height: 50),
                Text("LOGIN MECHANIC",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black)),
                SizedBox(height: 10),
                new TextField(
                  controller: user,
                  decoration: InputDecoration(
                      hintText: "User Name",
                      labelText: "User name",
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                new TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text("Remember Me",
                    //     style: TextStyle(fontSize: 15, color: Colors.black)),
                    SizedBox(width: 00),
                    // ButtonTheme(
                    //   padding: EdgeInsets.all(20),
                    //   child: TextButton(
                    //     onPressed: () {
                    //       Navigator.pushReplacementNamed(
                    //           context, 'lupapasword-page');
                    //     },
                    //     child: Text("Lupa Pasword?"),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 70),
                ButtonTheme(
                  child: RaisedButton(
                    child: Text("Login"),
                    color: Colors.red,
                    onPressed: () {
                      _login();
                    },
                  ),
                ),
                Text(
                  msg,
                  style: TextStyle(fontSize: 20.0, color: Colors.red),
                )
              ],
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("User Login",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              ButtonTheme(
                  child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login-page');
                },
                child: Text("Here",
                    style: TextStyle(fontSize: 15, color: Colors.blue)),
              )),
            ],
          )
        ],
      ),
    ));
  }
}
