import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class SparepartPage extends StatefulWidget {
  SparepartPage({Key key}) : super(key: key);

  @override
  _SparepartPageState createState() => _SparepartPageState();
}

class _SparepartPageState extends State<SparepartPage> {
  Future<List> getData() async {
    final response = await http
        .get("http://bengkelirepair.masuk.id/flutter/getsparepart.php");
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Sparepart"), backgroundColor: Colors.orange),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              child: new Card(
                child: new ListTile(
                  title: new Text(list[i]['nama_barang']),
                  leading: new Icon(Icons.handyman_sharp),
                  subtitle: new Text(
                      "Stock : ${list[i]['stock_akhir']}  | Cost : Rp. ${list[i]['harga_sparepart']}"),
                ),
              ),
            ),
          );
        });
  }
}
