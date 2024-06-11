import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/servies/servies.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController{
  MyServices myServices = Get.find();


  @override
  void onInit()async {
    super.onInit();

  }

  @override
  void onClose() {
    super.onClose();
   
  }
  goToLogin(){
    myServices.sharedPreferences.setString("step","1");
    Get.offNamed(AppRout.login);
  }


}