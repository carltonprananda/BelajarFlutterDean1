part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                                labelText: 'Password',
                                hintText: "Your Password Please",
                                border: OutlineInputBorder())),
                        SizedBox(height: 40),
                        RaisedButton.icon(
                          onPressed: () async {
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
                              String result = await AuthServices.signUp(
                                  ctrlName.text,
                                  ctrlEmail.text,
                                  ctrlPassword.text);
                              Fluttertoast.showToast(
                                  msg: result,
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
                        ),
                        SizedBox(height: 25),
                        RichText(
                            text: TextSpan(
                                text: 'Already registered? Sign in.',
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignInPage();
                                    }));
                                  }))
                      ])
                ],
              )),
        ));
  }
}
