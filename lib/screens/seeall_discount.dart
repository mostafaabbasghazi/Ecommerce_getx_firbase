import 'package:firebaseecom/controller/pages/seeall_discount.dart';
import 'package:firebaseecom/screens/product_deatails.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SeeallDiscount extends StatelessWidget {
  const SeeallDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    SeeallDiscountController controlle=Get.put(SeeallDiscountController());
    return Scaffold(
      backgroundColor: Color(0xf2f2f2f2),
      appBar: AppBar(
        title: Text("Discounts",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
        backgroundColor:Color(0xf2f2f2f2),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child:GetBuilder<SeeallDiscountController>(
          builder: (controller) {
            return 
          ListView.builder(
            
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
                          controller.productsDiscount[index]["discount"] !=0?Center(child: Text("\$ ${(controller.productsDiscount[index]["price"]-controller.productsDiscount[index]["discount"]).toString()}",
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),)):Text("\$ ${controller.productsDiscount[index]["price"].toString()}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                        ],),
                       
                      ],
                    ),)
                  ),
            itemCount: controller.productsDiscount.length,
            );


        
          },
        )
      ),
    );
  }
}