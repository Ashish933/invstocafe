// To parse this JSON data, do
//
//     final getDashboardLoadViewResponseModel = getDashboardLoadViewResponseModelFromJson(jsonString);

import 'dart:convert';

GetDashboardLoadViewResponseModel getDashboardLoadViewResponseModelFromJson(String str) => GetDashboardLoadViewResponseModel.fromJson(json.decode(str));

String getDashboardLoadViewResponseModelToJson(GetDashboardLoadViewResponseModel data) => json.encode(data.toJson());

class GetDashboardLoadViewResponseModel {
  String? profileImageUrl;
  int? incompleteBankDetail;
  int? isDoNotRegisterNominee;
  int? isVerify;
  String? motherName;
  int? investorTypeId;
  String? pan;
  DateTime? navDate;
  List<int>? investedFundType;
  int? isEligibleForTaxSavingWithdraw;
  List<int>? investedRequestFundType;
  int? isKycDone;
  int? isInvestorRegistered;
  int? isInvestorFormCompleted;
  dynamic resetTemPassword;
  List<GoalTypeList>? goalTypeList;
  List<MySip>? mySip;
  List<InvestedList>? investedTaxSavingsFundList;
  List<InvestedList>? investedFundNameList;
  List<dynamic>? investedFunds;
  List<TaxSvngInvFund>? taxSvngInvFunds;
  int? shortTermsCostValue;
  int? shortTermsCurrentValue;
  int? longTermsCurrentValue;
  double? longTermsCostValue;
  String? longTermGain;
  bool? success;
  dynamic message;
  String? username;
  String? firstName;
  String? lastName;

  GetDashboardLoadViewResponseModel({
    this.profileImageUrl,
    this.incompleteBankDetail,
    this.isDoNotRegisterNominee,
    this.isVerify,
    this.motherName,
    this.investorTypeId,
    this.pan,
    this.navDate,
    this.investedFundType,
    this.isEligibleForTaxSavingWithdraw,
    this.investedRequestFundType,
    this.isKycDone,
    this.isInvestorRegistered,
    this.isInvestorFormCompleted,
    this.resetTemPassword,
    this.goalTypeList,
    this.mySip,
    this.investedTaxSavingsFundList,
    this.investedFundNameList,
    this.investedFunds,
    this.taxSvngInvFunds,
    this.shortTermsCostValue,
    this.shortTermsCurrentValue,
    this.longTermsCurrentValue,
    this.longTermsCostValue,
    this.longTermGain,
    this.success,
    this.message,
    this.username,
    this.firstName,
    this.lastName,
  });

  factory GetDashboardLoadViewResponseModel.fromJson(Map<String, dynamic> json) => GetDashboardLoadViewResponseModel(
    profileImageUrl: json["profileImageUrl"],
    incompleteBankDetail: json["incompleteBankDetail"],
    isDoNotRegisterNominee: json["isDoNotRegisterNominee"],
    isVerify: json["isVerify"],
    motherName: json["motherName"],
    investorTypeId: json["investorTypeId"],
    pan: json["pan"],
    navDate: json["navDate"] == null ? null : DateTime.parse(json["navDate"]),
    investedFundType: json["investedFundType"] == null ? [] : List<int>.from(json["investedFundType"]!.map((x) => x)),
    isEligibleForTaxSavingWithdraw: json["isEligibleForTaxSavingWithdraw"],
    investedRequestFundType: json["investedRequestFundType"] == null ? [] : List<int>.from(json["investedRequestFundType"]!.map((x) => x)),
    isKycDone: json["isKycDone"],
    isInvestorRegistered: json["isInvestorRegistered"],
    isInvestorFormCompleted: json["isInvestorFormCompleted"],
    resetTemPassword: json["resetTemPassword"],
    goalTypeList: json["goalTypeList"] == null ? [] : List<GoalTypeList>.from(json["goalTypeList"]!.map((x) => GoalTypeList.fromJson(x))),
    mySip: json["mySIP"] == null ? [] : List<MySip>.from(json["mySIP"]!.map((x) => MySip.fromJson(x))),
    investedTaxSavingsFundList: json["investedTaxSavingsFundList"] == null ? [] : List<InvestedList>.from(json["investedTaxSavingsFundList"]!.map((x) => InvestedList.fromJson(x))),
    investedFundNameList: json["investedFundNameList"] == null ? [] : List<InvestedList>.from(json["investedFundNameList"]!.map((x) => InvestedList.fromJson(x))),
    investedFunds: json["investedFunds"] == null ? [] : List<dynamic>.from(json["investedFunds"]!.map((x) => x)),
    taxSvngInvFunds: json["taxSvngInvFunds"] == null ? [] : List<TaxSvngInvFund>.from(json["taxSvngInvFunds"]!.map((x) => TaxSvngInvFund.fromJson(x))),
    shortTermsCostValue: json["shortTermsCostValue"],
    shortTermsCurrentValue: json["shortTermsCurrentValue"],
    longTermsCurrentValue: json["longTermsCurrentValue"],
    longTermsCostValue: json["longTermsCostValue"]?.toDouble(),
    longTermGain: json["longTermGain"],
    success: json["success"],
    message: json["message"],
    username: json["username"],
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "profileImageUrl": profileImageUrl,
    "incompleteBankDetail": incompleteBankDetail,
    "isDoNotRegisterNominee": isDoNotRegisterNominee,
    "isVerify": isVerify,
    "motherName": motherName,
    "investorTypeId": investorTypeId,
    "pan": pan,
    "navDate": navDate?.toIso8601String(),
    "investedFundType": investedFundType == null ? [] : List<dynamic>.from(investedFundType!.map((x) => x)),
    "isEligibleForTaxSavingWithdraw": isEligibleForTaxSavingWithdraw,
    "investedRequestFundType": investedRequestFundType == null ? [] : List<dynamic>.from(investedRequestFundType!.map((x) => x)),
    "isKycDone": isKycDone,
    "isInvestorRegistered": isInvestorRegistered,
    "isInvestorFormCompleted": isInvestorFormCompleted,
    "resetTemPassword": resetTemPassword,
    "goalTypeList": goalTypeList == null ? [] : List<dynamic>.from(goalTypeList!.map((x) => x.toJson())),
    "mySIP": mySip == null ? [] : List<dynamic>.from(mySip!.map((x) => x.toJson())),
    "investedTaxSavingsFundList": investedTaxSavingsFundList == null ? [] : List<dynamic>.from(investedTaxSavingsFundList!.map((x) => x.toJson())),
    "investedFundNameList": investedFundNameList == null ? [] : List<dynamic>.from(investedFundNameList!.map((x) => x.toJson())),
    "investedFunds": investedFunds == null ? [] : List<dynamic>.from(investedFunds!.map((x) => x)),
    "taxSvngInvFunds": taxSvngInvFunds == null ? [] : List<dynamic>.from(taxSvngInvFunds!.map((x) => x.toJson())),
    "shortTermsCostValue": shortTermsCostValue,
    "shortTermsCurrentValue": shortTermsCurrentValue,
    "longTermsCurrentValue": longTermsCurrentValue,
    "longTermsCostValue": longTermsCostValue,
    "longTermGain": longTermGain,
    "success": success,
    "message": message,
    "username": username,
    "firstName": firstName,
    "lastName": lastName,
  };
}

class GoalTypeList {
  int? goalTypeId;
  String? goalTitle;
  String? goalDescription;
  DateTime? ts;

  GoalTypeList({
    this.goalTypeId,
    this.goalTitle,
    this.goalDescription,
    this.ts,
  });

  factory GoalTypeList.fromJson(Map<String, dynamic> json) => GoalTypeList(
    goalTypeId: json["goalTypeId"],
    goalTitle: json["goalTitle"],
    goalDescription: json["goalDescription"],
    ts: json["ts"] == null ? null : DateTime.parse(json["ts"]),
  );

  Map<String, dynamic> toJson() => {
    "goalTypeId": goalTypeId,
    "goalTitle": goalTitle,
    "goalDescription": goalDescription,
    "ts": ts?.toIso8601String(),
  };
}

class InvestedList {
  int? fundId;
  String? name;

  InvestedList({
    this.fundId,
    this.name,
  });

  factory InvestedList.fromJson(Map<String, dynamic> json) => InvestedList(
    fundId: json["fundId"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "fundId": fundId,
    "name": name,
  };
}

class MySip {
  int? monthlyInvestmentId;
  dynamic sipRegDateKarvy;
  String? sipRefNoKarvy;
  int? investorId;
  int? amount;
  int? fundId;
  DateTime? sipStartDate;
  DateTime? sipEndDate;
  DateTime? nextInvestmentDate;
  int? noOfMonths;
  int? noOfInvestedMonths;
  int? batchId;
  int? isStoppedSip;
  int? deleteInd;
  String? amcCode;
  String? schemeDescription;

  MySip({
    this.monthlyInvestmentId,
    this.sipRegDateKarvy,
    this.sipRefNoKarvy,
    this.investorId,
    this.amount,
    this.fundId,
    this.sipStartDate,
    this.sipEndDate,
    this.nextInvestmentDate,
    this.noOfMonths,
    this.noOfInvestedMonths,
    this.batchId,
    this.isStoppedSip,
    this.deleteInd,
    this.amcCode,
    this.schemeDescription,
  });

  factory MySip.fromJson(Map<String, dynamic> json) => MySip(
    monthlyInvestmentId: json["monthlyInvestmentId"],
    sipRegDateKarvy: json["sipRegDateKarvy"],
    sipRefNoKarvy: json["sipRefNoKarvy"],
    investorId: json["investorId"],
    amount: json["amount"],
    fundId: json["fundId"],
    sipStartDate: json["sipStartDate"] == null ? null : DateTime.parse(json["sipStartDate"]),
    sipEndDate: json["sipEndDate"] == null ? null : DateTime.parse(json["sipEndDate"]),
    nextInvestmentDate: json["nextInvestmentDate"] == null ? null : DateTime.parse(json["nextInvestmentDate"]),
    noOfMonths: json["noOfMonths"],
    noOfInvestedMonths: json["noOfInvestedMonths"],
    batchId: json["batchId"],
    isStoppedSip: json["isStoppedSip"],
    deleteInd: json["deleteInd"],
    amcCode: json["amcCode"],
    schemeDescription: json["schemeDescription"],
  );

  Map<String, dynamic> toJson() => {
    "monthlyInvestmentId": monthlyInvestmentId,
    "sipRegDateKarvy": sipRegDateKarvy,
    "sipRefNoKarvy": sipRefNoKarvy,
    "investorId": investorId,
    "amount": amount,
    "fundId": fundId,
    "sipStartDate": "${sipStartDate!.year.toString().padLeft(4, '0')}-${sipStartDate!.month.toString().padLeft(2, '0')}-${sipStartDate!.day.toString().padLeft(2, '0')}",
    "sipEndDate": "${sipEndDate!.year.toString().padLeft(4, '0')}-${sipEndDate!.month.toString().padLeft(2, '0')}-${sipEndDate!.day.toString().padLeft(2, '0')}",
    "nextInvestmentDate": "${nextInvestmentDate!.year.toString().padLeft(4, '0')}-${nextInvestmentDate!.month.toString().padLeft(2, '0')}-${nextInvestmentDate!.day.toString().padLeft(2, '0')}",
    "noOfMonths": noOfMonths,
    "noOfInvestedMonths": noOfInvestedMonths,
    "batchId": batchId,
    "isStoppedSip": isStoppedSip,
    "deleteInd": deleteInd,
    "amcCode": amcCode,
    "schemeDescription": schemeDescription,
  };
}

class TaxSvngInvFund {
  Name? name;
  int? batchId;
  double? amount;
  DateTime? requestDate;
  int? fundTypeId;
  int? requestStatus;

  TaxSvngInvFund({
    this.name,
    this.batchId,
    this.amount,
    this.requestDate,
    this.fundTypeId,
    this.requestStatus,
  });

  factory TaxSvngInvFund.fromJson(Map<String, dynamic> json) => TaxSvngInvFund(
    name: nameValues.map[json["name"]]!,
    batchId: json["batchId"],
    amount: json["amount"]?.toDouble(),
    requestDate: json["requestDate"] == null ? null : DateTime.parse(json["requestDate"]),
    fundTypeId: json["fundTypeId"],
    requestStatus: json["requestStatus"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "batchId": batchId,
    "amount": amount,
    "requestDate": requestDate?.toIso8601String(),
    "fundTypeId": fundTypeId,
    "requestStatus": requestStatus,
  };
}

enum Name {
  TAX_SAVING
}

final nameValues = EnumValues({
  "Tax Saving": Name.TAX_SAVING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
