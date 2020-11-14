import 'package:employee/exports.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TeleCaller extends StatelessWidget {
  String name;
  String imgUrl;
  String phone;
  TeleCaller({this.name, this.imgUrl, this.phone});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: NetworkImage(imgUrl),
              width: 200,
              height: 200,
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
              ),
            ),
            Text(
              phone,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Data(
                          docId: name,
                        ),
                      ),
                    );
                  },
                  child: Text("Start Calling"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
