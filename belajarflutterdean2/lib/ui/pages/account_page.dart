part of 'pages.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Account Data"),
            centerTitle: true,
            leading: Container()),
        body: Stack(children: [
          Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm"),
                              content: Text("Are you sure?"),
                              actions: [
                                FlatButton(onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await AuthServices.signOut().then((value) {
                                    if (value) {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                        return SignInPage();
                                      })
                                      );
                                      setState(() {
                                        isLoading = false;
                                      });
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  });
                                },
                                child: Text("Yes"),
                                ),
                                FlatButton(child: Text("No"), onPressed: () {
                                  Navigator.pop(context);
                                },)
                              ],
                            );
                          });
                      setState(() {
                        isLoading = true;
                      });
                      await AuthServices.signOut().then((value) {
                        if (value) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return SignInPage();
                          }));
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      });
                    },
                    padding: EdgeInsets.all(12),
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    child: Text("Sign Out")),
              )),
          isLoading == true
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: SpinKitFadingCircle(
                    color: Colors.blue,
                    size: 50,
                  ),
                )
              : Container()
        ]));
  }
}
