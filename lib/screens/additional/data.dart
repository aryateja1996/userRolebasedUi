import 'package:employee/exports.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Data extends StatefulWidget {
  String docId;
  Data({this.docId});
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    //User user = FirebaseAuth.instance.currentUser;
    //CollectionReference ref = FirebaseFirestore.instance.collection("users");
    CollectionReference data = FirebaseFirestore.instance.collection('Data1');
    return FutureBuilder<DocumentSnapshot>(
      future: data.doc(widget.docId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return null;
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> phones = snapshot.data.data();

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return RaisedButton(
                    onPressed: () {
                      index.toString();
                      customLauncher(phones[index.toString()]);

                      print(phones[index]);
                      print(index);
                      print(index.toString().runtimeType);
                    },
                    child: Text(phones[index.toString()]),
                  );
                },
              ),
            ),
          );
        }
        return Loading();
      },
    );
  }

  void customLauncher(phone) async {
    var command = 'tel:+91$phone';
    print(command);
    print(command.runtimeType);
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("Can't launch");
    }
  }
}
