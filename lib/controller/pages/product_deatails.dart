
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDeatailsController extends GetxController{

  var Product=Get.arguments[0];
  late int price;
  
  TextEditingController countOrderItem=TextEditingController();
  late CollectionReference cardItem;

  addToCard()async{
      Map<String,dynamic>card={
      "email":FirebaseAuth.instance.currentUser!.email, 
      "productName":Product["productName"],
      "productNameAr":Product["productNameAr"],
      "countOrder":int.parse(countOrderItem.text),
      "price":Product["discount"]==0?Product["price"].toString():(Product["price"]-Product["discount"]).toString(),
      "imageLink":Product["imageLink"],
      "finsh":false
    };
    await cardItem.add(card);
    Get.offAndToNamed(AppRout.home);
  }
  

    @override
  void onInit()async {
    cardItem=FirebaseFirestore.instance.collection("card");
    super.onInit();
  
  }

  @override
  void onClose() {
    super.onClose();
    
  }
}