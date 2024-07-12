import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
goNextScreen({required to, side, Alignment? alignment}) {
  print("calling");
  return navigatorKey!.currentState!.push(PageTransition(
    child: to,
    type: side ?? PageTransitionType.rightToLeft,
    duration: const Duration(milliseconds: 500),
    alignment: alignment ?? Alignment.centerLeft,
  ));
}

int statusCode200 = 200;
int statusCode201 = 201;
int statusCode401 = 401;
int statusCode501 = 501;
String message = "message";
String response = "response";
bool success = true;
String statusType = 'success';
String error = "error";


IsStatus(code) => code == statusCode200 || code == statusCode201;



class AppConstants {
  static Widget Height(double h) {
    return SizedBox(height: h);
  }

  static Widget Width(double w) {
    return SizedBox(width: w);
  }
}
