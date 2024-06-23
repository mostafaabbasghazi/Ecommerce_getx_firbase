
import 'package:firebaseecom/constant/colors.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/controller/pages/cat_products.dart';
import 'package:firebaseecom/screens/product_deatails.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CatProducts extends StatelessWidget {
  const CatProducts({super.key});

  @override
  Widget build(BuildContext context) {
    CatProductsController controlle=Get.put(CatProductsController());
    return GetBuilder<CatProductsController>(builder: (controller){
      return  Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(controlle.nameCat,style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
        
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child:GetBuilder<CatProductsController>(
          builder: (controller) {
            return Container(child: ListView.builder(
            
            itemBuilder: (context, index) =>  Container(
              height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    margin: EdgeInsets.only(right: 20,left: 20,bottom: 40),
                    decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                    child: InkWell(onTap: (){
                      Get.to(()=>ProductDeatails(),arguments: [controller.catproducts[index]]);
                    },
                      child: Column(
                      
                      children: [
                        Image.network(controller.catproducts[index]["imageLink"],height: 140,width: 140,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Text(controller.catproducts[index]["productName"],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          controller.catproducts[index]["discount"].toString() !=0?Center(child: Text("\$ ${(int.parse(controller.catproducts[index]["price"])-controller.catproducts[index]["discount"]).toString()}",
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),)):Text("\$ ${controller.catproducts[index]["price"].toString()}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                        ],),
                      
                      ],
                    ),
                    )
                  ),
            itemCount: controller.catproducts.length,
            ),);
          


        
          },
        )
      ),
    );
    });
  }
}