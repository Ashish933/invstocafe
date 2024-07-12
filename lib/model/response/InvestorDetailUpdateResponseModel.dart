// To parse this JSON data, do
//
//     final investorDetailResponseModel = investorDetailResponseModelFromJson(jsonString);

import 'dart:convert';

InvestorDetailResponseModel investorDetailResponseModelFromJson(String str) => InvestorDetailResponseModel.fromJson(json.decode(str));

String investorDetailResponseModelToJson(InvestorDetailResponseModel data) => json.encode(data.toJson());

class InvestorDetailResponseModel {
  bool? success;
  String? response;

  InvestorDetailResponseModel({
    this.success,
    this.response,
  });

  factory InvestorDetailResponseModel.fromJson(Map<String, dynamic> json) => InvestorDetailResponseModel(
    success: json["success"],
    response: json["response"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "response": response,
  };
}
