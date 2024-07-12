// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:investocafe_flutter/view/auth_module/forgat_otp_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../utility/app_constant.dart';
import '../../utility/color_theems.dart';
import '../../utility/colors_widget.dart';
import '../utility_widget/custom_button.dart';



class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {

  ColorNotifire notifier = ColorNotifire();

  TextEditingController emailCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close,color:AppColors.secondaryColor,size: 25,)),
      ),

      body: SingleChildScrollView(
        child:
        AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration:  const Duration(milliseconds: 575),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 60.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  AppConstants.Height(50),
                  UtilityWidgets.MainText("Forgot Password"),
                  boxHeight(10),
                  Text(
                    "Please enter your email ID to continue",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xFF7C7C7C),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  boxHeight(40),
                  UtilityWidgets.inputField(
                    controller: emailCtr,
                    inputType: TextInputType.text,
                    hintTxt: "Enter your email address",
                    hrMargin: 0.0,
                    size: size,
                  ),

                  AppConstants.Height(50),

                  CustomButton.button("Submit", callBack: () {
                    goNextScreen(
                        to: const ForgetOtpScreen(),
                        side: PageTransitionType.rightToLeft);
                  }
                  ),

                ],
              ),


            ),
          ),

        ),
      ),



    );
  }


}
