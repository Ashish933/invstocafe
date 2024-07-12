import 'package:flutter/material.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:responsive_deva/responsive_deva.dart';


class AlertNoResultFoundDialog extends StatelessWidget {
  const AlertNoResultFoundDialog({
    this.icon,
    this.title,
    this.message,
    this.actions = const [],
    Key? key,
  }) : super(key: key);

  final Widget? icon;
  final String? title;
  final String? message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 24.0), // Adjust vertical padding here

        icon: icon,
        title: title == null
            ? null
            : Text(
          title!,
          textAlign: TextAlign.center,
        ),
        titleTextStyle: TextStyle(
            color: AppColors.primaryColor, //as per your color
            fontSize: 14.sp,
            fontWeight: FontWeight.w600),
        content: message == null
            ? null
            : Container(
          width: MediaQuery.of(context).size.width * 0.9, // Adjust width as needed
          child: Text(
            message!,
            textAlign: TextAlign.center,
          ),
        ),
        contentTextStyle: TextStyle(
            color: AppColors.titleText, //as per your color
            fontSize: 10.sp,
            fontWeight: FontWeight.w400),
        actionsAlignment: MainAxisAlignment.center,
        actionsOverflowButtonSpacing: 8.0,
        actions: actions,
      );
  }  }


