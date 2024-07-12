import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/utility/app_constant.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:investocafe_flutter/view/auth_module/login_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../utility_widget/utility_widgets.dart';
import '../Home/bottom.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController pinCtr = TextEditingController();
  TextEditingController line1Ctr = TextEditingController();
  TextEditingController line2Ctr = TextEditingController();
  TextEditingController cityCtr = TextEditingController();
  TextEditingController stateCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomBarScreen(),
                  ));
            },
            child: Image.asset(
              "assets/images/arrow-narrow-left (1).png",
              scale: 2,
              color: AppColors.backGroundColor,
            )),
        title: Text("Address Page",
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: "Manrope-Bold",
                color: AppColors.backGroundColor)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: 3.w,
            right: 3.w,
            top: 2.h,
          ),
          padding: EdgeInsets.only(left: 3.w,right: 3.w),
          decoration: BoxDecoration(
            color: AppColors.backGroundColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.textFieldHintText
                    .withOpacity(0.5), //color of shadow
                spreadRadius: 2, //spread radius
                blurRadius: 7, // blur radius
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
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
                    UtilityWidgets.MainText("Pin Code *",
                        size: 12.sp, color: AppColors.textColor),
                    boxHeight(5),
                    UtilityWidgets.inputField(
                        controller: pinCtr,
                        hintTxt: "Enter Pin Code",
                        inputType: TextInputType.number,
                        hrMargin: 0.0,
                        size: size),
                    boxHeight(12),
                    UtilityWidgets.MainText("Address Line1 * ",
                        size: 12.sp, color: notifier.textColor),
                    boxHeight(5),
                    UtilityWidgets.inputField(
                        controller: line1Ctr,
                        hintTxt: "Enter Address Line1",
                        inputType: TextInputType.name,
                        hrMargin: 0.0,
                        size: size),
                    boxHeight(12),
                    UtilityWidgets.MainText("Address Line2",
                        size: 12.sp, color: notifier.textColor),
                    boxHeight(5),
                    UtilityWidgets.inputField(
                        controller: line2Ctr,
                        hintTxt: "Enter Address Line2",
                        inputType: TextInputType.name,
                        hrMargin: 0.0,
                        size: size),
          
                    boxHeight(12),
                    UtilityWidgets.MainText("City *",
                        size: 12.sp, color: notifier.textColor),
                    boxHeight(5),
                    UtilityWidgets.inputField(
                        controller: cityCtr,
                        hintTxt: "Enter Your City",
                        inputType: TextInputType.name,
                        hrMargin: 0.0,
                        size: size),
                    boxHeight(12),
                    UtilityWidgets.MainText("State *",
                        size: 12.sp, color: notifier.textColor),
                    boxHeight(5),
                    UtilityWidgets.inputField(
                        controller: stateCtr,
                        hintTxt: "Enter Your State",
                        inputType: TextInputType.name,
                        hrMargin: 0.0,
                        size: size),
                    boxHeight(30),
          
                    CustomButton.button("Save",callBack: (){
                      goNextScreen(to: SignIn(),side: PageTransitionType.leftToRight);
                    }),
                    boxHeight(150),
          
                  ]),
            ),
          )),
        ),
      ),
    );
  }
}
