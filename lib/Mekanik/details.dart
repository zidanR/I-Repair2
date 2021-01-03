import 'package:flutter/material.dart';
import 'package:flutter_app/Mekanik/editdatas.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
          title: new Text("Detail Service Customer")),
      body: new Container(
        height: 500.0,
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
                new Padding(padding: new EdgeInsets.only(top: 20)),
                new Text(
                  "Motorcycle : ${widget.list[widget.index]['jenis_motor']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20)),
                new Text(
                  "Problems : ${widget.list[widget.index]['keluhan']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20)),
                new Text(
                  "Date : ${widget.list[widget.index]['tanggal']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                RatingBarIndicator(
                  rating: double.parse(
                      widget.list[widget.index]['Rating'].toString()),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                new Padding(padding: new EdgeInsets.only(top: 20)),
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
                      child: new Text("BACK"),
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
