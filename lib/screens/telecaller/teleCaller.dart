import 'package:employee/exports.dart';
import 'package:flutter/material.dart';

class TeleCaller extends StatelessWidget {
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
