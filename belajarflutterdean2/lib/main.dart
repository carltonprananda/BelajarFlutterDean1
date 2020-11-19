import 'package:belajarflutterdean2/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'bloc/bloc.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();

  @override
  void dispose() {
    ctrlName.dispose();
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light, primaryColor: Colors.red[600]),
        darkTheme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.red[400]),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Sign up"),
          ),
          body: Container(
              margin: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 40),
                        TextFormField(
                            controller: ctrlName,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle_sharp),
                                labelText: 'Full Name',
                                hintText: "Your Full Name Please",
                                border: OutlineInputBorder())),
                        SizedBox(height: 40),
                        TextFormField(
                            controller: ctrlEmail,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.mail_sharp),
                                labelText: 'Email',
                                hintText: "Your Email Please",
                                border: OutlineInputBorder())),
                        SizedBox(height: 40),
                        TextFormField(
                            controller: ctrlPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_clock),
                                labelText: 'Passord',
                                hintText: "Your Password Please",
                                border: OutlineInputBorder())),
                        SizedBox(height: 40),
                        RaisedButton.icon(
                          onPressed: () {
                            if (ctrlName.text == "" ||
                                ctrlEmail.text == "" ||
                                ctrlPassword.text == "") {
                              Fluttertoast.showToast(
                                  msg: "Please fill all fields :-)",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER_RIGHT,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.yellow,
                                  fontSize: 16.0);
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Success :-)",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER_RIGHT,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.yellow,
                                  fontSize: 16.0);
                            }
                          },
                          icon: Icon(Icons.upload_sharp),
                          label: Text("Sign up"),
                          textColor: Colors.white,
                          color: Colors.blue,
                        )
                      ])
                ],
              )),
        ));
  }
}
