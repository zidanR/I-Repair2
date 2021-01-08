import 'package:flutter/material.dart';
import 'package:flutter_app/Mekanik/mekanik_home_page.dart';
import 'package:flutter_app/Mekanik/mekanik_profil_page.dart';
import 'package:flutter_app/Mekanik/mekanik_service_page.dart';
import 'package:flutter_app/Mekanik/mekanik_sparepart_page.dart';
import 'package:flutter_app/Pelanggan/chat_page.dart';
import 'package:flutter_app/Pelanggan/detail.dart';
import 'package:flutter_app/Pelanggan/edit_profil_page.dart';
import 'package:flutter_app/Pelanggan/sparepart_page.dart';
import 'package:flutter_app/Pelanggan/tanggal_page.dart';
import 'package:flutter_app/daftar_page.dart';
import 'package:flutter_app/home_page.dart';
import 'package:flutter_app/login_mekanik_page.dart';
import 'package:flutter_app/login_page.dart';
import 'package:flutter_app/start_page.dart';
import 'package:flutter_app/Pelanggan/homes_page.dart';
import 'package:flutter_app/Pelanggan/profil_page.dart';
import 'package:flutter_app/Pelanggan/daftar_service_page.dart';
import 'package:flutter_app/Mekanik/mekanik_chat_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I-Repair',
      routes: <String, WidgetBuilder>{
        'start-page': (context) => StartPage(),
        'login-page': (context) => LoginPage(),
        'daftar-page': (context) => DaftarPage(),
        'chat-page': (context) => ChatPage(),
        'home-page': (BuildContext context) => new HomePage(
              username: usernamesss,
            ),
        'homes-page': (context) => HomesPage(),
        'profil-page': (BuildContext context) => new ProfilPage(),
        'daftarservice-page': (context) => DaftarServicePage(),
        'editprofil-page': (context) => EditProfilPage(),
        'mekanikhome-page': (BuildContext context) => new MekanikHomePage(
              usernames: usernamess,
            ),
        'mekanikchat-page': (context) => MekanikChatPage(),
        'mekanikprofil-page': (context) => MekanikProfilPage(),
        'mekanikservice-page': (context) => MekanikServicePage(),
        'mekaniksparepart-page': (context) => MekanikSparepartPage(),
        'tanggal-page': (context) => TanggalPage(),
        'loginmekanik-page': (context) => LoginMekanikPage(),
        'sparepart-page': (context) => SparepartPage(),
        'detail-page': (context) => Detail(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'start-page',
      //home: StartPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Text("Login"),
      ),
    );
  }
}
