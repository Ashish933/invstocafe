import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:investocafe_flutter/session/session_key.dart';
import 'package:meta/meta.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../model/request/SignInRequestModel.dart';
import '../../../services/api_service/api_helper.dart';
import '../../../services/api_service/api_path.dart';
import '../../../session/session.dart';
import '../../../utility/app_constant.dart';
import '../../../utility/my_dialog_box.dart';
import '../../../utility/utility_helper.dart';
import '../../../view/auth_module/signIn_otp.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInButtonPressed>((event, emit) {
      _onSignInEvent(event, emit);

    });
  }

  void _onSignInEvent(SignInButtonPressed event,
      Emitter<SignInState> emit) async {
    MyDialogBox.progressDialogue();

    try {
      print(SessionKey.uuid);
      final result = await ApiHelper.postWideoutEncodeToken(
          path: ApiPath.signIn, parameters: event.request.toJson());
      MyDialogBox.close();

      final data = jsonDecode(result.body);
      UtilityHelper.toastMessage(data[message]);

      if (IsStatus(result.statusCode)) {
        Session.saveUID(data["uuid"]);
        navigatorKey!.currentState!
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const SignInOtpScreen();
        }));
      } else {
        UtilityHelper.toastMessage(data[message]);
        // MyDialogBox.close();

      }
    } catch (e) {
       MyDialogBox.close();

      // Handle errors appropriately
      print("Error occurred: $e");
      UtilityHelper.toastMessage(convertNA(e));

    } if (loginSavePassword) {
      Session.saveUserName(event.request.email ?? "");
      Session.saveUserPassword(event.request.password ?? "");
    } else {
      Session.saveUserName("");
      Session.saveUserPassword("");
    }
  }
}


  bool visiblePass = true;

bool loginSavePassword = true;
TextEditingController loginEmailController =
TextEditingController(text: Session.userName());
TextEditingController loginPasswordController =
TextEditingController(text: Session.userPassword());
