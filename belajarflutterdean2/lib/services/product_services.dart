part of 'services.dart';

class ProductServices {
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");
  static DocumentReference productDoc;

  static Reference ref;
  static UploadTask uploadTask;

  static String imgUrl;

  static Future<bool> addProduct(Products product, PickedFile imgFile) async {
    await Firebase.initializeApp();

    productDoc = await productCollection.add({
      'id': "",
      'name': product.name,
      'price': product.price,
      'image': "",
    });

    if (productDoc.id != null) {
      ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child(productDoc.id + ".png");
      uploadTask = ref.putFile(File(imgFile.path));

      await uploadTask.whenComplete(() => ref.getDownloadURL().then((value) => imgUrl = value,));

      productCollection.doc(productDoc.id).update({
        'id' : productDoc.id,
        'image' : imgUrl,
      });

      return true;

    }else{
      return false;
    }
  }
  static Future<bool>updateProduct(Products product, PickedFile) async {
    await Firebase.initializeApp();

    await productDoc.set({
      'id': "",
      'name': product.name,
      'price': product.price,
      'image': "",
    });
  }
  static Future<bool>deleteProduct(Products product, PickedFile) async {
    await Firebase.initializeApp();

    await productDoc.delete();
    
  }
}
