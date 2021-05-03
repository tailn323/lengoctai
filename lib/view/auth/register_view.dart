import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:shopqua_app/core/view_model/auth_view_model.dart';
import 'package:shopqua_app/view/auth/login_view.dart';
import 'package:shopqua_app/view/widgets/custom_button.dart';
import 'package:shopqua_app/view/widgets/custom_button_social.dart';
import 'package:shopqua_app/view/widgets/custom_text.dart';
import 'package:shopqua_app/view/widgets/custom_text_form_field.dart';

import '../../constance.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email , password ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginView());
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black)),
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
              CustomText(
                 text: "ĐĂNG KÝ,",
                fontSize: 30,
             ),

              SizedBox(height: 30,),
              CustomTextFormField(
                text: 'Name',
                hint: 'NgocTai',
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

              SizedBox(height: 30,),
              CustomButton(
                onPressed: () {
                  _formKey.currentState.save();
                  if(_formKey.currentState.validate()){
                    controller.createAccountWithEmailAndPassword();
                  }

                },
                text: 'ĐĂNG KÝ',
              ),

            ],
          ),
        ),
      ),
    );
  }
}

