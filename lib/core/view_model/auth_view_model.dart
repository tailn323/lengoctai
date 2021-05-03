import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopqua_app/core/service/firestore_user.dart';
import 'package:shopqua_app/model/user_model.dart';
import 'package:shopqua_app/view/home_view.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth  _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();

  String email , password , name ;

 Rx<User> _user = Rx<User>();

 String get user=> _user.value?.email;

  @override
  void onInit() {
    // TODO: implement $configureLifeCycle
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement $configureLifeCycle
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement $configureLifeCycle
    super.onClose();
  }

  void  googleSignMethod()async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication  googleSignInAuthentication =
    await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) async{
      saveUser(user);
      Get.offAll(HomeView());
    });
  }

  void facebookSignInMethod() async{
   FacebookLoginResult result = await _facebookLogin.logIn(['email']);

   final  accessToken = result.accessToken.token;

   if(result.status == FacebookLoginStatus.loggedIn){
     final  faceCredential = FacebookAuthProvider.credential(accessToken);

     await  _auth.signInWithCredential(faceCredential).then((user) async{
       saveUser(user);
     });
   }
  }
  void  signInWithEmailAndPassword() async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeView());
    }catch(e){
      print(e.message);

      Get.snackbar('Loi Dang Nhap', e.message , colorText: Colors.black ,
      snackPosition: SnackPosition.BOTTOM );
    }
  }
  void  createAccountWithEmailAndPassword() async{
    try{
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
             saveUser(user);

      });

      Get.offAll(HomeView());
    }catch(e){
      print(e.message);

      Get.snackbar('Loi Dang Nhap', e.message , colorText: Colors.black ,
          snackPosition: SnackPosition.BOTTOM );
    }
  }
  void saveUser(UserCredential user) async{
    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: name == null ? user.user.displayName : name,
      pic: '',
    ));
  }
}
