import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/Pelanggan/detail.dart';

class ServicePage extends StatefulWidget {
  ServicePage({Key key}) : super(key: key);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  Stream<List> getData() async* {
    while (true) {
      final response = await http
          .get("http://bengkelirepair.masuk.id/flutter/getservice.php");
      yield json.decode(response.body);
    }
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
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                return new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushReplacement(new MaterialPageRoute(
                            builder: (BuildContext context) => new Detail(
                                  list: snapshot.data,
                                  index: i,
                                ))),
                    child: new Card(
                      child: new ListTile(
                        title: new Text(snapshot.data[i]['nama_akun']),
                        leading: new Icon(Icons.person),
                        subtitle: new Text(
                            "Motorcycle : ${snapshot.data[i]['jenis_motor']}"),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

// class ItemList extends StatelessWidget {
//   final List list;
//   ItemList({this.list});
//   @override
//   Widget build(BuildContext context) {
//     return new ListView.builder(
//         itemCount: list == null ? 0 : list.length,
//         itemBuilder: (context, i) {
//           return new Container(
//             padding: const EdgeInsets.all(10.0),
//             child: new GestureDetector(
//               onTap: () =>
//                   Navigator.of(context).pushReplacement(new MaterialPageRoute(
//                       builder: (BuildContext context) => new Detail(
//                             list: list,
//                             index: i,
//                           ))),
//               child: new Card(
//                 child: new ListTile(
//                   title: new Text(list[i]['nama_akun']),
//                   leading: new Icon(Icons.person),
//                   subtitle: new Text("Motorcycle : ${list[i]['jenis_motor']}"),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
