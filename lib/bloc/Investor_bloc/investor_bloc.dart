import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:investocafe_flutter/utility/app_constant.dart';
import 'package:page_transition/page_transition.dart';

import '../../model/request/InvestorDetailUpdateRequestModel.dart';
import '../../model/response/GetInvestorDetailResponse.dart';
import '../../services/api_service/api_helper.dart';
import '../../services/api_service/api_path.dart';
import '../../session/session.dart';
import '../../utility/my_dialog_box.dart';
import '../../utility/utility_helper.dart';
import '../../view/common_module/stepper_details/details_stepper.dart';
import 'investor_event.dart';
import 'investor_state.dart';

class InvestorBloc extends Bloc<InvestorEvent, InvestorState> {
  InvestorBloc() : super(InvestorInitial()) {
    on<InvestorEvent>((event, emit) {});

    on<GetInvestorDetailsEvent>((event, emit) async {

      try {
        print("bloc token${Session.idToken()}");
        emit(GetInvestorDetailLoadingState());
        final result = await ApiHelper.getAPi(path: ApiPath.getInvestorDetail);
        final json = jsonDecode(result.body);
        final data = GetIvestorDetailResponseModel.fromJson(json);

        if (IsStatus(result.statusCode)) {
          Session.idToken();
          emit(GetInvestorDetailState(response: data));
        } else {
          emit(GetInvestorDetailErrorState(result.body));
        }
      } catch (e) {
        print("Mistake : GetInvestorDetailsEvent $e");
        GetInvestorDetailErrorState(e.toString());
      }
    });

/*
    on<InvestorDetailUpdateEvent>((event, emit) async {
      MyDialogBox.progressDialogue();
      final request = generateRequest();
      final result = await ApiHelper.postWithTokenCall(
          path: ApiPath.investorDetailUpdate,
          parameters: request.toJson());
      MyDialogBox.close();
      final data = jsonDecode(result.body);
      UtilityHelper.toastMessage(data[response]);
      if (IsStatus(result.statusCode)) {
        navigatorKey!.currentState!
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const DetailsStepper();
        }));
        // navigatorKey!.currentState?.pop(true);
        clearState();
      }else{
        UtilityHelper.toastMessage(data[response]);

      }
    });
*/
    on<InvestorDetailUpdateEvent>((event, emit) async {
      MyDialogBox.progressDialogue();

      try {
        final request = generateRequest();
        final result = await ApiHelper.postWithTokenCall(
          path: ApiPath.investorDetailUpdate,
          parameters: request.toJson(),
        );

        MyDialogBox.close();

        final data = jsonDecode(result.body);
        UtilityHelper.toastMessage(data[response]);
        if (IsStatus(result.statusCode)) {
          navigatorKey!.currentState!
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const DetailsStepper();
          }));
          clearState();
        } else {
          UtilityHelper.toastMessage(data[response]);
        }
      } catch (error) {
        MyDialogBox.close();
        UtilityHelper.toastMessage("An error occurred: $error");
      }
    });

  }


  InvestorDetailUpdateRequestModel generateRequest() {
    return InvestorDetailUpdateRequestModel(
      name: nameCtr.text,
      phone: mobileCtr.text,
      placeOfBirth: placeBirthCtr.text,
      gender: selectGender??"",
      country: selectCountry??"",
      dob: DateTime.timestamp(),
      armedForces: armed,
    );
  }

  clearState() {
    nameCtr.clear();
    mobileCtr.clear();
    placeBirthCtr.clear();
    selectGender = null;
    selectCountry = null;
    dob = null;
    armed = null;
  }
}

  TextEditingController nameCtr = TextEditingController();
  TextEditingController mobileCtr = TextEditingController();
  TextEditingController placeBirthCtr = TextEditingController();
  String? selectGender;
  String? selectCountry;
  DateTime? dob;
  int? armed = 0;
  bool termCondition = true;

  List<String> genderList = [
    'Male', 'Female', 'Other'
  ];
  List<String> countryList = [
    'India', 'Australia', 'USK', 'China'
  ];

