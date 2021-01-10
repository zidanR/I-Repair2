import 'package:flutter/material.dart';
import 'package:flutter_app/Mekanik/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_app/login_mekanik_page.dart';

class MekanikProfilPage extends StatefulWidget {
  MekanikProfilPage({Key key}) : super(key: key);

  @override
  _MekanikProfilPageState createState() => _MekanikProfilPageState();
}

class _MekanikProfilPageState extends State<MekanikProfilPage> {
  bool showPassword = false;
  TextEditingController m1;
  TextEditingController m2;
  TextEditingController m3;
  // TextEditingController m4;
  TextEditingController m5;
  TextEditingController m6;

  String namaMekanik;
  String usernameMekanik;
  String passwordMekanik;
  // String emailMekanik;
  String alamatMaekanik;
  String telpMekanik;
  String idMekanik;

  void _takePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idMekanik = prefs.getString('iduser');
      m1 = new TextEditingController(text: prefs.getString('namaMekanik'));
      m2 = new TextEditingController(text: prefs.getString('usernameMekanik'));
      m3 = new TextEditingController(text: prefs.getString('passwords'));
      m5 = new TextEditingController(text: prefs.getString('alamatMekanik'));
      m6 = new TextEditingController(text: prefs.getString('telpMekanik'));
    });
  }

  void editData() {
    var url = "http://bengkelirepair.masuk.id/flutter/editprofilmekanik.php";

    http.post(url, body: {
      "txtid": idMekanik,
      "txtnamaakun": m1.text,
      "txtusernames": m2.text,
      "txtpasswords": m3.text,
      // "txtemail": m4.text,
      "txtalamat": m5.text,
      "txttelepon": m6.text
    });
  }

  @override
  @override
  void initState() {
    super.initState();
    _takePrefs();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil"), backgroundColor: Colors.red),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('Person.jpg'))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              TextFormField(
                controller: m1,
                decoration: InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20),
              ),
              TextFormField(
                controller: m2,
                decoration: InputDecoration(
                    hintText: "User Name",
                    labelText: "User Name",
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20),
              ),
              TextFormField(
                controller: m5,
                decoration: InputDecoration(
                    hintText: "Addres",
                    labelText: "Addres",
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20),
              ),
              TextFormField(
                controller: m6,
                decoration: InputDecoration(
                    hintText: "Phone Number",
                    labelText: "Phone Number",
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20),
              ),
              TextFormField(
                controller: m3,
                decoration: InputDecoration(
                    hintText: "Enter New Password",
                    labelText: "Enter New Password",
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, 'mekanikhome-page');
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      editData();
                      Navigator.pushReplacementNamed(
                          context, 'mekanikhome-page');
                    },
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
