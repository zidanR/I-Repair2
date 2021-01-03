import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DaftarServicePage extends StatefulWidget {
  DaftarServicePage({Key key}) : super(key: key);

  @override
  _DaftarServicePageState createState() => _DaftarServicePageState();
}

class _DaftarServicePageState extends State<DaftarServicePage> {
  DateTime _dateTime;
  TextEditingController zz1 = new TextEditingController();
  TextEditingController zz2 = new TextEditingController();
  TextEditingController zz3 = new TextEditingController();
  TextEditingController zz4 = new TextEditingController();
  TextEditingController controlleralamat = new TextEditingController();
  TextEditingController controllertelepon = new TextEditingController();

  void addData() {
    var url =
        "http://bengkelirepair.masuk.id/flutter/daftarservicepengguna.php";

    http.post(url, body: {
      "zz1": zz1.text,
      "zz2": zz2.text,
      "zz3": zz3.text,
      "zz4": zz4.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Head(),
          Form(),
          TextFormField(
            controller: zz1,
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
            controller: zz2,
            decoration: InputDecoration(
                hintText: "Motorcycle",
                labelText: "Motorcycle",
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          TextFormField(
            controller: zz3,
            maxLines: 4,
            decoration: InputDecoration(
                hintText: "Problems",
                labelText: "Problems",
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          Text(_dateTime == null
              ? '   Havent Choose Date!'
              : _dateTime.toString()),
          RaisedButton(
            child: Text('Choose date'),
            onPressed: () {
              showDatePicker(
                      context: context,
                      initialDate:
                          _dateTime == null ? DateTime.now() : _dateTime,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2025))
                  .then((date) {
                setState(() {
                  _dateTime = date;
                });
              });
            },
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          TextFormField(
            controller: zz4,
            maxLines: 1,
            decoration: InputDecoration(
                hintText: "(YYYY-MM-DD)",
                labelText: "Input Date",
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
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
                  Navigator.pushReplacementNamed(context, 'home-page');
                },
                child: Text("Cencel",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.black)),
              ),
              RaisedButton(
                onPressed: () {
                  addData();
                  Navigator.pushReplacementNamed(context, 'home-page');
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
                  Text("Enter Data Before Service",
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
