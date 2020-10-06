import 'package:flutter/material.dart';

class HomePart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hotel'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          children: <Widget>[
            Image.network(
                "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20021087-c9dd5ef476a9c7766ad7b24ebb347e30.jpeg?tr=q-40,c-at_max,w-740,h-500&_src=imagekit"),
            Row(),
            Text(
              'Welcome to Golden Tulip Holland Batu',
              style: TextStyle(fontSize: 24, fontFamily: "Sans Serif"),
            ),
            Text(
              'entertainments, it offers two food & beverafe venues, swimming pools, a spa, a fitness center, a kids playground and meeting room facilities which cater up to 2009 person',
              style: TextStyle(fontSize: 16, fontFamily: "Sans Serif"),
              textAlign: TextAlign.left,
            ),
            Text(
              'Golden Tulip Holland Resort offers the kind of facilities and services that make travelling with children a breeze. The hotel',
              style: TextStyle(fontSize: 16, fontFamily: "Sans Serif"),
              textAlign: TextAlign.left,
            ),
            Text(
              
            )
          ],
        ),
      ),
    );
  }
}
