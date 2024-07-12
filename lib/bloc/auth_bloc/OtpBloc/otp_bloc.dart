import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investocafe_flutter/services/api_service/api_helper.dart';
import 'package:investocafe_flutter/services/api_service/api_path.dart';
import 'package:investocafe_flutter/session/session.dart';
import 'package:investocafe_flutter/session/session_key.dart';
import 'package:investocafe_flutter/utility/my_dialog_box.dart';
import 'package:investocafe_flutter/view/common_module/Home/bottom.dart';
import 'package:responsive_deva/responsive_deva.dart';

import '../../../utility/app_constant.dart';
import '../../../utility/app_message.dart';
import '../../../utility/utility_helper.dart';
import 'otp_event.dart';
import 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<OtpButtonPressed>((event, emit) async{
try {



  if (event.request.otp != null || event.request.uuid != null) {
    // MyDialogBox.progressDialogue();

    final result = await ApiHelper.postWithoutTokenCall(path: ApiPath.otpVerify,
        parameters: event.request.toJson());
    final data = jsonDecode(result.body);

    UtilityHelper.toastMessage(data[message]);
    if(IsStatus(result.statusCode)){
      Session.saveToken(data[SessionKey.idToken]);
      Session.saveIsLogin(true);
      navigatorKey?.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> const BottomBarScreen() ), (route) => false);
    }

    // MyDialogBox.close();
  } else {
    UtilityHelper.toastMessage(AppMessage.otpIsRequired);
  }
}
catch (e) {
  MyDialogBox.close();

  // Handle errors appropriately
  print("Error in bloc OtpButtonPressed : $e");
  UtilityHelper.toastMessage(convertNA(e));

}
    });


  }
}

