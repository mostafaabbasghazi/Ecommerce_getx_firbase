import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final List products;
  const SearchResult({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,index) {
          return ListTile(
            title: Text("${products[index]["productName"]}"),
            subtitle: Text("${products[index]["category"]}"),
             leading:Text("data"),
             trailing:Text("data"),
          );
        },

      ) ,
    );
  }
}