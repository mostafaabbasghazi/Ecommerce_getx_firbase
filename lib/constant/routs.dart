
import 'package:firebaseecom/admin/add_cat.dart';

import 'package:firebaseecom/admin/login.dart';
import 'package:firebaseecom/constant/middleware.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/screens/auth/login.dart';
import 'package:firebaseecom/screens/auth/signup.dart';


import 'package:firebaseecom/screens/onboardind.dart';
import 'package:firebaseecom/screens/product_deatails.dart';
import 'package:firebaseecom/screens/seeall_discount.dart';
import 'package:firebaseecom/screens/widget/bottomnavigationbar.dart';
import 'package:get/get.dart';

import '../admin/add_product.dart';


List<GetPage<dynamic>> rout=[
  GetPage(name: "/", page: ()=>const Onboardind(),middlewares: [MyMiddleWare()]),
  GetPage(name: AppRout.home, page: ()=>const Bottomnavigationbar()),
  GetPage(name: AppRout.seeAllDiscount, page: ()=>const SeeallDiscount()),
  GetPage(name: AppRout.productDeatails, page: ()=>const ProductDeatails()),

  GetPage(name: AppRout.login, page: ()=>const Login()),
  GetPage(name: AppRout.signUp, page: ()=>const SignUp()),

  GetPage(name: AppRout.adminLogin, page: ()=>const AdminLogin()),
  GetPage(name: AppRout.addCategory, page: ()=>const AddCat()),
  GetPage(name: AppRout.addProduct, page: ()=>const AddProduct()),



];