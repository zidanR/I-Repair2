import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController zz1;
  TextEditingController zz2;
  TextEditingController zz3;
  TextEditingController zz4;

  void editData() {
    var url = "http://10.0.2.2/IRepair2/flutter/editdataservice.php";

    http.post(url, body: {
      "id": widget.list[widget.index]['id_servis'],
      "zz1": zz1.text,
      "zz2": zz2.text,
      "zz3": zz3.text,
      "zz4": zz4.text,
    });
  }

  @override
  @override
  void initState() {
    zz1 =
        new TextEditingController(text: widget.list[widget.index]['nama_akun']);
    zz2 = new TextEditingController(
        text: widget.list[widget.index]['jenis_motor']);
    zz3 = new TextEditingController(text: widget.list[widget.index]['keluhan']);
    zz4 = new TextEditingController(text: widget.list[widget.index]['tanggal']);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Service'),
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
                hintText: "Nama",
                labelText: "Nama",
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          TextFormField(
            controller: zz2,
            decoration: InputDecoration(
                hintText: "Jenis Motor",
                labelText: "Jenis Motor",
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
                hintText: "Keluhan",
                labelText: "Keluhan",
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          TextFormField(
            controller: zz4,
            maxLines: 1,
            decoration: InputDecoration(
                hintText: "(TTTT-BB-HH)",
                labelText: "Tanggal Service (TTTT-BB-HH)",
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
                child: Text("Batal",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.black)),
              ),
              SizedBox(width: 20),
              RaisedButton(
                onPressed: () {
                  editData();
                  Navigator.pushReplacementNamed(context, 'home-page');
                  // Navigator.of(context).push(new MaterialPageRoute(
                  //     builder: (BuildContext context) => new HomePage()));
                },
                color: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Simpan",
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
              Text("Form Pemesanan Service",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Berikut data yang dibutuhkan ketika service",
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
