
import 'package:flutter/material.dart';
import 'package:investocafe_flutter/utility/app_constant.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_deva/responsive_deva.dart';

class MyDialogBox {
  static progressDialogue() {
    //set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        child: Center(
          child: LoadingAnimationWidget.discreteCircle(
            // leftDotColor: MyColor.primary,
            // rightDotColor: MyColor.secondary,
            size: 50.sp, color: AppColors.primaryColor,
          ),
        ),
      ),
    );
    return showDialog(
      //prevent outside touch
      barrierDismissible: false,
      context: navigatorKey!.currentState!.context,
      builder: (BuildContext context) {
        //prevent Back button press
        return alert;
        // return WillPopScope(onWillPop: () async => false, child: alert);
      },
    );
  }

  static close() {
    navigatorKey!.currentState!.pop();
  }

  static Future<dynamic> MyBottomSheet(
      {required String image,
      required bool isClose,
      required Function callBack,
      title,
      description,
      double? height}) {
    return showModalBottomSheet(
      context: navigatorKey!.currentState!.context,
      builder: (context) {
        return Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          // "assets/images/13.png",
                          // fit: BoxFit.cover,
                          image,
                          height: getHeight(height ?? 140),
                          width: 129.5.sp,
                        ),
                      ),
                      boxHeight(32),
                      Text(
                        title ?? "",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF444444),
                          height: 1.2,
                        ),
                      ),
                      boxHeight(24),
                      Text(
                        description ?? "",
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7C7C7C),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isClose)
              Positioned(
                top: 10,
                right: 10,
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.grey,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    iconSize: 20,
                    color: Colors.black45,
                    onPressed: () {
                      // Navigator.pop(context);
                      callBack();

                      // }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const SignIn(),
                      //     ));
                    },
                  ),
                ),
              )
          ],
        );
      },
    );
  }

  static AlertDialog customAlertDialog(
      { required final String title,
        final String? userName,
      final String? positiveBtnText,
      final String? negativeBtnText,
      required final Function onSuccess}) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            ElevatedButton(
              onPressed: () {
                navigatorKey!.currentState!.pop();

              },
              // icon of the button
              child: Icon(Icons.cancel_rounded, color: Colors.red),
              // styling the button
              style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              // Button color
              backgroundColor: AppColors.backGroundColor,
              // Splash color
              foregroundColor: Colors.cyan,
              ),
              ),
              ]

          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UtilityWidgets.MainText(
                  userName??"",
                  size: 14.sp,
                  color: AppColors.primaryColor,
                  textAlign: TextAlign.center,

                ),
                boxHeight(5),
                UtilityWidgets.MainText(
                  title,
                  size: 9.sp,
                  color: AppColors.titleText,
                   textAlign: TextAlign.center,

                ),
              ],
            ),
          ),
          boxHeight(15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
                child: TextButton(
                    onPressed: () {
                      navigatorKey!.currentState!.pop();

                    },
                    child: Text("NO",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          fontFamily: "Manrope-Bold",
                          color: AppColors.backGroundColor),

                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
                child: TextButton(
                    onPressed: () {
                      onSuccess();
                    },
                    child: Text("YES",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          fontFamily: "Manrope-Bold",
                          color: AppColors.backGroundColor),

                    )),
              ),
            ],
          )
        ],
      ),
    );
  }

  static alertDialog({String? title, required Function onSuccess}) {
    //set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      contentPadding: const EdgeInsets.all(5),
      title: Text(
        title ?? "title",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        // Text("action", style: TextStyle(color: Colors.black),),
        // Text("action", style: TextStyle(color: Colors.black),),
        ElevatedButton(
            onPressed: () => navigatorKey!.currentState!.pop(),
            child: const Text(
              "No",
              style: TextStyle(color: Colors.black),
            )),
        ElevatedButton(
            onPressed: () {
              navigatorKey!.currentState!.pop();
              onSuccess();
            },
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.black),
            ))
      ],
    );
    return showDialog(
      //prevent outside touch
      barrierDismissible: false,
      context: navigatorKey!.currentState!.context,
      builder: (BuildContext context) {
        //prevent Back button press
        return alert;
        // return WillPopScope(onWillPop: () async => false, child: alert);
      },
    );
  }
}
