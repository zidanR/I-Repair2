import 'package:flutter/material.dart';
// import 'package:flutter_app/Mekanik/main_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'mekanik_chat_screen.dart';
// import 'package:flutter_app/Pelanggan/chat_screen.dart';

class MekanikChatPage extends StatefulWidget {
  MekanikChatPage({Key key}) : super(key: key);

  @override
  _MekanikChatPageState createState() => _MekanikChatPageState();
}

class _MekanikChatPageState extends State<MekanikChatPage> {
  String idmekanik;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Chat"), backgroundColor: Colors.orange),
        // drawer: Drawer(
        //   child: MainDrawer(),
        // ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (listContext, index) =>
                              buildItem(snapshot.data.docs[index]),
                          itemCount: snapshot.data.docs.length,
                        );
                      }

                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  buildItem(DocumentSnapshot doc) {
    return (doc.data()['level'] == '3')
        ? Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MekanikChatScreen(
                              idmekanik: doc['id'],
                            )));
                print(doc['id']);
              },
              child: Card(
                elevation: 4.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      doc['username'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
