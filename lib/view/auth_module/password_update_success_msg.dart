import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:investocafe_flutter/view/auth_module/login_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../utility/app_constant.dart';
import '../../utility/color_theems.dart';
import '../utility_widget/utility_widgets.dart';

class PasswordUpdateMsgScreen extends StatefulWidget {
  const PasswordUpdateMsgScreen({super.key});

  @override
  State<PasswordUpdateMsgScreen> createState() => _PasswordUpdateMsgScreenState();
}

class _PasswordUpdateMsgScreenState extends State<PasswordUpdateMsgScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20,left: 15,right: 15),
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 500),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 60.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  AppConstants.Height(90),
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/password update.png"),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Password Updated!",
                    style: TextStyle(fontSize: 24, fontFamily: "Manrope-Bold",color: notifier.textColor),
                  ),
                  AppConstants.Height(10),
                  const Text(
                    "Your password has been set up\n successfully.",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Manrope-SemiBold",color: Color(0xff64748B)
                    ),
                  ),
                  AppConstants.Height(90),
                 CustomButton.button("Back to sign in",callBack: (){
                   goNextScreen(to: const SignIn(),side: PageTransitionType.rightToLeft);
                 }),

                  AppConstants.Height(20),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
