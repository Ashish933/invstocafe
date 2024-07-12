
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:investocafe_flutter/view/auth_module/password_update_success_msg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../utility/app_constant.dart';
import '../../utility/colors_widget.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController newPassCtr = TextEditingController();
  TextEditingController conPassCtr = TextEditingController();

  ColorNotifire notifier = ColorNotifire();
  bool visiblePass = false;

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
            child: Icon(
              Icons.close,
              color: AppColors.secondaryColor,
              size: 25,
            )),
      ),

      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 500),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 60.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  boxHeight(50),
                  UtilityWidgets.MainText("Create New Password"),
                  boxHeight(10),
                  UtilityWidgets.MainText(
                    "Your new password must different from\nprevious password.",
                    color: AppColors.noteHintColor,
                    size: 12.sp,
                  ),
                  boxHeight(30),
                  UtilityWidgets.inputField(
                    controller: newPassCtr,
                    inputType: TextInputType.text,
                    hintTxt: "New Password",
                    hrMargin: 0.0,
                    size: size,
                  ),
                  boxHeight(30),
                  UtilityWidgets.inputField(
                    controller: conPassCtr,
                    inputType: TextInputType.text,
                    obscureText: visiblePass,
                    hintTxt: "Enter your Password",
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          visiblePass = !visiblePass;
                        });
                      },
                      child: Icon(
                        visiblePass
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                    hrMargin: 0.0,
                    size: size,
                  ),
                  boxHeight(50),
                  CustomButton.button("Reset Password",
                      callBack: (){
                        goNextScreen(to: const PasswordUpdateMsgScreen(),side: PageTransitionType.bottomToTop);
                      }
                  )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }



}
