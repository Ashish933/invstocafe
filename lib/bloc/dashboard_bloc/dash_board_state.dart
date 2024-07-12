import 'package:flutter/cupertino.dart';

import '../../model/response/GetDashboardLoadViewResponseModel.dart';

@immutable
sealed class DashBoardState {}

final class DashBoardInitial extends DashBoardState {}

class DashBoardLoadViewGetState extends DashBoardState {
  GetDashboardLoadViewResponseModel? response;
  DashBoardLoadViewGetState({required this.response});

}

class DashBoardLoadingState extends DashBoardState {}

class DashBoardErrorState extends DashBoardState {
  String message ;
  DashBoardErrorState(this.message);
}

