
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constant/routs.dart';
import 'firebase_options.dart';
import 'servies/servies.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:ThemeData(
           fontFamily: "PlayfairDisplay",
           textTheme: const TextTheme(
            ),
           primarySwatch: Colors.blue,
          ),
      //initialBinding: InitialBindings(),
      getPages:rout,
      
    );
  }
}

