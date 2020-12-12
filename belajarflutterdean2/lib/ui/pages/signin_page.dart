part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isLoading = true;

  @override
  void dispose() {
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
            title: Text("Sign in"),
          ),
          body: Stack(children: [
            Container(
                margin: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
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
                              if (ctrlEmail.text == "" ||
                                  ctrlPassword.text == "") {
                                Fluttertoast.showToast(
                                    msg: "Please fill all fields :-)",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER_RIGHT,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.yellow,
                                    fontSize: 16.0);
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                String result = await AuthServices.signIn(
                                    ctrlEmail.text, ctrlPassword.text);
                                if (result == "success") {
                                  Fluttertoast.showToast(
                                      msg: "Sign in success",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER_RIGHT,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.yellow,
                                      fontSize: 16.0);
                                  setState(() {
                                    isLoading = true;
                                  });
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return MainMenu();
                                  }));
                                } else {
                                  Fluttertoast.showToast(
                                      msg: result,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER_RIGHT,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.yellow,
                                      fontSize: 16.0);
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              }
                            },
                            icon: Icon(Icons.upload_sharp),
                            label: Text("Sign in"),
                            textColor: Colors.white,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 25),
                          RichText(
                              text: TextSpan(
                                  text: 'Not registered? Sign Up.',
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return SignUpPage();
                                      }));
                                    }))
                        ])
                  ],
                )),
            isLoading==true ?
            Container(
              width: double.infinity,
              height: double.infinity,
              child: SpinKitFadingCircle(
                color: Colors.red,
                size: 50,
              ),
            )
            :
              Container()
          ]),
        ));
  }
}
