import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_app/Pelanggan/models/message_model.dart';
// import 'package:flutter_app/Pelanggan/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  // final docs;
  final String idpengguna;
  ChatScreen({this.idpengguna});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String idpengguna;
  String groupChatId;
  String anotherUsername;
  String idmekanik;

  TextEditingController textEditingController = TextEditingController();

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getGroupChatId();
  }

  getGroupChatId() async {
    idpengguna = widget.idpengguna;
    // String anotherUserId = widget.docs['id'];
    // String _anotherUsername = widget.docs['username'];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    idmekanik = sharedPreferences.getString('iduser');
    print('idmekanik: $idmekanik');
    print('idpengguna : $idpengguna');
    if (idmekanik.compareTo(idpengguna) > 0) {
      groupChatId = '$idmekanik - $idpengguna';
    } else {
      groupChatId = '$idpengguna - $idmekanik';
    }
    // ignore: deprecated_member_use
    Firestore.instance
        .collection('users')
        // ignore: deprecated_member_use
        .document(idmekanik)
        // ignore: deprecated_member_use
        .updateData({'chatting': idmekanik});
    setState(() {});
  }
  //   setState(() {
  //     anotherUsername = _anotherUsername;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double centerTextField = 5;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(title: Text("Chat"), backgroundColor: Colors.orange),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('messages')
              .doc(groupChatId)
              .collection(groupChatId)
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                    controller: scrollController,
                    itemBuilder: (listContext, index) =>
                        buildItem(snapshot.data.documents[index]),
                    itemCount: snapshot.data.documents.length,
                    reverse: true,
                  )),
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                controller: textEditingController,
                                cursorColor: Colors.black,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    bottom: centerTextField /
                                        2, // HERE THE IMPORTANT PART
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Masukan pesan ...',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 0.1,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
                          child: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Colors.blue,
                              size: 20,
                            ),
                            onPressed: () {
                              sendMsg();
                              textEditingController.text = "";
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                  child: SizedBox(
                height: 36,
                width: 36,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ));
            }
          },
        ),
      ),
    );
  }

  sendMsg() {
    String msg = textEditingController.text.trim();

    /// Upload images to firebase and returns a URL
    if (msg.isNotEmpty) {
      print('thisiscalled $msg');
      var ref = FirebaseFirestore.instance
          .collection('messages')
          .doc(groupChatId)
          .collection(groupChatId)
          .doc(DateTime.now().millisecondsSinceEpoch.toString());

      FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.set(ref, {
          "senderId": idmekanik,
          "anotherUserId": idpengguna,
          "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
          'content': msg,
          "type": 'text',
        });
      });

      scrollController.animateTo(0.0,
          duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);
    } else {
      print('Please enter some text to send');
    }
  }

  buildItem(doc) {
    String sendByMe = (doc.data()['senderId']);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Container(
        padding: EdgeInsets.only(
            // ignore: unrelated_type_equality_checks
            left: (sendByMe == idmekanik ? 24 : 0),
            // ignore: unrelated_type_equality_checks
            right: (sendByMe == idmekanik ? 0 : 24)),
        // ignore: unrelated_type_equality_checks
        alignment: (sendByMe == idmekanik
            ? Alignment.centerRight
            : Alignment.centerLeft),
        child: Container(
          // ignore: unrelated_type_equality_checks
          margin: sendByMe == idmekanik
              ? EdgeInsets.only(left: 30)
              : EdgeInsets.only(right: 30),
          padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
          decoration: BoxDecoration(
              // ignore: unrelated_type_equality_checks
              borderRadius: sendByMe == idmekanik
                  ? BorderRadius.only(
                      topLeft: Radius.circular(23),
                      topRight: Radius.circular(23),
                      bottomLeft: Radius.circular(23))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(23),
                      topRight: Radius.circular(23),
                      bottomRight: Radius.circular(23)),
              color:
                  // ignore: unrelated_type_equality_checks
                  sendByMe == idmekanik ? Colors.grey[200] : Colors.grey[300]),
          child: (doc.data()['type'] == 'text')
              ? Text('${doc.data()['content']}',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w400,
                  ))
              : Image.network(doc.data()['content']),
        ),
      ),
    );
  }
}
