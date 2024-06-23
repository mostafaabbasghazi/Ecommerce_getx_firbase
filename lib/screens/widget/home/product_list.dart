import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseecom/controller/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cat_products.dart';
import '../../product_deatails.dart';

class Products extends GetView<HomeController> {
  const Products({super.key});

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
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.productsDiscount.length,
                itemBuilder: (context,index){
               
              
                    return  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(right: 20,bottom: 40),
                    decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Image.network(controller.productsDiscount[index]["imageLink"],height: 120,width: 120,),
                        Text(controller.productsDiscount[index]["productName"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text("\$ ${(int.parse(controller.productsDiscount[index]["price"])-controller.productsDiscount[index]["discount"]).toString()}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        Row(
                          
                          children: [
                            Text.rich(TextSpan(children: <TextSpan>[
                              new TextSpan(text: 
                                "\$ ${controller.productsDiscount[index]["price"].toString()}",style: TextStyle(fontSize: 17,color: Colors.redAccent,decoration: TextDecoration.lineThrough,)
                              )
                            ])),
                            SizedBox(width: 40,),
                           InkWell(
                            onTap: (){
                              Get.to(()=>ProductDeatails(),arguments:[controller.productsDiscount[index] ]);
                            },
                            child:  Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(8)),
                              child: Icon(Icons.add,size: 25,color: Colors.white,),
                            ),
                           )
                          ],
                        ),
                        
                      ],
                    ),
                  );
                  
                },);
                               

                      }
                      return Text("");

       });
  }
}