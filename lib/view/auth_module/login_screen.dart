// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investocafe_flutter/bloc/auth_bloc/SignInBloc/sign_in_bloc.dart';
import 'package:investocafe_flutter/model/request/SignInRequestModel.dart';
import 'package:investocafe_flutter/utility/app_message.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/utility/utility_helper.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:investocafe_flutter/view/auth_module/forgat_password_screen.dart';
import 'package:investocafe_flutter/view/auth_module/ragister_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_deva/responsive_deva.dart';
import '../../utility/app_constant.dart';
import '../../validation/form_validation.dart';
import '../utility_widget/custom_button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: loginFormKey,
          child: AnimationLimiter(
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
                  Container(
                            height: 279,
                            width: 450,
                            color:  AppColors.secondaryColor,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, left: 10),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            // color:notifier.textColor,
                                            size: 25,
                                          )),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Image.asset("assets/logo/logo.png",
                                      color: AppColors.backGroundColor,
                                      height: height / 6),
                                ),
                                const Spacer(),
                                 Text('Welcome Back!',
                                    style: TextStyle(
                                        color: AppColors.backGroundColor,
                                        fontSize: 16.sp,
                                        fontFamily: "Manrope-Bold")),
                                 Text('Sign in to your account',
                                    style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: 12.sp,
                                        fontFamily: "Manrope-Medium")),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            )),

                  AppConstants.Height(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        UtilityWidgets.inputField(
                          controller: loginEmailController,
                          inputType: TextInputType.text,
                          validator: FormValidation.emailValidation,
                          hintTxt: "Enter Email",
                          hrMargin: 0.0,
                          size: size,
                        ),

                        AppConstants.Height(20),
                        UtilityWidgets.inputField(
                          controller: loginPasswordController,
                          inputType: TextInputType.text,
                          obscureText: visiblePass,
                          hintTxt: "Enter Password",
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
                        AppConstants.Height(20),


                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Center the row content

                          children: [
                            Row(
                              children: [
                                Container(
                                  height: getHeight(24),
                                  width: getWidth(24),
                                  margin: EdgeInsets.only(right: getWidth(10)),
                                  // decoration: BoxDecoration(
                                  //   // color: Colors.red
                                  //     border: Border.all(color: AppColors.checkBoxBorder),
                                  //     borderRadius: BorderRadius.circular(5)),
                                  // color: Colors.amber,
                                  child: Checkbox(
                                    side: const BorderSide(color: AppColors.checkBoxBorder),
                                    activeColor: AppColors.primaryColor,
                                    checkColor: AppColors.backGroundColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    value: loginSavePassword,
                                    onChanged: (value) {
                                      setState(() {
                                        loginSavePassword = value!;
                                      });
                                    },
                                  ),
                                ),
                                  Text(
                                  "Stay signed in",
                                  style: TextStyle(
                                      fontFamily: "Manrope-Medium",
                                      fontSize: 11.sp,
                                      color: AppColors.textColor),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                goNextScreen(
                                    to: const ForgetScreen(),
                                    side: PageTransitionType.topToBottom);
                              },
                              child:   Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: AppColors.primaryColor,
                                    fontFamily: "Manrope-Bold"),
                              ),
                            ),
                          ],
                        ),


                        AppConstants.Height(20),
                        CustomButton.button("Sign In",
                            callBack: () {
                          print("pressed");
                          if(loginFormKey.currentState!.validate())  {
                            BlocProvider.of<SignInBloc>(context)
                                .add(SignInButtonPressed(
                              request: SignInRequestModel(
                                  email: loginEmailController.text,
                                  rememberme: loginSavePassword,
                                  password: loginPasswordController.text),
                            ));
                          }else {
                            UtilityHelper.toastMessage(AppMessage.fillAllFields);
                          }
                        }),

                        AppConstants.Height(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontFamily: "Manrope-Medium",
                                  fontSize: 10.sp,
                                  color: AppColors.textColor),
                            ),
                            boxWidth(8),
                            GestureDetector(
                                onTap: () {
                                  goNextScreen(
                                      to: const SignUp(),
                                      side: PageTransitionType.rightToLeft);
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primaryColor,
                                      fontFamily: "Manrope-Bold"),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppConstants.Height(20),
                      ],
                    ),


                ),

              ),
        ),
          ),


    );
  }


}
