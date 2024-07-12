import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:investocafe_flutter/model/request/SignInRequestModel.dart';
import 'package:investocafe_flutter/services/api_service/api_helper.dart';
import 'package:investocafe_flutter/services/api_service/api_path.dart';
import 'package:investocafe_flutter/session/session.dart';
import 'package:investocafe_flutter/utility/app_constant.dart';
import 'package:investocafe_flutter/utility/app_message.dart';
import 'package:investocafe_flutter/utility/my_dialog_box.dart';
import 'package:investocafe_flutter/utility/utility_helper.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInButtonPressed>((event, emit) {
      try {
        if (loginFormKey.currentState!.validate()) {
          _onSignInEvent(event, emit);
        } else {
          UtilityHelper.toastMessage(AppMessage.fillAllFields);
        }
      } catch (e) {
        MyDialogBox.close();
      }
    });
  }

  void _onSignInEvent(
      SignInButtonPressed event, Emitter<SignInState> emit) async {
    MyDialogBox.progressDialogue();

    final result = await ApiHelper.postEncodeCall(
        path: ApiPath.signIn, parameters: event.request.toJson());
    MyDialogBox.close();
    final data = jsonDecode(result.body);
    UtilityHelper.toastMessage(data[message]);

    if (IsStatus(result.statusCode)) {
      Session.saveUser(result.body);

      // navigatorKey!.currentState!.push(MaterialPageRoute(builder: (context) {
      //   return const LoginPinScreen();
      // }));
    }

    if (loginSavePassword) {
      Session.saveUserEmail(event.request.email ?? "");
      Session.saveUserPassword(event.request.password ?? "");
    } else {
      Session.saveUserEmail("");
      Session.saveUserPassword("");
    }
  }
}

bool loginSavePassword = true;
TextEditingController loginEmailController =
    TextEditingController(text: Session.userEmail());
TextEditingController loginPasswordController =
    TextEditingController(text: Session.userPassword());
GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
