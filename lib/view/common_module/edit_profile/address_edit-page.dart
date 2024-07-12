import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../utility/app_constant.dart';
import '../../utility_widget/custom_button.dart';
import '../../utility_widget/custom_dropdown.dart';
import '../../utility_widget/utility_widgets.dart';
import '../../auth_module/ragister_screen.dart';

class AddressEditPage extends StatefulWidget {
  const AddressEditPage({super.key});

  @override
  State<AddressEditPage> createState() => _NameEmailEditPageState();
}

class _NameEmailEditPageState extends State<AddressEditPage> {
  TextEditingController _pinCtr = TextEditingController();
  TextEditingController _addLine1Ctr = TextEditingController();
  TextEditingController _addLine2Ctr = TextEditingController();

  bool value1 = false;
  List<String> cityNames = [
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Kolkata",
    "Indore",
    "Bhopal",


    // Add more city names as needed
  ];

  List<String> stateNames = [
    "Maharashtra",
    "Karnataka",
    "Andra Pradesh",
    "Uttar Pradesh ",
    "Madhya Pradesh",
    "Best Bangal",
    "Himanchal Pradesh",
    "Tamilnadu",
    // Add more state names as needed
  ];
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
                            hintTxt: "Address Line1",
                            controller: _addLine1Ctr,
                            hrMargin: 0.0,
                            size: size,
                          ),
                          boxHeight(15),
                          UtilityWidgets.inputField(
                            hintTxt: "Address Line2",
                            controller: _addLine2Ctr,
                            hrMargin: 0.0,
                            size: size,
                          ),
                          boxHeight(15),
                          UtilityWidgets.inputField(
                            hintTxt: "pin Code",
                            controller: _pinCtr,
                            hrMargin: 0.0,
                            size: size,
                          ),
                          boxHeight(15),
                          CustomDropdown(
                              itemList: cityNames,
                              onChanged: (String? value){

                              },
                              hintText: "Select City"),
                          boxHeight(15),
                          CustomDropdown(
                              itemList: stateNames,
                              onChanged: (String? value){

                              },
                              hintText: "Select State"),
                          boxHeight(15),
                          Row(
                            children: [
                              Checkbox(
                                side: const BorderSide(
                                    color: AppColors.checkBoxBorder),
                                activeColor: AppColors.primaryColor,
                                checkColor: AppColors.backGroundColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                value: value1,
                                onChanged: (value) {
                                  setState(() {
                                    this.value1 = value!;
                                  });
                                },
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [
                                  Text(
                                    "I have read and agree to the",
                                    style: TextStyle(
                                        fontFamily: "Manrope-Medium",
                                        fontSize: 10.sp,
                                        color: AppColors.textColor),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        goNextScreen(
                                            to: const SignUp(),
                                            side:
                                            PageTransitionType.rightToLeft);
                                      },
                                      child:  Text(
                                        "TERM AND CONDITIONS",
                                        style: TextStyle(

                                            decoration:
                                            TextDecoration.underline,
                                            decorationColor:
                                            AppColors.secondaryColor,
                                            fontSize: 10.sp,
                                            color: AppColors.primaryColor,
                                            fontFamily: "Manrope-Bold"),
                                      )),
                                ],
                              ),
                            ],
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
