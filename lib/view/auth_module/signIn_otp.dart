
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investocafe_flutter/model/request/OtpGenerateRequestModel.dart';
import 'package:investocafe_flutter/session/session.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:investocafe_flutter/utility/utility_helper.dart';
import 'package:investocafe_flutter/view/utility_widget/custom_button.dart';
import 'package:investocafe_flutter/view/utility_widget/utility_widgets.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../bloc/auth_bloc/OtpBloc/otp_bloc.dart';
import '../../bloc/auth_bloc/OtpBloc/otp_event.dart';
import '../../bloc/auth_bloc/SignInBloc/sign_in_bloc.dart';
import '../../model/request/SignInRequestModel.dart';
import '../../utility/app_constant.dart';
import '../../utility/app_message.dart';
import '../../utility/colors_widget.dart';

class SignInOtpScreen extends StatefulWidget {
  final SignInBloc? signInBloc;
  final String? email;
  final String? password;
  final bool? rememberme = true;


  const SignInOtpScreen({super.key, this.signInBloc, this.email, this.password,});

  @override
  State<SignInOtpScreen> createState() => _SignInOtpScreenState();
}

class _SignInOtpScreenState extends State<SignInOtpScreen> {

  ColorNotifire notifier = ColorNotifire();
  OtpFieldController otpCtr = OtpFieldController();
  String? inputOtp;
SignInBloc signInBloc = SignInBloc();

  resendOtp() async {
    widget.signInBloc
        ?.add(SignInButtonPressed(
      request: SignInRequestModel(
          email: widget.email,
          rememberme: widget.rememberme,
          password: widget.password),
    )
    );


  }



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
                    const SizedBox(height: 40,),
                    UtilityWidgets.MainText("Authentication Code"),
                    AppConstants.Height(10),
                    const Text(
                      "Enter 6-digit code we just texted to your\n phone number",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff64748B),
                          fontFamily: "Manrope-Medium"),
                    ),
                    AppConstants.Height(30),
                    OTPTextField(
                      controller: otpCtr,
                        hasError: false,
                        length: 6,
                        width: width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 45,
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 10,
                        obscureText: true,
                        otpFieldStyle: OtpFieldStyle(backgroundColor: Colors.grey.withOpacity(0.3)),
                        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                        onChanged: (pin) {
                        },
                        onCompleted: (pin) {
                        inputOtp = pin;
                        }),
                    AppConstants.Height(20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap:(){

                            },
                            child: Text(
                              "Use different phone number",
                              style: TextStyle(fontSize: 14, fontFamily: "Manrope-SemiBold",color: notifier.textColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppConstants.Height(20),
                    CustomButton.button("Continue", callBack: () {
                      if (inputOtp == null || inputOtp!.isEmpty) {
                        UtilityHelper.toastMessage(AppMessage.otpIsRequired);
                        print("Input OTP is empty. Show static message.");
                      } else {
                        BlocProvider.of<OtpBloc>(context).add(
                          OtpButtonPressed(
                            request: OtpGenarateRequestModel(uuid: Session.uuid(), otp: inputOtp.toString()),
                          ),
                        );
                      }
                    }),


                    AppConstants.Height(10),
                    CustomButton.buttonWithoutBg("Resend Code",
                        callBack:() {
                      print("object");

                      BlocProvider.of<SignInBloc>(context)
                              .add(SignInButtonPressed(
                            request: SignInRequestModel(
                                email: loginEmailController.text,
                                rememberme: loginSavePassword,
                                password: loginPasswordController.text),
                          )

                          );
                      UtilityHelper.toastMessage("Resend Otp");

                        }
                    ),

                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }


}
