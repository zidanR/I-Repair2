import 'package:flutter/material.dart';
import 'package:flutter_app/Mekanik/editdatas.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  List list;
  int index;
  Details({this.index, this.list});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.red,
          title: new Text("Detail Service Pelanggan")),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['nama_akun'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  "Jenis Motor : ${widget.list[widget.index]['jenis_motor']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Keluhan : ${widget.list[widget.index]['keluhan']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Tanggal : ${widget.list[widget.index]['tanggal']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: () => Navigator.of(context)
                          .pushReplacement(new MaterialPageRoute(
                        builder: (BuildContext context) => new EditDatas(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    new RaisedButton(
                      child: new Text("Kembali"),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, 'mekanikservice-page');
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
