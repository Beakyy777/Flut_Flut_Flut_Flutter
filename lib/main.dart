import 'package:flutter/material.dart';
import 'package:foo_wears/controller/auth_controller.dart';
import 'package:foo_wears/login_page.dart';
import 'package:get/get.dart';

void main() {;
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: 'Flutter Demo',

      home: LoginPage(

      ),
    );
  }
}




