import 'package:flutter/cupertino.dart';

@immutable
sealed class DashBoardEvent {}

class DashBoardLoadViewGetEvent extends DashBoardEvent {
  final String? idToken;
  DashBoardLoadViewGetEvent({this.idToken});

}
