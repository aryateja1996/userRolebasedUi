import 'package:employee/exports.dart';
import 'package:employee/screens/telecaller/teleCaller.dart';
import 'package:flutter/material.dart';

class AllUser extends StatefulWidget {
  @override
  _AllUserState createState() => _AllUserState();
}

class _AllUserState extends State<AllUser> {
  @override
  void initState() {
    super.initState();
    final User user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
          (route) => false);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection("users");
    return FutureBuilder<DocumentSnapshot>(
      future: ref.doc(user.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return null;
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> userData = snapshot.data.data();
          if (userData['designation'] == 'telecaller') {
            return TeleCaller(
              name: userData['name'],
              imgUrl: userData['imgUrl'],
              phone: userData['phone'],
              email: userData['email'],
            );
          } else {
            //Create a new page and call it or you can directly do this
            return Scaffold(
              backgroundColor: Colors.pinkAccent,
              body: Center(
                child: RaisedButton(
                  child: Text('SignOut'),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                ),
              ),
            );
          }
        }
        return Loading();
      },
    );
  }
}
