import 'package:flutter/material.dart';
import 'package:flutter_app/Mekanik/details.dart';
import 'package:flutter_app/Mekanik/main_drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:flutter_app/Mekanik/details.dart';

class MekanikServicePage extends StatefulWidget {
  MekanikServicePage({Key key}) : super(key: key);

  @override
  _MekanikServicePageState createState() => _MekanikServicePageState();
}

class _MekanikServicePageState extends State<MekanikServicePage> {
  Future<List> getData() async {
    final response =
        await http.get("http://bengkelirepair.masuk.id/flutter/getservice.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Service"), backgroundColor: Colors.red),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
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
                            builder: (BuildContext context) => new Details(
                                  list: snapshot.data,
                                  index: i,
                                ))),
                    child: new Card(
                      child: new ListTile(
                        title: new Text(
                            "${snapshot.data[i]['nama_akun']} / ${snapshot.data[i]['jenis_motor']}"),
                        leading: new Icon(Icons.person),
                        subtitle: new Text(
                            "Vehicle Status: ${snapshot.data[i]['status_mekanik']}"),
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
//                       builder: (BuildContext context) => new Details(
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
