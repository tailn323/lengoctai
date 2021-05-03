import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final Function onPress;

  CustomButtonSocial({this.text, this.imageName, this.onPress});

  @override
  Widget build(BuildContext context) {
    return  OutlinedButton(
      style: OutlinedButton.styleFrom(
          elevation: 6,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20))),
      child: Row(
        children: [
          Image.asset(imageName),
          Text(text),
        ],
      ),
      onPressed: onPress,
    );
  }
}
