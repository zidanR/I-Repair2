import 'package:flutter/material.dart';
import 'package:flutter_app/home_page.dart';
// import 'package:flutter_app/home_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'editdata.dart';
// import 'package:flutter_app/Pelanggan/service_page.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://bengkelirepair.masuk.id/flutter/hapusdataservice.php";
    http.post(url, body: {'id': widget.list[widget.index]['kode_pesanan']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Are you sure wanna delete '${widget.list[widget.index]['nama_akun']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "DELETE!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
                (route) => false);
            // Navigator.of(context).pushReplacement(new MaterialPageRoute(
            //   builder: (BuildContext context) => new HomePage(),
            // ));
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: new RaisedButton(
            padding: const EdgeInsets.all(10),
            child:
                new Text("CANCEL", style: new TextStyle(color: Colors.black)),
            color: Colors.green,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.orange, title: new Text("Detail Service")),
      body: ListView(
        // height: 1500.0,
        padding: const EdgeInsets.all(20.0),
        // child: new Card(
        //   child: new Center(
        //     child: new Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 10.0),
          ),
          new Text(
            widget.list[widget.index]['nama_akun'],
            style: new TextStyle(fontSize: 20.0),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          new Text(
            "Vehicle : ${widget.list[widget.index]['jenis_motor']}",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          new Text(
            "Problems : ${widget.list[widget.index]['keluhan']}",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          new Text(
            "Sparepart Changes : ${widget.list[widget.index]['pergantian_sparepart']}",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          new Text(
            "Date : ${widget.list[widget.index]['tanggal']}",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          new Text(
            "Service at : ${widget.list[widget.index]['jam']}",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          new Text(
            "Mechanic : ${widget.list[widget.index]['nama_mekanik']}",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          new Text(
            "Vehicle Status : ${widget.list[widget.index]['status_mekanik']}",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          new Text(
            "Cost : Rp. ${widget.list[widget.index]['total_biaya']}",
            style: new TextStyle(fontSize: 18.0),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 30.0),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20),
          ),
          new Text(
            "RATING",
            style: new TextStyle(fontSize: 18.0),
          ),
          RatingBarIndicator(
            rating:
                double.parse(widget.list[widget.index]['Rating'].toString()),
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 20.0,
            direction: Axis.horizontal,
          ),
          new Padding(padding: new EdgeInsets.only(top: 20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new RaisedButton(
                  child: new Text("PAYMENT"),
                  color: Colors.green,
                  onPressed: () => Navigator.of(context)
                      .pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) => new EditData(
                      list: widget.list,
                      index: widget.index,
                    ),
                  )),
                ),
                new RaisedButton(
                  child: new Text("CANCEL ORDER"),
                  color: Colors.red,
                  onPressed: () => confirm(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'home-page');
                  },
                  child: Text("Back",
                      style: TextStyle(
                          fontSize: 14, letterSpacing: 0, color: Colors.black)),
                ),
              ],
            ),
          )
        ],
      ),
    );
    //     ),
    //   ),
    // );
  }
}
