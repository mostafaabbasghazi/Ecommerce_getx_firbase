import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  List<Map<String,dynamic>> categeries=[];
  List<Map<String,dynamic>> productsDiscount=[];


    @override
  void onInit()async {
    super.onInit();
   await getCategory();
   await getItemsDiscount();
   
  }

  @override
  void onClose() {
    super.onClose();
   
    
  }





  Future getCategory()async{
    try {
      await FirebaseFirestore.instance.collection("categorey").get().then((value){
        value.docs.forEach((result)async{
          categeries.add(result.data());
        
        });
        print(categeries);
      });
      update();


    } catch (e) {
      
    }


  }

  Future getItemsDiscount()async{
        try {
      await FirebaseFirestore.instance.collection("products").where("discount",isGreaterThanOrEqualTo: 1 ).get().then((value){
        value.docs.forEach((result)async{
         productsDiscount.add(result.data()); 
        });
      });
      update();


    } catch (e) {
      
    }

  }
}