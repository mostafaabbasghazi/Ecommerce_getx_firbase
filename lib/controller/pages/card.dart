import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/servies/servies.dart';
import 'package:get/get.dart';

class CardController extends GetxController{
  List cardItems=[];

  @override
  void onInit()async {
    super.onInit();
     getCArdItems();

  }

  @override
  void onClose() {
    super.onClose();
   
  }
 
 getCArdItems()async{
   await FirebaseFirestore.instance.collection("card").where("email",isEqualTo: FirebaseAuth.instance.currentUser!.email ).get().then((value){
        value.docs.forEach((result)async{
          print(result.data());
         cardItems.add(result.data()); 
         print(cardItems);
        });
      });
      update();

 }

}