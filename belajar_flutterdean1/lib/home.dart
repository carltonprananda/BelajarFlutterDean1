import 'package:flutter/material.dart';

class HomePart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel App',
      theme: ThemeData(brightness: Brightness.light),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hotel'),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(
                  "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20021087-c9dd5ef476a9c7766ad7b24ebb347e30.jpeg?tr=q-40,c-at_max,w-740,h-500&_src=imagekit"),
              Row(
                children: <Widget>[
                  Image.network(
                    "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20021087-c9dd5ef476a9c7766ad7b24ebb347e30.jpeg?tr=q-40,c-at_max,w-740,h-500&_src=imagekit",
                    width: 100,
                    height: 100,
                  ),
                  Image.network(
                    "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20021087-c9dd5ef476a9c7766ad7b24ebb347e30.jpeg?tr=q-40,c-at_max,w-740,h-500&_src=imagekit",
                    width: 100,
                    height: 100,
                  ),
                  Image.network(
                    "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20021087-c9dd5ef476a9c7766ad7b24ebb347e30.jpeg?tr=q-40,c-at_max,w-740,h-500&_src=imagekit",
                    width: 100,
                    height: 100,
                  ),
                  Image.network(
                    "https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20021087-c9dd5ef476a9c7766ad7b24ebb347e30.jpeg?tr=q-40,c-at_max,w-740,h-500&_src=imagekit",
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              Text(
                'Welcome to Golden Tulip Holland Batu',
                style: TextStyle(fontSize: 24, fontFamily: "Sans Serif"),
              ),
              Text(
                'entertainments, it offers two food & beverafe venues, swimming pools, a spa, a fitness center, a kids playground and meeting room facilities which cater up to 2009 person \n',
                style: TextStyle(fontSize: 16, fontFamily: "Sans Serif"),
                textAlign: TextAlign.left,
              ),
              Text(
                'Golden Tulip Holland Resort offers the kind of facilities and services that make travelling with children a breeze. The hotel is geared towards the needs and requirements of all families, big and small. Our Hotel offers various activities for kids, along with a pool/slide. \n',
                style: TextStyle(fontSize: 16, fontFamily: "Sans Serif"),
                textAlign: TextAlign.left,
              ),
              Text(
                'Try our tempting menu of drinks and light meals available 24 hours. When you feel the need of food and beverage, we are ready to serve you. Our business center offers computer use and internet services, ',
                style: TextStyle(fontSize: 16, fontFamily: "Sans Serif"),
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
      ),
    );
  }
}
