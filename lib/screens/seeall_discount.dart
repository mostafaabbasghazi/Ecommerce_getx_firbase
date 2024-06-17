
import 'package:firebaseecom/constant/colors.dart';
import 'package:firebaseecom/controller/pages/seeall_discount.dart';
import 'package:firebaseecom/screens/product_deatails.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'widget/product_discount.dart/products_list.dart';

class SeeallDiscount extends StatelessWidget {
  const SeeallDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    SeeallDiscountController controlle=Get.put(SeeallDiscountController());
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Discounts",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
      ),
      body:Container(
        margin: EdgeInsets.all(20),
        child:GetBuilder<SeeallDiscountController>(
          builder: (controller) {
            return  ProductsListDiscount();
         },
        )
      ),
    );
  }
}