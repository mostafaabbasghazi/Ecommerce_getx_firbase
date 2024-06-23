
import 'package:firebaseecom/admin/category/add_cat.dart';
import 'package:firebaseecom/admin/category/show_category.dart';
import 'package:firebaseecom/admin/home.dart';

import 'package:firebaseecom/admin/login.dart';
import 'package:firebaseecom/admin/product/show_product.dart';
import 'package:firebaseecom/constant/middleware.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/screens/auth/forget_password.dart';
import 'package:firebaseecom/screens/auth/login.dart';
import 'package:firebaseecom/screens/auth/signup.dart';


import 'package:firebaseecom/screens/onboardind.dart';
import 'package:firebaseecom/screens/payment.dart';
import 'package:firebaseecom/screens/product_deatails.dart';
import 'package:firebaseecom/screens/seeall_discount.dart';
import 'package:firebaseecom/screens/widget/bottomnavigationbar.dart';
import 'package:get/get.dart';

import '../admin/product/add_product.dart';


List<GetPage<dynamic>> rout=[
  //genral
  GetPage(name: "/", page: ()=>const Onboardind(),middlewares: [MyMiddleWare()]),
  GetPage(name: AppRout.home, page: ()=>const Bottomnavigationbar()),
  GetPage(name: AppRout.seeAllDiscount, page: ()=>const SeeallDiscount()),
  GetPage(name: AppRout.productDeatails, page: ()=>const ProductDeatails()),
//auth
  GetPage(name: AppRout.login, page: ()=>const Login()),
  GetPage(name: AppRout.signUp, page: ()=>const SignUp()),
  GetPage(name: AppRout.forgetPassword, page: ()=>const ForgetPassword()),
//admin
  GetPage(name: AppRout.adminLogin, page: ()=>const AdminLogin()),
  GetPage(name: AppRout.addCategory, page: ()=>const AddCat()),
  GetPage(name: AppRout.addProduct, page: ()=>const AddProduct()),
  GetPage(name: AppRout.checkOutPage, page: ()=>const CheckoutPage()),
  GetPage(name: AppRout.show_category, page: ()=>const ShowCategory()),
  GetPage(name: AppRout.show_products, page: ()=>const ShowProduct()),
  GetPage(name: AppRout.adminhome, page: ()=>const AdminHome())



];