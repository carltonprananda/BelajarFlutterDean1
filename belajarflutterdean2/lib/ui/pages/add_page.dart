part of 'pages.dart';

class AddPage extends StatefulWidget {
  AddPage({Key key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    final ctrlName = TextEditingController();
    final ctrlPrice = TextEditingController();
    bool isLoading = false;

    @override
    void dispose() {
      ctrlName.dispose();
      ctrlPrice.dispose();
      super.dispose();
    }

    PickedFile imageFile;
    final ImagePicker imagePicker = ImagePicker();

    Future chooseImage() async {
      final selectedimage = await imagePicker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      setState(() {
        imageFile = selectedimage;
      });
    }

    void clearForm() {
      ctrlName.clear();
      ctrlPrice.clear();
      setState(() {
        imageFile = null;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Add Data"),
          centerTitle: true,
          leading: Container(),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            Column(
              children: [
                SizedBox(height: 10),
                TextFormField(
                    controller: ctrlName,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.text_format),
                        labelText: 'Name Product',
                        hintText: "Your Email Please",
                        border: OutlineInputBorder())),
                SizedBox(height: 20),
                TextFormField(
                    keyboardType: TextInputType.number,
                    controller: ctrlPrice,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calculate),
                        labelText: 'Price Product',
                        hintText: "Your Product Please",
                        border: OutlineInputBorder())),
                SizedBox(height: 20),
                imageFile == null ?
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton.icon(
                            onPressed: () {
                              chooseImage();
                            },
                            icon: Icon(Icons.image_rounded),
                            label: Text("Select from Gallery"),
                          ),
                          Text("File not Found")
                        ],
                      )
                    : 
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton.icon(
                            onPressed: () {
                              chooseImage();
                            },
                            icon: Icon(Icons.image_rounded),
                            label: Text("Reselect from Gallery"),
                          ),
                          Semantics(
                            child: Image.file(File(imageFile.path), width: 100),
                          )
                        ],
                      ),
                SizedBox(height: 40),
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text("Add Product"),
                    onPressed: () async {
                      if (ctrlName.text == "" ||
                          ctrlPrice.text == "" ||
                          imageFile == null) {
                        Fluttertoast.showToast(
                            msg: "Please fill all fields :-)",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER_RIGHT,
                            backgroundColor: Colors.red,
                            textColor: Colors.yellow,
                            fontSize: 16.0);
                      } else {
                        Products product =
                            Products("", ctrlName.text, ctrlPrice.text, "");
                        bool result = await ProductServices.addProduct(
                            product, imageFile);
                        if (result == true) {
                          Fluttertoast.showToast(
                              msg: "Success :-)",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER_RIGHT,
                              backgroundColor: Colors.red,
                              textColor: Colors.yellow,
                              fontSize: 16.0);
                          clearForm();
                        } else {
                          Fluttertoast.showToast(
                              msg: "PFailed :-)",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER_RIGHT,
                              backgroundColor: Colors.red,
                              textColor: Colors.yellow,
                              fontSize: 16.0);
                        }
                      }
                    })
              ],
            ),
          ]),
        ));
  }
}
