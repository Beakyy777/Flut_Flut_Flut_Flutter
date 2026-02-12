import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foo_wears/pages/login_page.dart';
import '../controller/auth_controller.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final signupFormKey = GlobalKey<FormState>();
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
          title:  Text("Sign Up",style: TextStyle(color: Colors.white,
      fontWeight: FontWeight.bold,
      ),), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: signupFormKey,
          child: Column(
            children: [
              const SizedBox(height: 30),


              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? "Name required" : null,
              ),

              const SizedBox(height: 10),


              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email required";
                  }
                  if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$')
                      .hasMatch(value)) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),


              Obx(() => TextFormField(
                controller: controller.passwordController,
                obscureText: controller.isPasswordHidden.value,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: controller.togglePassword,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password required";
                  }
                  if (value.length < 6) {
                    return "Minimum 6 characters";
                  }
                  return null;
                },
              )),

              const SizedBox(height: 10),


              Obx(() => TextFormField(
                controller: controller.confirmPasswordController,
                obscureText:
                controller.isConfirmPasswordHidden.value,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmPasswordHidden.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed:
                    controller.toggleConfirmPassword,
                  ),
                ),
                validator: (value) {
                  if (value != controller.passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              )),

              const SizedBox(height: 30),
          InkWell(
            onTap: (){
              if(signupFormKey.currentState!.validate()){
                print("Signup Success!!");
                controller.emailController.clear();
                controller.passwordController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("Signed in Successfully")),);
                Get.off(() => LoginPage());
              }
            },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text("Sign up", style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ),
              ),),

            SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: TextStyle(
                    fontSize: 16,

                  ),),
                  TextButton(onPressed: (){
                    Get.to(() => LoginPage());
                  }, child: Text("Login",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),),
                  )
                ],)
            ],
          ),
        ),
      ),
    );
  }
}
