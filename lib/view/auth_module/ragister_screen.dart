import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/model/request/SignupRequestModel.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/view/auth_module/login_screen.dart';
import 'package:investocafe_flutter/view/auth_module/terms_conditions-view.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_dropdown.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../bloc/auth_bloc/SignUpBloc/sign_up_bloc.dart';
import '../../utility/app_constant.dart';
import '../../utility/app_message.dart';
import '../../utility/utility_helper.dart';
import '../../validation/form_validation.dart';
import '../utility_widget/utility_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  void initState() {
    termCondition = false;
    value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: AppColors.backGroundColor,
            size: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: signupFormKey,
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                // height: double.infinity,
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
                    AppConstants.Height(30),
                    const Text(
                      "Create your account",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Manrope-SemiBold",
                          color: AppColors.titleText),
                    ),
                    AppConstants.Height(10),
                    Text(
                      "Let’s get started with a free Financy account.",
                      style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.subTitleColor,
                          fontFamily: "Manrope-Medium"),
                    ),
                    AppConstants.Height(10),
                    UtilityWidgets.inputField(
                      controller: fName,
                      isFieldValid: true,
                      inputType: TextInputType.text,
                      hintTxt: "Full Name",
                      validator: FormValidation.validateName,
                      hrMargin: 0.0,
                      size: size,
                    ),
                    AppConstants.Height(15),
                    UtilityWidgets.inputField(
                      controller: emailCtr,
                      hintTxt: "Email *",
                      isFieldValid: true,
                      validator: FormValidation.emailValidation,
                      inputType: TextInputType.text,
                      hrMargin: 0.0,
                      size: size,
                    ),
                    AppConstants.Height(15),
                    UtilityWidgets.inputField(
                      controller: pNumber,
                      hintTxt: "Phone Number *",
                      isFieldValid: true,
                      validator: FormValidation.mobileNoValidation,
                      inputType: TextInputType.number,
                      hrMargin: 0.0,
                      size: size,
                    ),
                    AppConstants.Height(15),
                    UtilityWidgets.inputField(
                      controller: passwordCtr,
                      inputType: TextInputType.text,
                      obscureText: visiblePass,
                      validator: validatePassword,
                      hintTxt: "Password *",
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            visiblePass = !visiblePass;
                          });
                        },
                        child: Icon(
                          visiblePass
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      hrMargin: 0.0,
                      size: size,
                    ),
                    AppConstants.Height(15),
                    UtilityWidgets.inputField(
                      controller: confirmCtr,
                      inputType: TextInputType.text,
                      obscureText: visiblePass,
                      validator: validatePassword,
                      hintTxt: "Confirm Password *",
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            visiblePass = !visiblePass;
                          });
                        },
                        child: Icon(
                          visiblePass
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      hrMargin: 0.0,
                      size: size,
                    ),
                    AppConstants.Height(15),
                    CustomDropdown(
                       itemList:residence,

                      hintText: "Residence India",
                    ),

                    AppConstants.Height(15),
                   /* Row(
                      children: [
                        Checkbox(
                          side: const BorderSide(color: AppColors.checkBoxBorder),
                          activeColor: AppColors.primaryColor,
                          checkColor: AppColors.backGroundColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          value: value,
                          onChanged: (value) {
                            setState(() {
                              value = value!;
                            });
                          },
                        ),
                         Flexible(
                          child: Text(
                            "Do you have refer code ?",
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontFamily: "Manrope-Medium",
                                color: AppColors.contentColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    AppConstants.Height(10),*/
                    Row(
                      children: [
                        Checkbox(
                          side: const BorderSide(color: AppColors.checkBoxBorder),
                          activeColor: AppColors.primaryColor,
                          checkColor: AppColors.backGroundColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          value: termCondition,
                          onChanged: (value) {
                            setState(() {
                              termCondition = value!;
                            });
                          },
                        ),
                         Flexible(
                          child:
                          Text.rich(TextSpan(
                              text: 'I agree to the',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: "Manrope-Medium",
                                  overflow: TextOverflow.ellipsis,

                                  color: AppColors.contentColor),
                              children: <InlineSpan>[
                                const WidgetSpan(
                                  child: SizedBox(
                                      width: 3), // Adjust the width as needed
                                ),
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryColor,
                                    decoration: TextDecoration
                                        .underline,
                                    decorationColor: AppColors.primaryColor// Adding underline
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                    goNextScreen(to: const TermsCondition(),side: PageTransitionType.bottomToTop);

                                    },
                                )
                              ])
                          ),                        ),
                      ],
                    ),
                    AppConstants.Height(20),
                    CustomButton.button("Sign Up", callBack:  () => _onSignUpApiCalling()),

                    AppConstants.Height(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "I have an account?",
                          style: TextStyle(
                              fontFamily: "Manrope-Bold",
                              fontSize: 10.sp,
                              color: AppColors.contentColor),
                        ),
                        boxWidth(8),
                        GestureDetector(
                            onTap: () {
                              goNextScreen(
                                  to: const SignIn(),
                                  side: PageTransitionType.rightToLeft);
                            },
                            child:  Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: AppColors.primaryColor,
                                  fontFamily: "Manrope-Bold"),
                            )),
                      ],
                    ),


                    AppConstants.Height(15),
                     Center(
                      child: Text(
                        "Password must contain atleast one number ",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.noteHintColor,
                            fontFamily: "Manrope-Medium"),
                      ),
                    ),
                     Center(
                      child: Text(
                        "Password must contain atleast a capital letter",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.noteHintColor,
                            fontFamily: "Manrope-Medium"),
                      ),
                    ),
                     Center(
                      child: Text(
                        "Password must be atleast 8 characters ",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.noteHintColor,
                            fontFamily: "Manrope-Medium"),
                      ),
                    ),
                    AppConstants.Height(10),
                    Column(
                      children: [
                        Container(
                          color: AppColors.backGroundColor,
                          height: 100,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Privacy Policy"),
                              VerticalDivider(
                                width: 30.0,
                                thickness: 3.0,
                                color: AppColors.titleText,
                                indent: 35.0,
                                endIndent: 35.0,
                              ),
                              Text("Terms of Use"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ),
          ),
        ),
      ),
    );
  }

  String? validatePassword(String? val) {
    var _value = val ?? '';
    final _passwordRegExp = RegExp(AppRegex.passwordRegex);
    if (_value.isEmpty) {
      return AppRegex.requiredText;
    } else if (!_passwordRegExp.hasMatch(_value)) {
      return AppRegex.passwordMustContain;
    } else if (passwordCtr.text != confirmCtr.text) {
      return "Password does not match";
    }
    return null;
  }

  _onSignUpApiCalling() {
    if (termCondition == false) {
      UtilityHelper.toastMessage(AppMessage.termsCondition);
      setState(() {});
      return true;
    } else {
      setState(() {});
    }

     if (signupFormKey.currentState!.validate()) {
      SignUpRequestModel request = SignUpRequestModel(
          name: fName.text,
        password: passwordCtr.text,
        phone: pNumber.text,
        email: emailCtr.text,
        status: residence.first,
      );

      BlocProvider.of<SignUpBloc>(context)
          .add(SignUpButtonPressed(request: request));
    } else {
      UtilityHelper.toastMessage(AppMessage.fillAllFields);
    }
  }




}
