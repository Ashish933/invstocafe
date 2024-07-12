
import 'package:flutter/cupertino.dart';

import '../../model/request/InvestorDetailUpdateRequestModel.dart';
import '../../model/response/GetInvestorDetailResponse.dart';

@immutable
sealed class InvestorState {}

final class InvestorInitial extends InvestorState {}

class GetInvestorDetailState extends InvestorState {
  final GetIvestorDetailResponseModel? response;
  GetInvestorDetailState({required this.response});

}
class InvestorDetailUpdateState extends InvestorState {
  final InvestorDetailUpdateRequestModel? request;
  InvestorDetailUpdateState(this.request);
}


class GetInvestorDetailLoadingState extends InvestorState {}

class GetInvestorDetailErrorState extends InvestorState {
  String? message ;
  GetInvestorDetailErrorState(this.message);
}

