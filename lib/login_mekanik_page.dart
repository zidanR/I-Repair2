import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String usernamess = '';

class LoginMekanikPage extends StatefulWidget {
  LoginMekanikPage({Key key}) : super(key: key);

  @override
  _LoginMekanikPageState createState() => _LoginMekanikPageState();
}

class _LoginMekanikPageState extends State<LoginMekanikPage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String msg = '';
  String idmekanik;
  String usernames;
  String passwords;
  String level;
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
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('iduser', datauser[0]['id_user']);
      prefs.setString('usernames', datauser[0]['usernames']);
      prefs.setString('passwords', datauser[0]['passwords']);
      prefs.setString('level', datauser[0]['level']);
      if (datauser[0]['level'] == '3') {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        idmekanik = sharedPreferences.getString('iduser');
        usernames = sharedPreferences.getString('usernames');
        passwords = sharedPreferences.getString('passwords');
        level = sharedPreferences.getString('level');
        final result = (await FirebaseFirestore.instance
                .collection('users')
                .where('id', isEqualTo: idmekanik)
                .get())
            .docs;
        if (result.length == 0) {
          ///new user
          FirebaseFirestore.instance
              .collection('users')
              .doc(idmekanik.toString())
              .set({
            "id": idmekanik,
            "level": level,
            "username": usernames,
            "password": passwords,
          });
        } else {
          ///Old user
          sharedPreferences.setString("id", result[0]["id"]);
          sharedPreferences.setString("username", result[0]["username"]);
        }
        Navigator.pushReplacementNamed(context, 'mekanikhome-page');
      } else if (null) {
        Navigator.pushReplacementNamed(context, 'homes-page');
      }

      setState(() {
        usernamess = datauser[0]['usernames'];
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
