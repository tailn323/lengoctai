import 'package:flutter/material.dart';
import 'package:shopqua_app/view/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String  text ;
  final Function  onPressed ;

  CustomButton({this.text,this.onPressed, Null Function() onPress});

  @override
  Widget build(BuildContext context) {
    return TextButton(

      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
      onPressed: onPressed,
      child: CustomText(
        text: text,
        alignment: Alignment.center,
      ),
    );
  }
}
