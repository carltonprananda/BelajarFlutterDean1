import 'main.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

final String WaktuSkrg = getWaktuSistem();
final String TanggalSkrg = getTanggalSistem();

//Refrence: pub.dev via Stackoverflow
String getWaktuSistem() {
  var waktuskrg = new DateTime.now();
  return new DateFormat("H:m:s").format(waktuskrg);
}

String getTanggalSistem() {
  var tanggalskrg = new DateTime.now();
  return new DateFormat("EdMMMMy").format(tanggalskrg);
}

class HomePart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bagian Test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Column(children: <Widget>[

          ]
          ),
        ),
      ),
    );
  }
}
