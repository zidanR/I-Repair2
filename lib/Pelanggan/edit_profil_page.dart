import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_app/login_page.dart';

class EditProfilPage extends StatefulWidget {
  EditProfilPage({Key key}) : super(key: key);

  @override
  _EditProfilPageState createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  bool showPassword = false;
  TextEditingController m1;
  TextEditingController m2;
  TextEditingController m3;
  TextEditingController m4;
  TextEditingController m5;
  TextEditingController m6;
  String namaPengguna;
  String usernamePengguna;
  String passwordPengguna;
  String emailPengguna;
  String alamatPengguna;
  String telpPengguna;
  String idPengguna;

  void _takePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idPengguna = prefs.getString('idpengguna');
      m1 = new TextEditingController(text: prefs.getString('namaPengguna'));
      m2 = new TextEditingController(text: prefs.getString('username'));
      m3 = new TextEditingController(text: prefs.getString('passwords'));
      m4 = new TextEditingController(text: prefs.getString('emailPengguna'));
      m5 = new TextEditingController(text: prefs.getString('alamatPengguna'));
      m6 = new TextEditingController(text: prefs.getString('telpPengguna'));
    });
  }

  void editData() {
    var url = "http://bengkelirepair.masuk.id/flutter/editprofilpengguna.php";

    http.post(url, body: {
      "txtid": idPengguna,
      "txtnamapeng": m1.text,
      "txtusernamepeng": m2.text,
      "txtpasswords": m3.text,
      "txtemail": m4.text,
      "txtalamat": m5.text,
      "txttelp": m6.text
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
      appBar: AppBar(
        title: Text('Edit Profil'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(null),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'editprofil-page');
            },
          )
        ],
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
                controller: m3,
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20),
              ),
              TextFormField(
                controller: m4,
                decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
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
                      Navigator.pushReplacementNamed(context, 'home-page');
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      editData();
                      Navigator.pushReplacementNamed(context, 'home-page');
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
                          letterSpacing: 0.2,
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
