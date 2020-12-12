import 'package:belajarflutterdean2/models/models.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final Products product;
  const ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ListTile(
        onTap: (){

        },
        title: Text(product.name, style: TextStyle(fontSize: 20)),
        subtitle: Text(product.price),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(product.image, scale: 50),
          child: Text(product.name[0], style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}