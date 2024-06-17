import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseecom/controller/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cat_products.dart';

class Category extends GetView<HomeController> {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection("categorey").get(),
       builder: (BuildContext context,AsyncSnapshot <QuerySnapshot> snapshot){
         if (snapshot.hasError) {return Center(child:Text('Error Try Again') ,);}
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return  Center(child:CircularProgressIndicator(color: Colors.blue,));
                      }
                      if(snapshot.hasData){
                        
                          return ListView.builder(
                    scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(right: 20,top: 20),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(controller.category[index]["imageLink"].toString(),height: 50,fit: BoxFit.cover,),
                        InkWell(
                          onTap: (){
                            Get.to(()=>CatProducts(),arguments: [
                              controller.category[index]["categorytName"].toString(),
                              controller.category[index]["categorytNameAr"].toString(),
                      ]);
                          },
                          child: Icon(Icons.arrow_circle_right),
                        )
                      ],
                    ),
                  );
                });
                               

                      }
                      return Text("");

       });
  }
}