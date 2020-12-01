part of 'pages.dart';

class DataPage extends StatefulWidget {
  DataPage({Key key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("List Data"), centerTitle: true, leading: Container()),
    );
  }
}