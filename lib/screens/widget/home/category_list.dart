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
                    padding: EdgeInsets.all( 20),
                    margin: EdgeInsets.only( top: 20,left: 20),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(controller.category[index]["imageLink"].toString(),height: 80,width:80,fit: BoxFit.cover,),
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