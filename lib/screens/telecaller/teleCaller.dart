import 'dart:ui';

import 'package:employee/exports.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TeleCaller extends StatelessWidget {
  String name;
  String imgUrl;
  String phone;
  String email;
  TeleCaller({this.name, this.imgUrl, this.phone, this.email});
  Widget build(BuildContext context) {
    // CollectionReference ref = FirebaseFirestore.instance.collection('projects');
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              // color: Colors.amber[400],
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.amber[800], Colors.amber[50]],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Image(
                      image: NetworkImage(imgUrl),
                      width: 150,
                      height: 150,
                    ),
                    radius: 100,
                    backgroundColor: Colors.greenAccent[100],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Name : $name",
                    style: TextStyle(
                      color: Colors.blueAccent[700],
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Phone : $phone",
                    style: TextStyle(
                      color: Colors.blueAccent[700],
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    "Email : $email",
                    style: TextStyle(
                      color: Colors.blueAccent[700],
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              child: Container(
                width: double.infinity,
                color: Colors.greenAccent,
                height: 75,
                child: Center(child: Text('Start Calling.....')),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Data(
                      docId: name,
                    ),
                  ),
                );
              },
            ),
            RaisedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text('SignOut'),
            )
            // Row(
            //   children: [
            //     RaisedButton(
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => Data(
            //               docId: name,
            //             ),
            //           ),
            //         );
            //       },
            //       child: Text("Start Calling"),
            //     )
            //   ],
            // ),
            // FutureBuilder(
            //   future: ref.doc('pro').get(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       return null;
            //     } else if (snapshot.connectionState == ConnectionState.done) {
            //       Map<String, dynamic> getimgUrl = snapshot.data.data();
            //       List<dynamic> imgUrls = getimgUrl['proImgUrl'];
            //       print(imgUrls[2]);
            //       return ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemBuilder: (context, index) {
            //           return Image(
            //             image: NetworkImage(imgUrls[index].toString()),
            //             fit: BoxFit.cover,
            //             width: 100,
            //             height: 100,
            //           );
            //         },
            //       );
            //     }
            //     return Loading();
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
