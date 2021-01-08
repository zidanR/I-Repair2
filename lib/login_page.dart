import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String usernamesss = '';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernme = new TextEditingController();
  TextEditingController paword = new TextEditingController();
  String masg = '';
  String idpengguna;
  String username;
  String passwords;
  String level;
  Future<List> _logins() async {
    final response = await http.post(
        "http://bengkelirepair.masuk.id/flutter/loginpengguna.php",
        body: {
          "username": usernme.text,
          "password": paword.text,
        });
    var datausers = json.decode(response.body);

    if (datausers.length == 0) {
      setState(() {
        masg = "User name or password wrong";
      });
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('idpengguna', datausers[0]['id_pengguna']);
      prefs.setString('username', datausers[0]['username_pengguna']);
      prefs.setString('passwords', datausers[0]['password']);
      prefs.setString('level', datausers[0]['level']);

      if (datausers[0]['level'] == '0') {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        idpengguna = sharedPreferences.getString('idpengguna');
        username = sharedPreferences.getString('username');
        passwords = sharedPreferences.getString('password');
        level = sharedPreferences.getString('level');
        final result = (await FirebaseFirestore.instance
                .collection('users')
                .where('id', isEqualTo: idpengguna)
                .get())
            .docs;

        if (result.length == 0) {
          ///new user
          FirebaseFirestore.instance
              .collection('users')
              .doc(idpengguna.toString())
              .set({
            "id": idpengguna,
            "level": level,
            "username": username,
            "password": passwords,
          });
        } else {
          ///Old user
          sharedPreferences.setString("id", result[0]["id"]);
          sharedPreferences.setString("username", result[0]["username"]);
        }
        Navigator.pushReplacementNamed(context, 'home-page');
      } else if (null) {
        Navigator.pushReplacementNamed(context, 'homes-page');
      }

      // Data user firebase
      setState(() {
        usernamesss = datausers[0]['username_pengguna'];
      });
    }

    return datausers;
  }

  @override
  void initState() {
    super.initState();
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
                  height: 90,
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
                  controller: paword,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(height: 140),
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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Dont' Have Account?",
                  style: TextStyle(fontSize: 13, color: Colors.black)),
              ButtonTheme(
                  child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'daftar-page');
                },
                child: Text("Register",
                    style: TextStyle(fontSize: 13, color: Colors.blue)),
              )),
              Text("Mekanik Login",
                  style: TextStyle(fontSize: 13, color: Colors.black)),
              ButtonTheme(
                  child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'loginmekanik-page');
                },
                child: Text("Here",
                    style: TextStyle(fontSize: 13, color: Colors.blue)),
              )),
            ],
          )
        ],
      ),
    ));
  }
}
