// To parse this JSON data, do
//
//     final investorDetailRequestModel = investorDetailRequestModelFromJson(jsonString);

import 'dart:convert';

InvestorDetailUpdateRequestModel investorDetailRequestModelFromJson(String str) => InvestorDetailUpdateRequestModel.fromJson(json.decode(str));

String investorDetailRequestModelToJson(InvestorDetailUpdateRequestModel data) => json.encode(data.toJson());

class InvestorDetailUpdateRequestModel {
  String? name;
  int? armedForces;
  String? phone;
  DateTime? dob;
  String? placeOfBirth;
  String? country;
  String? gender;

  InvestorDetailUpdateRequestModel({
    this.name,
    this.armedForces,
    this.phone,
    this.dob,
    this.placeOfBirth,
    this.country,
    this.gender,
  });

  factory InvestorDetailUpdateRequestModel.fromJson(Map<String, dynamic> json) => InvestorDetailUpdateRequestModel(
    name: json["name"],
    armedForces: json["armedForces"],
    phone: json["phone"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    placeOfBirth: json["placeOfBirth"],
    country: json["country"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "armedForces": armedForces,
    "phone": phone,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "placeOfBirth": placeOfBirth,
    "country": country,
    "gender": gender,
  };
}
