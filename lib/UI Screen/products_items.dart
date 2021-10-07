import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:product_app/Models/Products.dart';

import 'package:http/http.dart' as http;

class ProductsItem extends StatefulWidget {
  const ProductsItem({ Key? key }) : super(key: key);

  @override
  _ProductsItemState createState() => _ProductsItemState();
}

class _ProductsItemState extends State<ProductsItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].body),
                    contentPadding: EdgeInsets.only(bottom: 20.0),
                  ),
                );
              }
            },
          ),
        ),
      
    );
  }
}

 Future<List<Products>> getRequest() async {
    //replace your restFull API here.
    String url = "https://fakestoreapi.com/products";
    final response = await http.get(Uri.parse(url));
  
    var responseData = jsonDecode(response.body);
    List<Products> products = [];
    for (var singleUser in responseData) {
      Products productList = Products(
        id: singleUser['id'],
        title: singleUser['title'],
        price: singleUser['price'],
        description: singleUser['description'],
        category: singleUser['category'],
        image: singleUser['image']

       );
         
  
      //Adding user to the list.
      products.add(productList);
    }
    return products;
  }