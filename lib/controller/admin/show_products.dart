import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ShowProductsController extends GetxController{
  List products=[];
  List docId=[];

    @override
  void onInit()async {
    super.onInit();
    await getProduct();
  }

  
  getProduct()async{
    var data =await FirebaseFirestore.instance.collection("products").get().then((onValue){
       for (var snapshot in onValue.docs) {
          docId.add(snapshot.id);
        }
      onValue.docs.forEach((action){
        products.add(action.data());
        update();
      });
    });
  }
}