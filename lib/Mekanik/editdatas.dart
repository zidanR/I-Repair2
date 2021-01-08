import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditDatas extends StatefulWidget {
  final List list;
  final int index;

  EditDatas({this.list, this.index});

  @override
  _EditDatasState createState() => _EditDatasState();
}

class _EditDatasState extends State<EditDatas> {
  // TextEditingController zz1;
  // TextEditingController zz2;
  // TextEditingController zz3;
  // TextEditingController zz4;
  TextEditingController zz6;
  TextEditingController zz7;
  TextEditingController zz8;

  void editData() {
    var url = "http://bengkelirepair.masuk.id/flutter/editdatasservice.php";

    http.post(url, body: {
      "id": widget.list[widget.index]['id_servis'],
      // "zz1": zz1.text,
      // "zz2": zz2.text,
      // "zz3": zz3.text,
      // "zz4": zz4.text,
      "txtsparepart": zz6.text,
      "status_mekanik": zz7.text,
      "total_biaya": zz8.text,
    });
  }

  @override
  @override
  void initState() {
    // zz1 =
    //     new TextEditingController(text: widget.list[widget.index]['nama_akun']);
    // zz2 = new TextEditingController(
    //     text: widget.list[widget.index]['jenis_motor']);
    // zz3 = new TextEditingController(text: widget.list[widget.index]['keluhan']);
    zz6 = new TextEditingController(
        text: widget.list[widget.index]['pergantian_sparepart']);
    // zz4 = new TextEditingController(text: widget.list[widget.index]['tanggal']);
    zz7 = new TextEditingController(
        text: widget.list[widget.index]['status_mekanik']);
    zz8 = new TextEditingController(
        text: widget.list[widget.index]['total_biaya']);
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
          // TextFormField(
          //   controller: zz1,
          //   decoration: InputDecoration(
          //       hintText: "Name",
          //       labelText: "Name",
          //       border: new OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20))),
          // ),
          // new Padding(
          //   padding: new EdgeInsets.only(top: 20),
          // ),
          // TextFormField(
          //   controller: zz2,
          //   decoration: InputDecoration(
          //       hintText: "Motorcycle",
          //       labelText: "Motorcycle",
          //       border: new OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20))),
          // ),
          // new Padding(
          //   padding: new EdgeInsets.only(top: 20),
          // ),
          // TextFormField(
          //   controller: zz3,
          //   maxLines: 4,
          //   decoration: InputDecoration(
          //       hintText: "Problems",
          //       labelText: "Problems",
          //       border: new OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20))),
          // ),
          // new Padding(
          //   padding: new EdgeInsets.only(top: 20),
          // ),
          // TextFormField(
          //   controller: zz4,
          //   maxLines: 1,
          //   decoration: InputDecoration(
          //       hintText: "(YYYY-MM-DD)",
          //       labelText: "Service Date (YYYY-MM-DD)",
          //       border: new OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20))),
          // ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          TextFormField(
            controller: zz6,
            decoration: InputDecoration(
                hintText: "Sparepart",
                labelText: "Sparepart",
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          TextFormField(
            controller: zz7,
            decoration: InputDecoration(
                hintText: "Status Service",
                labelText: "Status Service",
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          TextFormField(
            controller: zz8,
            decoration: InputDecoration(
                hintText: "Cost",
                labelText: "Cost",
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
                  Navigator.pushReplacementNamed(
                      context, 'mekanikservice-page');
                },
                child: Text("Cencel",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.black)),
              ),
              SizedBox(width: 20),
              RaisedButton(
                onPressed: () {
                  editData();
                  Navigator.pushReplacementNamed(
                      context, 'mekanikservice-page');
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
