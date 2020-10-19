import 'package:flutter/material.dart';

class BookingPart extends StatefulWidget {
  @override
  BookingPartState createState() => BookingPartState();
}

class BookingPartState extends State<BookingPart> {

  final formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController(text: "");
  TextEditingController emailcontroller = TextEditingController(text: "");
  TextEditingController phonecontroller = TextEditingController(text: "");
  TextEditingController citycontroller = TextEditingController(text: "");
  void bookingdialog(BuildContext context) {
    Widget okButton = FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("Ok"));

    var alertDialog = AlertDialog(
      title: Text("Confirm"),
      content: Text("Name : " +
          namecontroller.text +
          "\n"
              "Email : " +
          emailcontroller.text +
          "\n"
              "Phone : " +
          phonecontroller.text +
          "\n"
              "City : " +
          citycontroller.text +
          "\n"),
      actions: [
        okButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
      appBar: AppBar(
        title: Text("Booking Part"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(1.0)),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                labelText: "Name",
                hintText: "Your Name",
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (name) {
                if (name.isEmpty == true) {
                  return 'You must enter your name';
                }
                return null;
              },
              controller: namecontroller,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                labelText: "Email",
                hintText: "Your Email",
                hintStyle: TextStyle(fontSize: 14),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (email) {
                if (email.isEmpty) {
                  return 'You must enter your email';
                }
                return null;
              },
              controller: emailcontroller,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                labelText: "Phone",
                hintText: "Your Phone",
                hintStyle: TextStyle(fontSize: 14),
              ),
              keyboardType: TextInputType.phone,
              validator: (phone) {
                if (phone.isEmpty) {
                  return 'You must enter your phone';
                }
                return null;
              },
              controller: phonecontroller,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_city),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                labelText: "City",
                hintText: "Your City",
                hintStyle: TextStyle(fontSize: 14),
              ),
              validator: (city) {
                if (city.isEmpty) {
                  return 'You must enter your city';
                }
                return null;
              },
              controller: citycontroller,
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
            RaisedButton(
              onPressed: () {
                //bookingdialog(context);
                if (formKey.currentState.validate()) {
                  bookingdialog(context);
                }
              },
              child: Text("Book Now"),
              color: Colors.blueAccent,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    ));
  }
}
