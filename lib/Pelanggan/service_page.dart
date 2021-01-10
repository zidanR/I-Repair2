import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/Pelanggan/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicePage extends StatefulWidget {
  ServicePage({Key key}) : super(key: key);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  String idPengguna;

  Stream<List> getData() async* {
    while (true) {
      final response = await http
          .get("http://bengkelirepair.masuk.id/flutter/getservice.php");
      yield json.decode(response.body);
    }
  }

  void _takePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idPengguna = prefs.getString('idpengguna');
    });
  }

  @override
  void initState() {
    super.initState();
    _takePrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service'),
        backgroundColor: Colors.orange,
        actions: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'daftarservice-page');
        },
        tooltip: 'Increment',
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
      body: new StreamBuilder<List>(
        stream: getData(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text('Loading...'),
              ),
            );
          }
          return new ItemList(
            list: snapshot.data,
            idPengguna: idPengguna,
          );
          // ListView.builder(
          //     itemCount: snapshot.data.length,
          //     itemBuilder: (context, i) {
          //       return new Container(
          //         padding: const EdgeInsets.all(10.0),
          //         child: new GestureDetector(
          //           onTap: () => Navigator.of(context)
          //               .pushReplacement(new MaterialPageRoute(
          //                   builder: (BuildContext context) => new Detail(
          //                         list: snapshot.data,
          //                         index: i,
          //                       ))),
          //           child: new Card(
          //             child: new ListTile(
          //               title: new Text(
          //                   "${snapshot.data[i]['nama_akun']} / ${snapshot.data[i]['jenis_motor']}"),
          //               leading: new Icon(Icons.person),
          //               subtitle: new Text(
          //                   "Vehicle Status: ${snapshot.data[i]['status_mekanik']}"),
          //             ),
          //           ),
          //         ),
          //       );
          //     });
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  final String idPengguna;
  ItemList({this.list, this.idPengguna});

  @override
  Widget build(BuildContext context) {
    List selectedList = list
        .where((data) => data['id_pengguna'] == idPengguna.toString())
        .toList();

    return new ListView.builder(
        itemCount: selectedList == null ? 0 : selectedList.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                            list: selectedList,
                            index: i,
                          ))),
              child: new Card(
                child: new ListTile(
                  title: new Text(selectedList[i]['nama_akun']),
                  leading: new Icon(Icons.person),
                  subtitle: new Text(
                      "Motorcycle : ${selectedList[i]['jenis_motor']}"),
                ),
              ),
            ),
          );
        });
  }
}
