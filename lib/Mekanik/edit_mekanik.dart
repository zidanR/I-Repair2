import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditMekanik extends StatefulWidget {
  final List list;
  final int index;
  EditMekanik({this.list, this.index});

  @override
  _EditMekanikState createState() => _EditMekanikState();
}

class _EditMekanikState extends State<EditMekanik> {
  TextEditingController zz6;
  TextEditingController zz67;

  void editData() {
    var url = "http://bengkelirepair.masuk.id/flutter/editmekanik.php";

    http.post(url, body: {
      "id": widget.list[widget.index]['no'],
      "txtkondisi": zz6.text,
      "txtkodepesan": zz67.text,
    });
  }

  @override
  @override
  void initState() {
    zz6 = new TextEditingController(text: widget.list[widget.index]['kondisi']);
    zz67 = new TextEditingController(
        text: widget.list[widget.index]['kode_pesanan']);

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Service'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Head(),
          Form(),
          // new Padding(
          //   padding: new EdgeInsets.only(top: 20),
          // ),
          new Text(
            "Mechanic Condition",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Text(
            "Ready / On Working / Offline",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 30),
          ),
          TextFormField(
            controller: zz6,
            decoration: InputDecoration(
                hintText: "Condition",
                labelText: "Condition, Input = Ready / On Working / Offline",
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          TextFormField(
            controller: zz67,
            decoration: InputDecoration(
                hintText: "Order Code",
                labelText: "Order Code",
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'mekanikhome-page');
                },
                child: Text("Cencel",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.black)),
              ),
              SizedBox(width: 20),
              RaisedButton(
                onPressed: () {
                  editData();
                  Navigator.pushReplacementNamed(context, 'mekanikhome-page');
                  // Navigator.of(context).push(new MaterialPageRoute(
                  //     builder: (BuildContext context) => new HomePage()));
                },
                color: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
                child: Image(image: AssetImage('Logo_I-Repair.jpeg')),
              ),
              SizedBox(height: 30),
              Text("Form Service Order",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("That is data from User",
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                ],
              ),
              // SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}

class Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
