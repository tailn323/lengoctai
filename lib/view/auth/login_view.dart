
import 'package:flutter/material.dart';
import 'package:shopqua_app/constance.dart';
import 'package:shopqua_app/core/view_model/auth_view_model.dart';
import 'package:shopqua_app/view/auth/register_view.dart';
import 'package:shopqua_app/view/widgets/custom_button.dart';
import 'package:shopqua_app/view/widgets/custom_button_social.dart';
import 'package:shopqua_app/view/widgets/custom_text.dart';
import 'package:shopqua_app/view/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email , password ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const  EdgeInsets.only(
        top: 20,
        right: 10,
        left: 10,
    ),
      child: Form(
         key: _formKey,
      child: Column(
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "Welcome", fontSize: 30,),
              GestureDetector(
                onTap: () {
                  Get.to(RegisterView());
                },
              child: CustomText(
                text: "Sign Up",
                color: primaryColor,
                fontSize: 18,
              )),
          ],
          ),
          SizedBox(height: 10,),
          CustomText(
            text: 'Sign in to Continue',
            fontSize: 14,
            color: Colors.grey,
          ),
          SizedBox(height: 30,),

          CustomTextFormField(
            text: 'Email',
            hint: 'nguyenvana@gmail.com',
            onSave: (value){
              controller.email = value;
            },
            validator: (value){
              if(value == null){
                print('Loi');
              }
            },
          ),

          SizedBox(height: 40,),

          CustomTextFormField(
            text: 'Password',
            hint: '*********',
            onSave: (value) {
              controller.password = value;
            },
            validator: (value) {
              if(value == null){
                print('Loi');
              }
            },
          ),
          SizedBox(height: 20,),
          CustomText(
            text: 'Forgot Password?',
            fontSize: 14,
            alignment: Alignment.topRight,
          ),
          SizedBox(height: 30,),
          CustomButton(
            onPressed: () {
              _formKey.currentState.save();
              if(_formKey.currentState.validate()){
                controller.signInWithEmailAndPassword();
              }

            },
            text: 'ĐĂNG NHẬP',
          ),
          CustomText(
            text: 'HOẶC',
            fontSize: 14,
            alignment: Alignment.center,
          ),
          SizedBox(height: 30,),
          CustomButtonSocial(

            text: 'Sign In with Google',
            imageName: 'assets/images/icon_Google.png',
            onPress: () {
              controller.googleSignMethod();
            },
          ),
          SizedBox(height: 30,),
          CustomButtonSocial(

            text: 'Sign In with Facebook',
            imageName: 'assets/images/icon_Facebook.png',
            onPress: () {
              controller.facebookSignInMethod();
            },
          ),
        ],
      ),
      ),
      ),
    );
  }
}
