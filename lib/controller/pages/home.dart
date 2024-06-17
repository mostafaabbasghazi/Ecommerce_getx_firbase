import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  
  
  List<Map<String,dynamic>> productsDiscount=[];
  List<Map<String,dynamic>> searchItems=[];
  List<Map<String,dynamic>> category=[];
  String userName="Welcome";
  RxString userImage="https://images.app.goo.gl/tTESLKv1hkah7Nuj6".obs;



    @override
  void onInit()async {
    super.onInit();
    await getUserInfo();
    await getCategory();
    await getItemsDiscount();
   
  }

  @override
  void onClose() {
    super.onClose();
   
    
  }
  getCategory()async{
    var data =await FirebaseFirestore.instance.collection("categorey").get();
    data.docs.forEach((action){
      category.add(action.data());
      update();
    });
  
  }

  Future<void> getSearchItems(String producName)async{
    try {
      var search=await FirebaseFirestore.instance.collection("products").where("productName",isEqualTo:producName ).get();
      search.docs.forEach((action){
        searchItems.add(action.data());
        update();
      });
    } catch (e) {
      
    }
  }

  Future<void> getUserInfo()async{
    try {
      var userData =await FirebaseFirestore.instance.collection("users").get();
      userData.docs.forEach((action){
        userName=action.data()["name"].toString();
        userImage.value=action.data()["image"].toString();
        update();
      });
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