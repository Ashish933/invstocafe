import 'dart:convert';

import 'package:investocafe_flutter/model/response/GetDashboardLoadViewResponseModel.dart';
import 'package:investocafe_flutter/model/response/SignInResponseModel.dart';
import 'package:investocafe_flutter/session/session_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static late Session _appPreferences;
  static SharedPreferences? sharedPreferences;

  Session._internal() {
    init();
  }

  factory Session() {
    _appPreferences = Session._internal();
    return _appPreferences;
  }

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static SignInResponseModel user() {
    final data = sharedPreferences!.getString(SessionKey.user);
    if (data != null) {
      return SignInResponseModel.fromJson(jsonDecode(data));
    } else {
      return SignInResponseModel();
    }
  }

  static GetDashboardLoadViewResponseModel dashboardLoadView() {
    final data = sharedPreferences!.getString(SessionKey.prefDashBordLoadViewData);
    if (data != null) {
      return GetDashboardLoadViewResponseModel.fromJson(jsonDecode(data));
    } else {
      return GetDashboardLoadViewResponseModel();
    }
  }


  static String? idToken() => sharedPreferences!.getString(SessionKey.idToken.toString()) ?? "";

  static String? uuid() => sharedPreferences!.getString(SessionKey.uuid.toString()) ?? "";
  static prefDashBordLoadViewData() => sharedPreferences!.getString(SessionKey.prefDashBordLoadViewData)??"";

  static bool isLogin() =>
      sharedPreferences!.getBool(SessionKey.isLogin) ?? false;

  static bool isInvestorFormCompleted() =>
      sharedPreferences!.getBool(SessionKey.isInvestorFormCompleted) ?? true;


  static String userName() =>
      sharedPreferences!.getString(SessionKey.userName) ?? "";
  static String userPassword() =>
      sharedPreferences!.getString(SessionKey.userPassword) ?? "";

  // save
  static Future<void> saveToken(String idToken) async {
    await sharedPreferences!.setString(SessionKey.idToken, idToken);
  }

  static Future<void> saveUID(String uuid) async {
    await sharedPreferences!.setString(SessionKey.uuid, uuid);
  }
  static Future<void> saveIsInvestorFormCompleted(bool data) async {
    await sharedPreferences!.setBool(SessionKey.isInvestorFormCompleted, data);
  }


  setDashBoardLoadViewData(String prefDashBordLoadViewData) async {
    await sharedPreferences!.setString(SessionKey.prefDashBordLoadViewData, prefDashBordLoadViewData);
  }

  static Future<void> saveDashBordLoadView(String prefDashBordLoadViewData) async {
    try {
      await sharedPreferences!.setString(SessionKey.prefDashBordLoadViewData, prefDashBordLoadViewData);
    } catch (e) {
      print("erorr on $e");
    }
  }


  static Future<void> saveUser(String user) async {
    try {
      await sharedPreferences!.setString(SessionKey.user, user);
    } catch (e) {
      print("erorr on $e");
    }
  }

  static Future<void> saveIsLogin(bool isLogin) async {
    await sharedPreferences!.setBool(SessionKey.isLogin, isLogin);
  }

  static Future<void> saveUserName(String userName) async {
    await sharedPreferences!.setString(SessionKey.userName, userName);
  }

  static Future<void> saveUserPassword(String userPassword) async {
    await sharedPreferences!.setString(SessionKey.userPassword, userPassword);
  }

  static sessionClear() {
    sharedPreferences!.clear();
    print("session clear");
  }
}
