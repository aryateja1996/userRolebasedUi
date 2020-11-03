import 'package:employee/exports.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Admin Page',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
              ),
            ),
            RaisedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Text('SignOut'),
            )
          ],
        ),
      ),
    );
  }
}
