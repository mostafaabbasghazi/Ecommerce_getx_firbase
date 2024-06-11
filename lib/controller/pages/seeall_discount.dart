import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SeeallDiscountController extends GetxController{

  List<Map<String,dynamic>> productsDiscount=[];


    @override
  void onInit()async {
    super.onInit();
   await getItemsDiscount();
   
  }

  @override
  void onClose() {
    super.onClose();
   
    
  }





 

  Future getItemsDiscount()async{
        try {
      await FirebaseFirestore.instance.collection("products").where("discount",isGreaterThanOrEqualTo: 1 ).limit(3).get().then((value){
        value.docs.forEach((result)async{
         productsDiscount.add(result.data()); 
        });
      });
      update();


    } catch (e) {
      
    }

  }
}