import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ShowCategoryController extends GetxController{
  List categorey=[];
  List products=[];
  List docId=[];

    @override
  void onInit()async {
    super.onInit();
    await getProduct();
  }


  
  getProduct()async{
    var data =await FirebaseFirestore.instance.collection("categorey").get().then((onValue){
       for (var snapshot in onValue.docs) {
          docId.add(snapshot.id);
        }
      onValue.docs.forEach((action){
        categorey.add(action.data());
        update();
      });
    });
  }
   getProductToDelete(String catName)async{
    var data =await FirebaseFirestore.instance.collection("products").where("category",isEqualTo: catName).get();
     for (var doc in data.docs) {
     await doc.reference.delete();
  }
     
  }
}