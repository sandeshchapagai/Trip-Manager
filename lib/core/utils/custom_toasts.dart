import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../app/constants/colors.dart';

errorToast({required String msg}) {
  CustomToasts.showToast(msg: msg, color: AppColors.kERROR);
}

successToast({required String? msg}) {
  CustomToasts.showToast(msg: msg ?? "", color: AppColors.kDARKGREEN);
}

class CustomToasts {
  static void showToast({
    required String msg,
    Color? color = Colors.green,
  }) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
