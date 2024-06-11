import 'package:firebaseecom/controller/pages/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    CardController controller =Get.put(CardController());
    return Scaffold(
      backgroundColor:Color(0xf2f2f2f2),
      appBar: AppBar(
        title: Text("My Card",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: GetBuilder<CardController>(
          builder:(controller){
            return ListView.builder(
        itemCount:controller.cardItems.length ,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
            ),
            padding: EdgeInsets.all(15),
            child:  Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.cardItems[index]["productName"],style: TextStyle(fontSize: 25),),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Image.network(controller.cardItems[index]["imageLink"]),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Count: ${controller.cardItems[index]["countOrder"].toString()}",style: TextStyle(fontSize: 20),),
                 Text("Price: ${controller.cardItems[index]["price"].toString()}",style: TextStyle(fontSize: 20),)
                ],
              )
            ],
          )
,);
        });
          } ,)),
    );
  }
}