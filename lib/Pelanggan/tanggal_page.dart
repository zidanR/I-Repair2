import 'package:flutter/material.dart';

class TanggalPage extends StatefulWidget {
  TanggalPage({Key key}) : super(key: key);

  @override
  _TanggalPageState createState() => _TanggalPageState();
}

class _TanggalPageState extends State<TanggalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tanggal'),
        backgroundColor: Colors.orange,
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 1000,
              child: Image(image: AssetImage('Logo_I-Repair.jpeg')),
            ),
          ],
        ),
      ),
    );
  }
}
