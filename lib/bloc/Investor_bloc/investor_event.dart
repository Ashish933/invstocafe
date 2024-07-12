import 'package:flutter/cupertino.dart';

import '../../model/request/InvestorDetailUpdateRequestModel.dart';

@immutable
sealed class InvestorEvent {}

class GetInvestorDetailsEvent extends InvestorEvent {
  final String? idToken;
  GetInvestorDetailsEvent({this.idToken});
}

class InvestorDetailUpdateEvent extends InvestorEvent {
  final InvestorDetailUpdateRequestModel? request;
  InvestorDetailUpdateEvent({this.request});
}