import 'package:flutter/material.dart';

class BookingPart extends StatefulWidget {
  @override
  BookingPartState createState() => BookingPartState();
}



class BookingPartState extends State<BookingPart> {
  TextEditingController namecontroller = TextEditingController(text: " ");
    TextEditingController emailcontroller = TextEditingController(text: " ");
    TextEditingController phonecontroller = TextEditingController(text: " ");
    TextEditingController citycontroller = TextEditingController(text: " ");
  void bookingdialog(BuildContext context) {

    Widget okButton = FlatButton(onPressed: () {
      Navigator.of(context).pop();
    }, child: Text("Ok"));

    var alertDialog = AlertDialog(
      title: Text("Confirm"),
                    content: 
                    Text("Name : " + namecontroller.text + "\n"
                    "Email : " + emailcontroller.text + "\n"
                    "Phone : " + phonecontroller.text + "\n"
                    "City : " + citycontroller.text + "\n"
                    ),
      actions: [ okButton, ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hotel 2"),
        ),
        body: Column(
          children: <Widget>[
            TextFormField(
              onChanged: (String name) {},
              controller: namecontroller,
            ),
            TextFormField(
              onChanged: (String email) {},
              controller: emailcontroller,
            ),
            TextFormField(
              onChanged: (String phone) {},
              controller: phonecontroller,
            ),
            TextFormField(
              onChanged: (String city) {},
              controller: citycontroller,
            ),
            RaisedButton(
              onPressed: () {
                bookingdialog(context);
              },
              child: Text("Book Now"),
              color: Colors.blueAccent,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  
}
