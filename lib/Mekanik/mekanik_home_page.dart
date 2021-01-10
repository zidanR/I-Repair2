import 'package:flutter/material.dart';
import 'package:flutter_app/Mekanik/detail_mekanik.dart';
import 'package:flutter_app/Mekanik/main_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import '../login_mekanik_page.dart';

class MekanikHomePage extends StatefulWidget {
  MekanikHomePage({this.usernames});
  final String usernames;

  @override
  _MekanikHomePageState createState() => _MekanikHomePageState();
}

class _MekanikHomePageState extends State<MekanikHomePage> {
  Future<List> getData() async {
    final response =
        await http.get("http://bengkelirepair.masuk.id/flutter/getmekanik.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), backgroundColor: Colors.red),
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
                    onTap: () => Navigator.of(context).pushReplacement(
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new DetailMekanik(
                                  list: snapshot.data,
                                  index: i,
                                ))),
                    child: new Card(
                      child: new ListTile(
                        title: new Text(
                            "${snapshot.data[i]['nama_mekanik']} : ${snapshot.data[i]['kondisi']}"),
                        leading: new Icon(Icons.person),
                        subtitle: new Text(
                            "Service Code: ${snapshot.data[i]['kode_pesanan']}"),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
      // ListView(
      //   children: <Widget>[
      //     SizedBox(
      //       height: 20,
      //     ),
      //     Head(),
      //     Body(),
      //     Bottom()
      //   ],
      // ),
    );
  }
}

// class Head extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 60,
//                 child: Image(image: AssetImage('Logo_I-Repair.jpeg')),
//               ),
//               SizedBox(height: 20),
//               Text("Welcome Mekanik",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       color: Colors.black)),
//               SizedBox(height: 0),
//               // Text("$usernames",
//               //     style: TextStyle(
//               //         fontWeight: FontWeight.bold,
//               //         fontSize: 30,
//               //         color: Colors.black)),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         SizedBox(
//           height: 300,
//           child: Image(image: AssetImage('Jadwal_Service.png')),
//         ),
//       ],
//     );
//   }
// }

// class Bottom extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[],
//     );
//   }
// }
