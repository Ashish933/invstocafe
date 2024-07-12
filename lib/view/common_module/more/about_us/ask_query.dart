import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:investocafe_flutter/view/common_module/Home/More.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';


import '../../../../utility/app_constant.dart';
import '../../../utility_widget/utility_widgets.dart';



class AskQuery extends StatefulWidget {
  const AskQuery({super.key});

  @override
  State<AskQuery> createState() => _AskQueryState();
}

class _AskQueryState extends State<AskQuery> {
  TextEditingController fName = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController queryCtr = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText("Ask A Query",
            size: 14.sp, color: AppColors.backGroundColor),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
                height:getHeight(1000),
              margin: EdgeInsets.only(
                left: 1.w,
                right: 1.w,
                top: 2.h,
              ),
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 1, //spread radius
                    blurRadius: 7, // blur radius
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 60.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    AppConstants.Height(10),
                    UtilityWidgets.inputField(
                      controller: fName,
                      hintTxt: "Enter Name",
                      isFieldValid: true,
                      inputType: TextInputType.text,
                      hrMargin: 0.0,
                      size: size,
                    ),
                    AppConstants.Height(15),
                    UtilityWidgets.inputField(
                      controller: emailCtr,
                      hintTxt: "Enter Email Id",
                      isFieldValid: true,
                      inputType: TextInputType.text,
                      hrMargin: 0.0,
                      size: size,
                    ),

                    AppConstants.Height(15),
                UtilityWidgets.queryInputField(
                  controller: queryCtr,
                      hintTxt: "Enter Query OR FeedBack",
                      isFieldValid: true,
                      inputType: TextInputType.text,
                      hrMargin: 0.0,
                      maxLines: 5,
                      size: size,
                    ),

                    AppConstants.Height(30),
                    CustomButton.button("SUBMIT",callBack: (){
                      goNextScreen(to: const MorePage(),side: PageTransitionType.rightToLeft);

                    }),









                  ],
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
