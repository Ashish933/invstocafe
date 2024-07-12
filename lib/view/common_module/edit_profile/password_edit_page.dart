import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../utility_widget/custom_button.dart';
import '../../utility_widget/utility_widgets.dart';

class PasswordEditPage extends StatefulWidget {
  const PasswordEditPage({super.key});

  @override
  State<PasswordEditPage> createState() => _PasswordEditPageState();
}

class _PasswordEditPageState extends State<PasswordEditPage> {
  TextEditingController _currentPassCtr = TextEditingController();
  TextEditingController _newPassCtr = TextEditingController();
  TextEditingController _confirmPassCtr = TextEditingController();

  bool value1 = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: UtilityWidgets.MainText(
            "Edit Profile",
            size: 14.sp,
            color: AppColors.backGroundColor,
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(
              "assets/images/arrow-narrow-left (1).png",
              scale: 2.9,
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.secondaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            margin: EdgeInsets.only(
              left: 1.w,
              right: 1.w,
              top: 2.h,
            ),
            padding: EdgeInsets.only(left: 2.w, right: 2.w),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 7, // blur radius
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            child: SingleChildScrollView(
              child: AnimationLimiter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 500),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          boxHeight(20),
                          UtilityWidgets.inputField(
                            hintTxt: "Current Password",
                            controller: _currentPassCtr,
                            hrMargin: 0.0,
                            size: size,
                          ),
                          boxHeight(15),
                          UtilityWidgets.inputField(
                            hintTxt: "Enter New Password",
                            controller: _newPassCtr,
                            hrMargin: 0.0,
                            size: size,
                          ),
                          boxHeight(15),
                          UtilityWidgets.inputField(
                            hintTxt: "Enter Confirm Password",
                            controller: _confirmPassCtr,
                            hrMargin: 0.0,
                            size: size,
                          ),
                          boxHeight(15),
                          const Center(
                            child: Text(
                              "Password must contain atleast one number ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.noteHintColor,
                                  fontFamily: "Manrope-Medium"),
                            ),
                          ),
                          const Center(
                            child: Text(
                              "Password must contain atleast one letter ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.noteHintColor,
                                  fontFamily: "Manrope-Medium"),
                            ),
                          ),
                          const Center(
                            child: Text(
                              "Password must be atleast 6 characters ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.noteHintColor,
                                  fontFamily: "Manrope-Medium"),
                            ),
                          ),

                          boxHeight(70),
                          CustomButton.button("SUBMIT",
                            callBack: () {
                              Navigator.pop(context);

                            },

                          ),
                          boxHeight(250),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ));
  }


}
