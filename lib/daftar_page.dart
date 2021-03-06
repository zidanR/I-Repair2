import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DaftarPage extends StatefulWidget {
  DaftarPage({Key key}) : super(key: key);

  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  TextEditingController controllernama = new TextEditingController();
  TextEditingController controllerusername = new TextEditingController();
  TextEditingController controlleremail = new TextEditingController();
  TextEditingController controllerpassword = new TextEditingController();
  TextEditingController controlleralamat = new TextEditingController();
  TextEditingController controllertelepon = new TextEditingController();

  void addData() {
    var url = "http://bengkelirepair.masuk.id/flutter/daftarpengguna.php";

    http.post(url, body: {
      "txtnama": controllernama.text,
      "txtpengguna": controllerusername.text,
      "txtpass": controllerpassword.text,
      "txtemail": controlleremail.text,
      "txtalamat": controlleralamat.text,
      "txtnomer": controllertelepon.text
    });
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
                SizedBox(height: 40),
                Text("Register Account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: controllernama,
                  decoration: InputDecoration(
                      hintText: "Full Name", labelText: "Full Name"),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                TextFormField(
                  controller: controllerusername,
                  decoration: InputDecoration(
                      hintText: "User Name", labelText: "User Name"),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                TextFormField(
                  controller: controlleremail,
                  decoration:
                      InputDecoration(hintText: "Email", labelText: "Email"),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                TextFormField(
                  controller: controllerpassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password", labelText: "Password"),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Repeat Password",
                      labelText: "Repeat Password"),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                TextFormField(
                  controller: controlleralamat,
                  maxLines: 3,
                  decoration:
                      InputDecoration(hintText: "Addres", labelText: "Addres"),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20),
                ),
                TextFormField(
                  controller: controllertelepon,
                  decoration: InputDecoration(
                      hintText: "Phone Number", labelText: "Phone Number"),
                ),
                SizedBox(height: 30),
                ButtonTheme(
                    child: TextButton(
                  onPressed: () {
                    addData();
                    Navigator.pushReplacementNamed(context, 'login-page');
                  },
                  child: Text("Register"),
                )),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Have Account?  Login",
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
