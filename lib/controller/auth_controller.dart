import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {


  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPassword() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }


  void login() {
    if (loginFormKey.currentState!.validate()) {
      Get.snackbar(
        "Success",
        "Login Validation Successful!",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  void signup() {
    if (signupFormKey.currentState!.validate()) {
      Get.snackbar(
        "Success",
        "Signup Validation Successful!",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
