
import 'package:firebaseecom/constant/colors.dart';
import 'package:firebaseecom/controller/pages/product_deatails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductDeatails extends StatelessWidget {
  const ProductDeatails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDeatailsController controller =Get.put(ProductDeatailsController());
    return GetBuilder<ProductDeatailsController>(builder: (controller){
      return Scaffold(
      backgroundColor: AppColor.grey,
      body:  Container(
        padding: EdgeInsets.only(top: 50),
      child: ListView(
        children: [
         Center(child: Image.network(controller.Product["imageLink"],height: 250,),),
          Container(
           
            child: Container(
            padding: EdgeInsets.only(top: 20,right: 20,left: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
              Text(controller.Product["productName"],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              controller.Product["discount"]==0?Text(controller.Product["price"].toString(),style: TextStyle(color: Colors.redAccent,fontSize: 23,fontWeight: FontWeight.bold),):Text("${(controller.Product["price"]-controller.Product["discount"]).toString()}",style: TextStyle(color: Colors.redAccent,fontSize: 23,fontWeight: FontWeight.bold),)],)
             ,SizedBox(height: 20,),
             Text("Deatails:",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
             SizedBox(height: 10,),
             Text(controller.Product["desc"]),
             SizedBox(height: 30,),
            TextFormField(
              validator: (value) {
                if(value!.isEmpty ){
                  return "this is empty";
                }
              },
              controller: controller.countOrderItem,
                keyboardType: TextInputType.number,
                
              
              decoration: InputDecoration(
            hintText: "Enter Your count",
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text("Count")),
            
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
                
            ),SizedBox(height: 30,),


             InkWell(
              onTap: (){
                controller.addToCard();
              },
              child: Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              color: Colors.redAccent
              ),
              child: Center(
                child: Text("Buy Now",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
              ),
             ),
              SizedBox(height: 40,)
              ],
            )
           
          )),
        ],
      ),
    ),
    );
    });
  }
}