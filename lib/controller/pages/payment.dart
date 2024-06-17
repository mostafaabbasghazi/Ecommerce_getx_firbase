import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/servies/servies.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{

  finshOrder()async{
  var collection =await FirebaseFirestore.instance.collection('card');
  var querySnapshots = await collection.where("email",isEqualTo:FirebaseAuth.instance.currentUser?.email).get();
  for (var doc in querySnapshots.docs) {
     await doc.reference.update({
    'finsh': true,
    });
  }

 }



  @override
  void onInit()async {
    super.onInit();

  }

  @override
  void onClose() {
    super.onClose();
   
  }



}