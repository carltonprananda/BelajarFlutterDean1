part of 'pages.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Add Data"), centerTitle: true, leading: Container()),
    );
  }
}