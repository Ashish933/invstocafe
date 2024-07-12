
import 'package:flutter/cupertino.dart';
import 'package:investocafe_flutter/model/request/OtpGenerateRequestModel.dart';

@immutable
sealed class OtpEvent {}

class OtpButtonPressed extends OtpEvent {
  late OtpGenarateRequestModel request;
  OtpButtonPressed({required this.request});
}