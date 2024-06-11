import 'package:firebaseecom/controller/pages/onboarding.dart';
import 'package:flutter/material.dart';

class Onboardind extends StatelessWidget {
  const Onboardind({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController controller=OnboardingController();
    return  Scaffold(
      backgroundColor:const Color(0xffecefe0),
      body: Container(
        margin:const EdgeInsets.only(top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Image.asset("images/headphone.PNG"),
       const Padding(
          padding:  EdgeInsets.only(left: 20.0),
          child:  Text("Explor\nThe Best\nProduct",
          style: TextStyle(color: Color.fromARGB(255, 10, 1, 1),fontSize: 40.0,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 5.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           InkWell(
            onTap: (){
              controller.goToLogin();
            },
            child:  Container(
              margin: EdgeInsets.only(right: 20.0),
              padding:const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle
              ),
              child:const  Text("Next",
              style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
            ),)
          ],
        )

      ],),)
    );
  }
}