import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

String username = '';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernme = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String masg = '';
  Future<List> _logins() async {
    final response = await http
        .post("http://10.0.2.2/IRepair2/flutter/loginpengguna.php", body: {
      "username": usernme.text,
      "password": password.text,
    });
    var datausers = json.decode(response.body);

    if (datausers.length == 0) {
      setState(() {
        masg = "User name atau password salah";
      });
    } else {
      if (datausers[0]['level'] == '0') {
        Navigator.pushReplacementNamed(context, 'home-page');
      } else if (null) {
        Navigator.pushReplacementNamed(context, 'homes-page');
      }

      setState(() {
        username = datausers[0]['nama_pengguna'];
      });
    }

    return datausers;
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
                  height: 100,
                  child: Image(image: AssetImage('Logo_I-Repair.jpeg')),
                ),
                SizedBox(height: 50),
                Text("LOGIN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black)),
                SizedBox(height: 10),
                new TextField(
                  controller: usernme,
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
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(height: 170),
                new RaisedButton(
                  child: Text("Login"),
                  color: Colors.orange,
                  onPressed: () {
                    _logins();
                  },
                ),
                Text(
                  masg,
                  style: TextStyle(fontSize: 20.0, color: Colors.red),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Belum punya akun?",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              ButtonTheme(
                  child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'daftar-page');
                },
                child: Text("Daftar",
                    style: TextStyle(fontSize: 15, color: Colors.blue)),
              )),
              Text("|    Mekanik Login",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              ButtonTheme(
                  child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'loginmekanik-page');
                },
                child: Text("Disini",
                    style: TextStyle(fontSize: 15, color: Colors.blue)),
              )),
            ],
          )
        ],
      ),
    ));
  }
}