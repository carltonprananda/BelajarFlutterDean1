part of 'pages.dart';

class DataPage extends StatefulWidget {
  DataPage({Key key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  bool isLoading = false;
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("List Data"), centerTitle: true, leading: Container()),
      body: Stack(children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream: productCollection.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Failed to get products data!");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SpinKitFadingCircle(
                    size: 50,
                    color: Colors.blue,
                  );
                }

                return ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
                    return ProductCard(
                      product: Products(
                        doc.data()['id'],
                        doc.data()['name'],
                        doc.data()['price'],
                        doc.data()['image'],
                      ),
                    );
                  }).toList(),
                );
              },
            )),
        isLoading == true
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
                child: SpinKitCircle(size: 50, color: Colors.blue))
            : Container()
      ]),
    );
  }
}
