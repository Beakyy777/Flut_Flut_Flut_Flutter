import 'package:flutter/material.dart';
import 'package:foo_wears/controller/auth_controller.dart';
import 'package:foo_wears/pages/signup_page.dart';
import 'package:get/get.dart';


class LoginPage extends StatelessWidget {
   LoginPage({super.key});
   final loginFormKey = GlobalKey<FormState>();
final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Form(
              key: loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset("",
        height: 300,
            width: 400,),
                SizedBox(height: 50),
                 TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Email";
                    }
                    bool emailValid = RegExp( r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                    if (!emailValid){
                      return "Enter Valid Email";
                    }
                  },
                ),

                  SizedBox(height: 10),
                  Obx(()=>TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
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
                    validator: (value){
                      if(value!.isEmpty){
                        return"Enter password";
                      }
                      else if( controller.passwordController.text.length <6){
                        return"Password Length Should be above 6 letters";
                      }
                    },
                  ),),
                  SizedBox(height: 60,),
                  InkWell(
                    onTap: (){
                      if(loginFormKey.currentState!.validate()){
                        print("Success!!");
                        controller.emailController.clear();
                        controller.passwordController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Logged in Successfully")),);
                        Get.to(() => ());
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text("Log In", style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                        fontSize: 20,
                        ),),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Need an account?", style: TextStyle(
                        fontSize: 16,

                      ),),
                      TextButton(onPressed: (){
                        Get.to(() => SignupPage());
                      }, child: Text("Sign Up",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),),
                      )
                    ],)

          ],),
        ),),
      ),
    );
  }
}
