import 'package:flutter/material.dart';
import 'package:flash_chat/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var loggedinuser;

class ChatScreen extends StatefulWidget {
  static const id = 'chatscreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final textcontroller = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  var message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser() async {
    try {
      var user = await _auth.currentUser;
      if (user != null) {
        loggedinuser = user;
        print(loggedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️My group'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            mymsgscreen(
              firestore: _firestore,
              currentuser: loggedinuser,
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textcontroller,
                      onChanged: (value) {
                        message = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      textcontroller.clear();
                      _firestore.collection('messages').add({
                        'text': message,
                        'sender': loggedinuser.email,
                      });

                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class mymsgscreen extends StatelessWidget {
  mymsgscreen(
      {Key? key, required FirebaseFirestore firestore, this.currentuser})
      : _firestore = firestore,
        super(key: key);

  final FirebaseFirestore _firestore;
  var currentuser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            );
          }
          var list = snapshot.data.docs;
          var documentslist = new List.from(list.reversed);

          List<Widget> column = [];
          for (var message in documentslist) {
            if (loggedinuser.email == message['sender']) {
              column.add(mymsg(
                message: message,
                rightradius: 0.0,
                color: Colors.lightBlueAccent,
                textcolor: Colors.white,
                isme: true,
              ));
            } else {
              column.add(mymsg(
                message: message,
                color: Colors.blueGrey.shade50,
                textcolor: Colors.black,
                leftradius: 0.0,
                isme: false,
              ));
            }
          }

          return Expanded(
            child: ListView(
              reverse: true,
              children: column,
            ),
          );
        });
  }
}

class mymsg extends StatelessWidget {
  mymsg(
      {Key? key,
      required this.message,
      this.color = Colors.lightBlueAccent,
      this.textcolor = Colors.white70,
      this.leftradius = 30.0,
      this.rightradius = 30.0,
      this.isme = false})
      : super(key: key);

  var message;
  var color;
  var textcolor;
  var leftradius;
  var rightradius;
  var isme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          "from ${message['sender']}",
          style: TextStyle(color: Colors.blueGrey, fontSize: 10),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 15, right: 10),
          child: Material(
              elevation: 10,
              color: color,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(leftradius),
                  topRight: Radius.circular(rightradius)),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  child: Text(
                    "${message['text']} ",
                    style: TextStyle(
                        color: textcolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ))),
        ),
      ],
    );
  }
}
