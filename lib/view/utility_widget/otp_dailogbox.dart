import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../utility/color_theems.dart';

class OTPDialog extends StatefulWidget {
  @override
  _OTPDialogState createState() => _OTPDialogState();
}

class _OTPDialogState extends State<OTPDialog> {
  TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return
      CupertinoAlertDialog(
        title: UtilityWidgets.MainText("ENTER OTP",
            size: 12.sp, color: AppColors.textColor),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: UtilityWidgets.MainText("Resend",
                size: 10.sp, color: AppColors.titleText),
          ),
          CupertinoDialogAction(
              onPressed: () {
               Navigator.pop(context);
              },
              child: UtilityWidgets.MainText("Ok",
                  size: 10.sp, color: AppColors.secondaryColor)),
        ],
        content: Column(
          children: [
            UtilityWidgets.MainText("Enter otp send on your registered mobile",
                size: 10.sp, color: AppColors.noteHintColor),
            boxHeight(5),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'OTP',
              ),
            ),
          ],
        ),
      );



  }
}

