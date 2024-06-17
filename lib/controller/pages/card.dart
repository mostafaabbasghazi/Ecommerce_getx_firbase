import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class CardController extends GetxController{
  List cardItems=[];
  List docId=[];
  int total=0;
  
  
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
   await FirebaseFirestore.instance.collection("card").where("email",isEqualTo: FirebaseAuth.instance.currentUser!.email ).where("finsh",isEqualTo: false).get().then((value){
        for (var snapshot in value.docs) {
          docId.add(snapshot.id);
        }
        value.docs.forEach((result)async{
         
         cardItems.add(result.data());
         int price=int.parse(result.data()["price"]);
         int count =result.data()["countOrder"]; 
         total=total +(price*count);
         
        });
      });
      update();

 }
 deleteItem(String id)async{
   var collection = FirebaseFirestore.instance.collection('card');
   var querySnapshots = await collection.get();

   collection.doc(id).delete();
   return true;
 }



}