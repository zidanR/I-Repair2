import 'package:flutter/material.dart';
import 'package:flutter_app/Mekanik/edit_mekanik.dart';
// import 'package:flutter_app/Mekanik/mekanik_home_page.dart';

class DetailMekanik extends StatefulWidget {
  List list;
  int index;
  DetailMekanik({this.index, this.list});

  @override
  _DetailMekanikState createState() => _DetailMekanikState();
}

class _DetailMekanikState extends State<DetailMekanik> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          new AppBar(backgroundColor: Colors.red, title: new Text("Mechanic")),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 20)),
          new Text(
            "Number : ${widget.list[widget.index]['no']}",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 30.0),
          ),
          new Text(
            widget.list[widget.index]['nama_mekanik'],
            style: new TextStyle(fontSize: 20.0),
          ),
          new Padding(padding: new EdgeInsets.only(top: 20)),
          new Text(
            "Mechanic Condition",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Text(
            "Ready / On Working / Offline",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(padding: new EdgeInsets.only(top: 20)),
          new Text(
            "Mechanic Condition : ${widget.list[widget.index]['kondisi']}",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(padding: new EdgeInsets.only(top: 20)),
          new Text(
            "Order Code : ${widget.list[widget.index]['kode_pesanan']}",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(padding: new EdgeInsets.only(top: 20)),
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new RaisedButton(
                child: new Text("EDIT"),
                color: Colors.green,
                onPressed: () =>
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => new EditMekanik(
                    list: widget.list,
                    index: widget.index,
                  ),
                )),
              ),
              // new RaisedButton(
              //   child: new Text("DELETE"),
              //   color: Colors.red,
              //   onPressed: () => confirm(),
              // ),
              new RaisedButton(
                child: new Text("BACK"),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'mekanikhome-page');
                },
              ),
            ],
          )
        ],
      ),
    );
    //     ),
    //   ),
    // );
  }
}
