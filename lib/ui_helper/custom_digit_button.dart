import 'package:basic_calculator/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundButtons extends StatefulWidget {
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

  @override
  State<RoundButtons> createState() => _RoundButtonsState();
}

class _RoundButtonsState extends State<RoundButtons> {
  get h => null;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: widget.buttonColor,
      child: InkWell(
        onTap: () async {
          final tmp = widget.buttonColor;
          // widget.buttonColor = Colors.black;
          // setState(() {});
          widget.onTap();
          await Future.delayed(const Duration(seconds: 1));
          widget.buttonColor = tmp;
          // setState(() { });
        },
        focusNode: widget.focusNode,
        child: Container(
            height: widget.height ?? 65,
            width: widget.width ?? 74,
            decoration: BoxDecoration(
              color: widget.buttonColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.2),
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
                widget.title,
                style: widget.textstyle ??
                    TextStyle(
                        color: widget.buttontextColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
              ),
            )),
      ),
    );
  }
}
