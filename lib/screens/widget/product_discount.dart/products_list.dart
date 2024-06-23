import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseecom/controller/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cat_products.dart';
import '../../product_deatails.dart';

class ProductsListDiscount extends GetView<HomeController> {
  const ProductsListDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection("products").where("discount",isGreaterThanOrEqualTo: 1 ).get(),
       builder: (BuildContext context,AsyncSnapshot <QuerySnapshot> snapshot){
         if (snapshot.hasError) {return Center(child:Text('Error Try Again') ,);}
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return  Center(child:CircularProgressIndicator(color: Colors.blue,));
                      }
                      if(snapshot.hasData){
                        
                          return  ListView.builder(
            
            itemBuilder: (context, index) =>  Container(
              height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    margin: EdgeInsets.only(right: 20,bottom: 40,left: 20),
                    decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                    child:InkWell(
                      onTap: (){
                        Get.to(()=>ProductDeatails(),arguments: [controller.productsDiscount[index]]);
                      },
                      child:  Column(
                      
                      children: [
                        Image.network(controller.productsDiscount[index]["imageLink"],height: 140,width: 140,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Text(controller.productsDiscount[index]["productName"],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          controller.productsDiscount[index]["discount"] !=0?Center(child: Text("\$ ${(int.parse(controller.productsDiscount[index]["price"])-controller.productsDiscount[index]["discount"]).toString()}",
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),)):Text("\$ ${controller.productsDiscount[index]["price"].toString()}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                        ],),
                       
                      ],
                    ),)
                  ),
            itemCount: controller.productsDiscount.length,
            );
          
                               

                      }
                      return Text("");

       });
  }
}