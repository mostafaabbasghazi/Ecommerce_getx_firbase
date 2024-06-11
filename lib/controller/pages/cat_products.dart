import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CatProductsController extends GetxController{
  List catproducts=[];
  String nameCat=Get.arguments[0];
  String nameCatAr=Get.arguments[1];


      @override
  void onInit()async {
    super.onInit();
    await getItemsCategory();
 
   
  }

  @override
  void onClose() {
    super.onClose();
   
    
  }
  

   Future getItemsCategory()async{
        try {
      await FirebaseFirestore.instance.collection("products").where("category",isEqualTo: nameCat ).get().then((value){
        value.docs.forEach((result)async{
         catproducts.add(result.data()); 
        });
      });
      update();


    } catch (e) {
      
    }

  }

}