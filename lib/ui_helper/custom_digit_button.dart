

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundButtons extends StatelessWidget {
  FocusNode? focusNode;
  String title;
  VoidCallback onTap;
  //bool loading;
  Color? buttonColor = Colors.yellow;
  Color? buttontextColor = Colors.yellow;
  double? height, width, borderWidth;
  Color? borderColor;
  TextStyle? textstyle;
 
 

  RoundButtons({
    super.key,
    this.focusNode,
    required this.title,
    this.borderColor,
    this.borderWidth,
    this.buttonColor,
    this.buttontextColor,
     this.height,
    required this.onTap,
  //  required this.loading,
    this.textstyle,
    this.width,
  });
  
  get h => null;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      focusNode: focusNode,
      child: Container(
          height: height ?? 65,
          width: width ?? 74,
          decoration: BoxDecoration(
            color: buttonColor ,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 244, 235, 235).withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
            // border: borderColor != null
            //     ? Border.all(color: borderColor!, width: borderWidth ?? 0)
            //     : Border.all(),
          ),
          child: Center(
            child: Text(
                    title,
                    style: textstyle ??
                        TextStyle(
                            color: buttontextColor,
                            fontSize: 26,
                            fontWeight: FontWeight.w700),
                  ),
          )
          ),
    );
  }
}
