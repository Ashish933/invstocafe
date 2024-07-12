import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:investocafe_flutter/model/request/SignupRequestModel.dart';
import 'package:meta/meta.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../services/api_service/api_helper.dart';
import '../../../services/api_service/api_path.dart';
import '../../../utility/app_constant.dart';
import '../../../utility/my_dialog_box.dart';
import '../../../utility/utility_helper.dart';
import '../../../view/auth_module/login_screen.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpButtonPressed>((event, emit) {
      print("object");
      _onSignUpEvent(event, emit);
    });
  }
  void _onSignUpEvent(SignUpButtonPressed event,
      Emitter<SignUpState> emit) async {

     try {
       MyDialogBox.progressDialogue();
      final result = await ApiHelper.postWideoutEncodeToken(
          path: ApiPath.signUp, parameters: event.request.toJson());
      MyDialogBox.close();

      final data = jsonDecode(result.body);
      UtilityHelper.toastMessage(data[message]);
      if (IsStatus(result.statusCode)) {
        navigatorKey!.currentState!
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const SignIn();
        }));

      }else {
        UtilityHelper.toastMessage(data[error]);
        // MyDialogBox.close();

      }
      } catch (e) {
      // Handle errors appropriately
      print("Error occurred: $e");
      UtilityHelper.toastMessage(convertNA(e));

       MyDialogBox.close();
    }
  }
}


List<String> residence  = [
  'Resident India'
];

bool value = true;
bool visiblePass = true;
bool visiblePass1 = true;
bool termCondition = true;



List<TextInputFormatter>? validator;


TextEditingController fName = TextEditingController();
TextEditingController emailCtr = TextEditingController();
TextEditingController pNumber = TextEditingController();
TextEditingController passwordCtr = TextEditingController();
TextEditingController confirmCtr = TextEditingController();
String status = residence.first;

GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

