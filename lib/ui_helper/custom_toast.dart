import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class CustomToast{
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }
}