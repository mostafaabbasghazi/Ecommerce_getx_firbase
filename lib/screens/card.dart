
import 'package:firebaseecom/constant/colors.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/controller/pages/card.dart';
import 'package:firebaseecom/screens/widget/bottomnavigationbar.dart';
import 'package:firebaseecom/screens/widget/card/custtom_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    CardController controllerr =Get.put(CardController());
    
    return  GetBuilder<CardController>(builder: (controller){
      return Scaffold(
      backgroundColor:AppColor.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
        
               Text("Total : (${controller.total.toString()}) ",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
    
         InkWell(
          onTap: () {
            Get.offAndToNamed(AppRout.checkOutPage);
          },
          
          child: Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(30)
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            child: Text("pay",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white),),
          ),
        
         ) ],),
        )
      ),
      body:Container(
        margin: EdgeInsets.all(30),
        child: GetBuilder<CardController>(
          builder:(controller){
            return ListView.builder(
        itemCount:controller.cardItems.length ,
        itemBuilder: (context,index){
          return CustomItemsCartList(
            name: controller.cardItems[index]["productName"],
           price: (int.parse(controller.cardItems[index]["price"]) * controller.cardItems[index]["countOrder"]).toString(),
           count: controller.cardItems[index]["countOrder"].toString(),
            imagename: controller.cardItems[index]["imageLink"],
            onRemove: controller.deleteItem(controller.docId[index]));
        });
          } ,)),
    );
    });
  }
}
