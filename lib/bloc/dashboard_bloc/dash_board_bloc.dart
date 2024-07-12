import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investocafe_flutter/model/response/GetDashboardLoadViewResponseModel.dart';
import 'package:investocafe_flutter/utility/app_constant.dart';

import '../../services/api_service/api_helper.dart';
import '../../services/api_service/api_path.dart';
import '../../session/session.dart';
import 'dash_board_event.dart';
import 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc() : super(DashBoardInitial()) {
    on<DashBoardEvent>((event, emit) {});

    on<DashBoardLoadViewGetEvent>((event, emit) async {
       try {
        print("bloc token${Session.idToken()}");
        emit(DashBoardLoadingState());
        final result = await ApiHelper.getAPi(path: ApiPath.dashBordLoadView);

        if (result.body.isNotEmpty) {
          final json = jsonDecode(result.body);
          final data = GetDashboardLoadViewResponseModel.fromJson(json);

          if (IsStatus(result.statusCode)) {
            final isForm = data.isInvestorFormCompleted == null || data.isInvestorFormCompleted == 0;
            Session.saveIsInvestorFormCompleted(isForm);
            emit(DashBoardLoadViewGetState(response: data));
          } else {
            emit(DashBoardErrorState(result.body));
          }
        } else {
          emit(DashBoardErrorState("Empty response received"));
        }
      } catch (e) {
        print("mistake : DashBoardGetEvent $e");
        emit(DashBoardErrorState(e.toString()));
      }
    });


  }
}