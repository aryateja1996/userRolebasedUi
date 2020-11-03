import 'package:employee/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email;

  String _name;

  String _phone;

  String _password;

  String _address;

  var result;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: _formKey2,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.name,
                          onSaved: (input) {
                            _name = input;
                          },
                          decoration: InputDecoration(
                            labelText: "Name",
                            //labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 4,
                              style: BorderStyle.solid,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            )),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            //labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 4,
                              style: BorderStyle.solid,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            )),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          onSaved: (input) {
                            _email = input;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Phone",
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black38,
                              width: 4,
                              style: BorderStyle.solid,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            )),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          onSaved: (input) {
                            _phone = input;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          maxLines: 10,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            labelText: "Address",
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black38,
                              width: 4,
                              style: BorderStyle.solid,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            )),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          onSaved: (input) {
                            _address = input;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black38,
                              width: 4,
                              style: BorderStyle.solid,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            )),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          onSaved: (input) {
                            _password = input;
                          },
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Confrim Password",
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black38,
                              width: 4,
                              style: BorderStyle.solid,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            )),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          onSaved: (input) {
                            if (_password == input) {
                              print('ok');
                            } else {
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text("Password  Did not match"),
                                ),
                              );
                            }
                          },
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: RaisedButton(
                              onPressed: emailSignup,
                              child: Text(
                                'Start Your Journey With Us',
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void emailSignup() async {
    final form = _formKey2.currentState;

    if (form.validate()) {
      try {
        form.save();
        result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
      } catch (e) {
        print(e.message);
      }

      FirebaseFirestore.instance.collection("user").doc(result.user.uid).set({
        "username": _name,
        "phone": _phone,
        "address": _address,
        "email": _email,
        "admin": false,
      });

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => AllUser()), (route) => false);
    }
  }
}
