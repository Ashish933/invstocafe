// To parse this JSON data, do
//
//     final getIvestorDetailResponseModel = getIvestorDetailResponseModelFromJson(jsonString);

import 'dart:convert';

GetIvestorDetailResponseModel getIvestorDetailResponseModelFromJson(String str) => GetIvestorDetailResponseModel.fromJson(json.decode(str));

String getIvestorDetailResponseModelToJson(GetIvestorDetailResponseModel data) => json.encode(data.toJson());

class GetIvestorDetailResponseModel {
  InvestorDetails? investorDetails;
  BankDetails? bankDetails;
  InvestorStatus? investorStatus;
  FormModifyMapper? formModifyMapper;
  List<Nominee>? nominee;
  List<BankMasterList>? bankMasterList;
  List<AccountType>? accountTypes;
  List<CityList>? cityList;
  List<AllState>? allState;
  List<AllCountry>? allCountry;
  List<IdProofList>? idProofList;
  List<AddressProof>? addressProofs;
  List<FamilyStatus>? familyStatus;
  List<OccupationsList>? occupationsList;
  List<dynamic>? assEmpList;

  GetIvestorDetailResponseModel({
    this.investorDetails,
    this.bankDetails,
    this.investorStatus,
    this.formModifyMapper,
    this.nominee,
    this.bankMasterList,
    this.accountTypes,
    this.cityList,
    this.allState,
    this.allCountry,
    this.idProofList,
    this.addressProofs,
    this.familyStatus,
    this.occupationsList,
    this.assEmpList,
  });

  factory GetIvestorDetailResponseModel.fromJson(Map<String, dynamic> json) => GetIvestorDetailResponseModel(
    investorDetails: json["investorDetails"] == null ? null : InvestorDetails.fromJson(json["investorDetails"]),
    bankDetails: json["bankDetails"] == null ? null : BankDetails.fromJson(json["bankDetails"]),
    investorStatus: json["investorStatus"] == null ? null : InvestorStatus.fromJson(json["investorStatus"]),
    formModifyMapper: json["formModifyMapper"] == null ? null : FormModifyMapper.fromJson(json["formModifyMapper"]),
    nominee: json["nominee"] == null ? [] : List<Nominee>.from(json["nominee"]!.map((x) => Nominee.fromJson(x))),
    bankMasterList: json["bankMasterList"] == null ? [] : List<BankMasterList>.from(json["bankMasterList"]!.map((x) => BankMasterList.fromJson(x))),
    accountTypes: json["accountTypes"] == null ? [] : List<AccountType>.from(json["accountTypes"]!.map((x) => AccountType.fromJson(x))),
    cityList: json["cityList"] == null ? [] : List<CityList>.from(json["cityList"]!.map((x) => CityList.fromJson(x))),
    allState: json["allState"] == null ? [] : List<AllState>.from(json["allState"]!.map((x) => AllState.fromJson(x))),
    allCountry: json["allCountry"] == null ? [] : List<AllCountry>.from(json["allCountry"]!.map((x) => AllCountry.fromJson(x))),
    idProofList: json["idProofList"] == null ? [] : List<IdProofList>.from(json["idProofList"]!.map((x) => IdProofList.fromJson(x))),
    addressProofs: json["addressProofs"] == null ? [] : List<AddressProof>.from(json["addressProofs"]!.map((x) => AddressProof.fromJson(x))),
    familyStatus: json["familyStatus"] == null ? [] : List<FamilyStatus>.from(json["familyStatus"]!.map((x) => FamilyStatus.fromJson(x))),
    occupationsList: json["occupationsList"] == null ? [] : List<OccupationsList>.from(json["occupationsList"]!.map((x) => OccupationsList.fromJson(x))),
    assEmpList: json["assEmpList"] == null ? [] : List<dynamic>.from(json["assEmpList"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "investorDetails": investorDetails?.toJson(),
    "bankDetails": bankDetails?.toJson(),
    "investorStatus": investorStatus?.toJson(),
    "formModifyMapper": formModifyMapper?.toJson(),
    "nominee": nominee == null ? [] : List<dynamic>.from(nominee!.map((x) => x.toJson())),
    "bankMasterList": bankMasterList == null ? [] : List<dynamic>.from(bankMasterList!.map((x) => x.toJson())),
    "accountTypes": accountTypes == null ? [] : List<dynamic>.from(accountTypes!.map((x) => x.toJson())),
    "cityList": cityList == null ? [] : List<dynamic>.from(cityList!.map((x) => x.toJson())),
    "allState": allState == null ? [] : List<dynamic>.from(allState!.map((x) => x.toJson())),
    "allCountry": allCountry == null ? [] : List<dynamic>.from(allCountry!.map((x) => x.toJson())),
    "idProofList": idProofList == null ? [] : List<dynamic>.from(idProofList!.map((x) => x.toJson())),
    "addressProofs": addressProofs == null ? [] : List<dynamic>.from(addressProofs!.map((x) => x.toJson())),
    "familyStatus": familyStatus == null ? [] : List<dynamic>.from(familyStatus!.map((x) => x.toJson())),
    "occupationsList": occupationsList == null ? [] : List<dynamic>.from(occupationsList!.map((x) => x.toJson())),
    "assEmpList": assEmpList == null ? [] : List<dynamic>.from(assEmpList!.map((x) => x)),
  };
}

class AccountType {
  int? accountTypeId;
  String? accountType;
  String? bankAccountTypeCode;

  AccountType({
    this.accountTypeId,
    this.accountType,
    this.bankAccountTypeCode,
  });

  factory AccountType.fromJson(Map<String, dynamic> json) => AccountType(
    accountTypeId: json["accountTypeId"],
    accountType: json["accountType"],
    bankAccountTypeCode: json["bankAccountTypeCode"],
  );

  Map<String, dynamic> toJson() => {
    "accountTypeId": accountTypeId,
    "accountType": accountType,
    "bankAccountTypeCode": bankAccountTypeCode,
  };
}

class AddressProof {
  int? investorAddressProofId;
  String? addressProof;
  int? isDeleted;

  AddressProof({
    this.investorAddressProofId,
    this.addressProof,
    this.isDeleted,
  });

  factory AddressProof.fromJson(Map<String, dynamic> json) => AddressProof(
    investorAddressProofId: json["investorAddressProofId"],
    addressProof: json["addressProof"],
    isDeleted: json["isDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "investorAddressProofId": investorAddressProofId,
    "addressProof": addressProof,
    "isDeleted": isDeleted,
  };
}

class AllCountry {
  int? countryId;
  String? countryName;
  String? countryFatcaCode;
  bool? status;

  AllCountry({
    this.countryId,
    this.countryName,
    this.countryFatcaCode,
    this.status,
  });

  factory AllCountry.fromJson(Map<String, dynamic> json) => AllCountry(
    countryId: json["countryId"],
    countryName: json["countryName"],
    countryFatcaCode: json["countryFatcaCode"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "countryId": countryId,
    "countryName": countryName,
    "countryFatcaCode": countryFatcaCode,
    "status": status,
  };
}

class AllState {
  int? id;
  String? stateName;
  String? birlamfStateCode;
  String? dspmfStateCode;
  String? hdfcmfStateCode;
  String? hsbcmfStateCode;
  String? icicimfStateCode;
  String? idfcmfStateCode;
  String? iiflmfStateCode;
  String? jpmmfStateCode;
  String? kotakmfStateCode;
  String? lntmfStateCode;
  String? ppfasmfStateCode;
  String? sbimfStateCode;
  String? srirammfStateCode;
  String? tatamfStateCode;
  String? ukbcmfStateCode;
  String? karvyStateCode;
  String? fatcaCode;
  String? goldCode;
  bool? status;
  DateTime? ts;

  AllState({
    this.id,
    this.stateName,
    this.birlamfStateCode,
    this.dspmfStateCode,
    this.hdfcmfStateCode,
    this.hsbcmfStateCode,
    this.icicimfStateCode,
    this.idfcmfStateCode,
    this.iiflmfStateCode,
    this.jpmmfStateCode,
    this.kotakmfStateCode,
    this.lntmfStateCode,
    this.ppfasmfStateCode,
    this.sbimfStateCode,
    this.srirammfStateCode,
    this.tatamfStateCode,
    this.ukbcmfStateCode,
    this.karvyStateCode,
    this.fatcaCode,
    this.goldCode,
    this.status,
    this.ts,
  });

  factory AllState.fromJson(Map<String, dynamic> json) => AllState(
    id: json["id"],
    stateName: json["stateName"],
    birlamfStateCode: json["birlamfStateCode"],
    dspmfStateCode: json["dspmfStateCode"],
    hdfcmfStateCode: json["hdfcmfStateCode"],
    hsbcmfStateCode: json["hsbcmfStateCode"],
    icicimfStateCode: json["icicimfStateCode"],
    idfcmfStateCode: json["idfcmfStateCode"],
    iiflmfStateCode: json["iiflmfStateCode"],
    jpmmfStateCode: json["jpmmfStateCode"],
    kotakmfStateCode: json["kotakmfStateCode"],
    lntmfStateCode: json["lntmfStateCode"],
    ppfasmfStateCode: json["ppfasmfStateCode"],
    sbimfStateCode: json["sbimfStateCode"],
    srirammfStateCode: json["srirammfStateCode"],
    tatamfStateCode: json["tatamfStateCode"],
    ukbcmfStateCode: json["ukbcmfStateCode"],
    karvyStateCode: json["karvyStateCode"],
    fatcaCode: json["fatcaCode"],
    goldCode: json["goldCode"],
    status: json["status"],
    ts: json["ts"] == null ? null : DateTime.parse(json["ts"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "stateName": stateName,
    "birlamfStateCode": birlamfStateCode,
    "dspmfStateCode": dspmfStateCode,
    "hdfcmfStateCode": hdfcmfStateCode,
    "hsbcmfStateCode": hsbcmfStateCode,
    "icicimfStateCode": icicimfStateCode,
    "idfcmfStateCode": idfcmfStateCode,
    "iiflmfStateCode": iiflmfStateCode,
    "jpmmfStateCode": jpmmfStateCode,
    "kotakmfStateCode": kotakmfStateCode,
    "lntmfStateCode": lntmfStateCode,
    "ppfasmfStateCode": ppfasmfStateCode,
    "sbimfStateCode": sbimfStateCode,
    "srirammfStateCode": srirammfStateCode,
    "tatamfStateCode": tatamfStateCode,
    "ukbcmfStateCode": ukbcmfStateCode,
    "karvyStateCode": karvyStateCode,
    "fatcaCode": fatcaCode,
    "goldCode": goldCode,
    "status": status,
    "ts": ts?.toIso8601String(),
  };
}

class BankDetails {
  String? name;
  String? branchState;
  String? accountHolderName;
  String? ifscCode;
  String? branchCity;
  int? bankMasterId;
  String? accountType;
  int? bankDetailsId;
  String? branchName;
  int? investorId;
  String? bankName;
  String? accountNumber;
  int? accountTypeId;
  dynamic deleteInd;
  DateTime? ts;
  dynamic upiId;
  String? atomCode;

  BankDetails({
    this.name,
    this.branchState,
    this.accountHolderName,
    this.ifscCode,
    this.branchCity,
    this.bankMasterId,
    this.accountType,
    this.bankDetailsId,
    this.branchName,
    this.investorId,
    this.bankName,
    this.accountNumber,
    this.accountTypeId,
    this.deleteInd,
    this.ts,
    this.upiId,
    this.atomCode,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
    name: json["name"],
    branchState: json["branchState"],
    accountHolderName: json["accountHolderName"],
    ifscCode: json["ifscCode"],
    branchCity: json["branchCity"],
    bankMasterId: json["bankMasterId"],
    accountType: json["accountType"],
    bankDetailsId: json["bankDetailsId"],
    branchName: json["branchName"],
    investorId: json["investorId"],
    bankName: json["bankName"],
    accountNumber: json["accountNumber"],
    accountTypeId: json["accountTypeId"],
    deleteInd: json["deleteInd"],
    ts: json["ts"] == null ? null : DateTime.parse(json["ts"]),
    upiId: json["upiId"],
    atomCode: json["atomCode"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "branchState": branchState,
    "accountHolderName": accountHolderName,
    "ifscCode": ifscCode,
    "branchCity": branchCity,
    "bankMasterId": bankMasterId,
    "accountType": accountType,
    "bankDetailsId": bankDetailsId,
    "branchName": branchName,
    "investorId": investorId,
    "bankName": bankName,
    "accountNumber": accountNumber,
    "accountTypeId": accountTypeId,
    "deleteInd": deleteInd,
    "ts": ts?.toIso8601String(),
    "upiId": upiId,
    "atomCode": atomCode,
  };
}

class BankMasterList {
  int? bankMasterId;
  String? bankName;
  String? atomCode;
  int? status;

  BankMasterList({
    this.bankMasterId,
    this.bankName,
    this.atomCode,
    this.status,
  });

  factory BankMasterList.fromJson(Map<String, dynamic> json) => BankMasterList(
    bankMasterId: json["bankMasterId"],
    bankName: json["bankName"],
    atomCode: json["atomCode"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "bankMasterId": bankMasterId,
    "bankName": bankName,
    "atomCode": atomCode,
    "status": status,
  };
}

class CityList {
  int? id;
  String? locationName;
  String? birlamfCityCode;
  String? dspmfCityCode;
  String? hdfcmfCityCode;
  String? hsbcmfCityCode;
  String? icicimfCityCode;
  String? idfcmfCityCode;
  String? iiflmfCityCode;
  String? jpmmfCityCode;
  String? kotakmfCityCode;
  String? lntmfCityCode;
  String? ppfasmfCityCode;
  String? sbimfCityCode;
  String? srirammfCityCode;
  String? tatamfCityCode;
  String? ukbcmfCityCode;
  String? karvyCityCode;
  DateTime? ts;
  bool? status;

  CityList({
    this.id,
    this.locationName,
    this.birlamfCityCode,
    this.dspmfCityCode,
    this.hdfcmfCityCode,
    this.hsbcmfCityCode,
    this.icicimfCityCode,
    this.idfcmfCityCode,
    this.iiflmfCityCode,
    this.jpmmfCityCode,
    this.kotakmfCityCode,
    this.lntmfCityCode,
    this.ppfasmfCityCode,
    this.sbimfCityCode,
    this.srirammfCityCode,
    this.tatamfCityCode,
    this.ukbcmfCityCode,
    this.karvyCityCode,
    this.ts,
    this.status,
  });

  factory CityList.fromJson(Map<String, dynamic> json) => CityList(
    id: json["id"],
    locationName: json["locationName"],
    birlamfCityCode: json["birlamfCityCode"],
    dspmfCityCode: json["dspmfCityCode"],
    hdfcmfCityCode: json["hdfcmfCityCode"],
    hsbcmfCityCode: json["hsbcmfCityCode"],
    icicimfCityCode: json["icicimfCityCode"],
    idfcmfCityCode: json["idfcmfCityCode"],
    iiflmfCityCode: json["iiflmfCityCode"],
    jpmmfCityCode: json["jpmmfCityCode"],
    kotakmfCityCode: json["kotakmfCityCode"],
    lntmfCityCode: json["lntmfCityCode"],
    ppfasmfCityCode: json["ppfasmfCityCode"],
    sbimfCityCode: json["sbimfCityCode"],
    srirammfCityCode: json["srirammfCityCode"],
    tatamfCityCode: json["tatamfCityCode"],
    ukbcmfCityCode: json["ukbcmfCityCode"],
    karvyCityCode: json["karvyCityCode"],
    ts: json["ts"] == null ? null : DateTime.parse(json["ts"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "locationName": locationName,
    "birlamfCityCode": birlamfCityCode,
    "dspmfCityCode": dspmfCityCode,
    "hdfcmfCityCode": hdfcmfCityCode,
    "hsbcmfCityCode": hsbcmfCityCode,
    "icicimfCityCode": icicimfCityCode,
    "idfcmfCityCode": idfcmfCityCode,
    "iiflmfCityCode": iiflmfCityCode,
    "jpmmfCityCode": jpmmfCityCode,
    "kotakmfCityCode": kotakmfCityCode,
    "lntmfCityCode": lntmfCityCode,
    "ppfasmfCityCode": ppfasmfCityCode,
    "sbimfCityCode": sbimfCityCode,
    "srirammfCityCode": srirammfCityCode,
    "tatamfCityCode": tatamfCityCode,
    "ukbcmfCityCode": ukbcmfCityCode,
    "karvyCityCode": karvyCityCode,
    "ts": ts?.toIso8601String(),
    "status": status,
  };
}

class FamilyStatus {
  int? investorFamilyStatusId;
  String? familyStatus;

  FamilyStatus({
    this.investorFamilyStatusId,
    this.familyStatus,
  });

  factory FamilyStatus.fromJson(Map<String, dynamic> json) => FamilyStatus(
    investorFamilyStatusId: json["investorFamilyStatusId"],
    familyStatus: json["familyStatus"],
  );

  Map<String, dynamic> toJson() => {
    "investorFamilyStatusId": investorFamilyStatusId,
    "familyStatus": familyStatus,
  };
}

class FormModifyMapper {
  String? name;
  int? typeId;
  bool? status;
  String? nationality;
  DateTime? dob;
  String? investorType;
  int? requiredOverseas;
  String? hsbcMf;
  String? idfcmf;
  String? kotakmf;
  String? iilfmmf;
  String? lntmf;
  String? hdfcmf;
  String? icicimf;
  String? jpmMf;
  int? armed;
  String? birlamf;
  String? ppfsamf;
  String? dspMf;
  int? apiStatus;
  String? tataMf;
  String? ukbcMf;
  String? fatca;
  String? sriRamMf;
  String? kavyMf;
  String? sbimf;

  FormModifyMapper({
    this.name,
    this.typeId,
    this.status,
    this.nationality,
    this.dob,
    this.investorType,
    this.requiredOverseas,
    this.hsbcMf,
    this.idfcmf,
    this.kotakmf,
    this.iilfmmf,
    this.lntmf,
    this.hdfcmf,
    this.icicimf,
    this.jpmMf,
    this.armed,
    this.birlamf,
    this.ppfsamf,
    this.dspMf,
    this.apiStatus,
    this.tataMf,
    this.ukbcMf,
    this.fatca,
    this.sriRamMf,
    this.kavyMf,
    this.sbimf,
  });

  factory FormModifyMapper.fromJson(Map<String, dynamic> json) => FormModifyMapper(
    name: json["name"],
    typeId: json["typeId"],
    status: json["status"],
    nationality: json["nationality"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    investorType: json["investorType"],
    requiredOverseas: json["requiredOverseas"],
    hsbcMf: json["hsbcMf"],
    idfcmf: json["idfcmf"],
    kotakmf: json["kotakmf"],
    iilfmmf: json["iilfmmf"],
    lntmf: json["lntmf"],
    hdfcmf: json["hdfcmf"],
    icicimf: json["icicimf"],
    jpmMf: json["jpmMf"],
    armed: json["armed"],
    birlamf: json["birlamf"],
    ppfsamf: json["ppfsamf"],
    dspMf: json["dspMf"],
    apiStatus: json["apiStatus"],
    tataMf: json["tataMf"],
    ukbcMf: json["ukbcMf"],
    fatca: json["fatca"],
    sriRamMf: json["sriRamMf"],
    kavyMf: json["kavyMF"],
    sbimf: json["sbimf"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "typeId": typeId,
    "status": status,
    "nationality": nationality,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "investorType": investorType,
    "requiredOverseas": requiredOverseas,
    "hsbcMf": hsbcMf,
    "idfcmf": idfcmf,
    "kotakmf": kotakmf,
    "iilfmmf": iilfmmf,
    "lntmf": lntmf,
    "hdfcmf": hdfcmf,
    "icicimf": icicimf,
    "jpmMf": jpmMf,
    "armed": armed,
    "birlamf": birlamf,
    "ppfsamf": ppfsamf,
    "dspMf": dspMf,
    "apiStatus": apiStatus,
    "tataMf": tataMf,
    "ukbcMf": ukbcMf,
    "fatca": fatca,
    "sriRamMf": sriRamMf,
    "kavyMF": kavyMf,
    "sbimf": sbimf,
  };
}

class IdProofList {
  int? investorIdProofId;
  String? idProof;
  int? isDeleted;

  IdProofList({
    this.investorIdProofId,
    this.idProof,
    this.isDeleted,
  });

  factory IdProofList.fromJson(Map<String, dynamic> json) => IdProofList(
    investorIdProofId: json["investorIdProofId"],
    idProof: json["idProof"],
    isDeleted: json["isDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "investorIdProofId": investorIdProofId,
    "idProof": idProof,
    "isDeleted": isDeleted,
  };
}

class InvestorDetails {
  String? karvyFatcaPdfFormUrl;
  int? countryId;
  dynamic worthIncomeDate;
  int? agentId;
  String? phone;
  dynamic agentAssginDatetime;
  int? fatcaVerify;
  int? nationalityId;
  String? tokenImagePath;
  int? investorDetailsStateId;
  String? motherName;
  String? countryName;
  String? aadhaarImageUrl;
  int? countryOfBirthId;
  int? occupationId;
  String? nachImageUrl;
  String? politicallyExposedRemark;
  String? kycImageUrl;
  String? originalCity;
  int? armedForces;
  String? agreementImageUrl;
  dynamic firstPurchaseDoc;
  dynamic relationWithGuardian;
  int? isDoNotRegNominee;
  String? fatherSpouseName;
  String? cancelledChequeImageUrl;
  String? investorAgreementFormUrl;
  int? politicallyExposed;
  String? familyStatus;
  int? investorIdProofId;
  String? ecsMandateFormUrl;
  String? overseasNo;
  DateTime? isInvestorRegisteredDate;
  String? investorRegistrationFormUrl;
  int? atmCard;
  dynamic district;
  String? occupation;
  String? panImageUrl;
  String? camsFatcaPdfFormUrl;
  String? status;
  int? assistedEmpId;
  DateTime? ts;
  dynamic worthIncome;
  String? pan;
  String? addressProof;
  bool? isAssistedByEmp;
  String? investorType;
  int? loginId;
  int? investorDetailsCityId;
  int? relatedPoliticallyExposed;
  String? nationality;
  String? applicationNumber;
  dynamic kin;
  int? isIncompleteBankDetail;
  String? stateName;
  String? passportImageUrl;
  dynamic pos;
  String? gender;
  DateTime? doa;
  String? name;
  String? kycFormUrl;
  String? email;
  int? investorId;
  String? dateOfBirth;
  String? country;
  int? investorAddressProofId;
  int? investorTypeId;
  int? isVerify;
  String? address2;
  String? tokenImageName;
  int? isCompleteInvDetail;
  String? profileImageUrl;
  dynamic guardainName;
  dynamic aadharNo;
  int? investorFamilyStatusId;
  int? stateId;
  String? umrnRef;
  String? locationName;
  String? registrationImageUrl;
  String? officePhone;
  String? umrn;
  String? residencePhone;
  String? investorPdfFormUrl;
  String? income;
  dynamic guardianDob;
  int? cityId;
  int? deleteInd;
  String? placeOfBirth;
  String? address;
  int? pincode;
  String? idProof;

  InvestorDetails({
    this.karvyFatcaPdfFormUrl,
    this.countryId,
    this.worthIncomeDate,
    this.agentId,
    this.phone,
    this.agentAssginDatetime,
    this.fatcaVerify,
    this.nationalityId,
    this.tokenImagePath,
    this.investorDetailsStateId,
    this.motherName,
    this.countryName,
    this.aadhaarImageUrl,
    this.countryOfBirthId,
    this.occupationId,
    this.nachImageUrl,
    this.politicallyExposedRemark,
    this.kycImageUrl,
    this.originalCity,
    this.armedForces,
    this.agreementImageUrl,
    this.firstPurchaseDoc,
    this.relationWithGuardian,
    this.isDoNotRegNominee,
    this.fatherSpouseName,
    this.cancelledChequeImageUrl,
    this.investorAgreementFormUrl,
    this.politicallyExposed,
    this.familyStatus,
    this.investorIdProofId,
    this.ecsMandateFormUrl,
    this.overseasNo,
    this.isInvestorRegisteredDate,
    this.investorRegistrationFormUrl,
    this.atmCard,
    this.district,
    this.occupation,
    this.panImageUrl,
    this.camsFatcaPdfFormUrl,
    this.status,
    this.assistedEmpId,
    this.ts,
    this.worthIncome,
    this.pan,
    this.addressProof,
    this.isAssistedByEmp,
    this.investorType,
    this.loginId,
    this.investorDetailsCityId,
    this.relatedPoliticallyExposed,
    this.nationality,
    this.applicationNumber,
    this.kin,
    this.isIncompleteBankDetail,
    this.stateName,
    this.passportImageUrl,
    this.pos,
    this.gender,
    this.doa,
    this.name,
    this.kycFormUrl,
    this.email,
    this.investorId,
    this.dateOfBirth,
    this.country,
    this.investorAddressProofId,
    this.investorTypeId,
    this.isVerify,
    this.address2,
    this.tokenImageName,
    this.isCompleteInvDetail,
    this.profileImageUrl,
    this.guardainName,
    this.aadharNo,
    this.investorFamilyStatusId,
    this.stateId,
    this.umrnRef,
    this.locationName,
    this.registrationImageUrl,
    this.officePhone,
    this.umrn,
    this.residencePhone,
    this.investorPdfFormUrl,
    this.income,
    this.guardianDob,
    this.cityId,
    this.deleteInd,
    this.placeOfBirth,
    this.address,
    this.pincode,
    this.idProof,
  });

  factory InvestorDetails.fromJson(Map<String, dynamic> json) => InvestorDetails(
    karvyFatcaPdfFormUrl: json["karvy_fatca_pdf_form_url"],
    countryId: json["countryId"],
    worthIncomeDate: json["worth_income_date"],
    agentId: json["agent_id"],
    phone: json["phone"],
    agentAssginDatetime: json["agent_assgin_datetime"],
    fatcaVerify: json["fatca_verify"],
    nationalityId: json["nationality_id"],
    tokenImagePath: json["token_image_path"],
    investorDetailsStateId: json["state_id"],
    motherName: json["mother_name"],
    countryName: json["countryName"],
    aadhaarImageUrl: json["aadhaar_image_url"],
    countryOfBirthId: json["country_of_birth_id"],
    occupationId: json["occupation_id"],
    nachImageUrl: json["nach_image_url"],
    politicallyExposedRemark: json["politically_exposed_remark"],
    kycImageUrl: json["kyc_image_url"],
    originalCity: json["original_city"],
    armedForces: json["armed_forces"],
    agreementImageUrl: json["agreement_image_url"],
    firstPurchaseDoc: json["first_purchase_doc"],
    relationWithGuardian: json["relation_with_guardian"],
    isDoNotRegNominee: json["is_do_not_reg_nominee"],
    fatherSpouseName: json["father_spouse_name"],
    cancelledChequeImageUrl: json["cancelled_cheque_image_url"],
    investorAgreementFormUrl: json["investor_agreement_form_url"],
    politicallyExposed: json["politically_exposed"],
    familyStatus: json["familyStatus"],
    investorIdProofId: json["investor_id_proof_id"],
    ecsMandateFormUrl: json["ecs_mandate_form_url"],
    overseasNo: json["overseas_no"],
    isInvestorRegisteredDate: json["isInvestorRegisteredDate"] == null ? null : DateTime.parse(json["isInvestorRegisteredDate"]),
    investorRegistrationFormUrl: json["investor_registration_form_url"],
    atmCard: json["ATM_card"],
    district: json["district"],
    occupation: json["occupation"],
    panImageUrl: json["pan_image_url"],
    camsFatcaPdfFormUrl: json["cams_fatca_pdf_form_url"],
    status: json["status"],
    assistedEmpId: json["assisted_emp_id"],
    ts: json["ts"] == null ? null : DateTime.parse(json["ts"]),
    worthIncome: json["worth_income"],
    pan: json["pan"],
    addressProof: json["addressProof"],
    isAssistedByEmp: json["is_assisted_by_emp"],
    investorType: json["investorType"],
    loginId: json["login_id"],
    investorDetailsCityId: json["city_id"],
    relatedPoliticallyExposed: json["related_politically_exposed"],
    nationality: json["nationality"],
    applicationNumber: json["application_number"],
    kin: json["kin"],
    isIncompleteBankDetail: json["is_incomplete_bank_detail"],
    stateName: json["stateName"],
    passportImageUrl: json["passport_image_url"],
    pos: json["pos"],
    gender: json["gender"],
    doa: json["doa"] == null ? null : DateTime.parse(json["doa"]),
    name: json["name"],
    kycFormUrl: json["kyc_form_url"],
    email: json["email"],
    investorId: json["investor_id"],
    dateOfBirth: json["date_of_birth"] == null ? null : (json["date_of_birth"]),
    country: json["country"],
    investorAddressProofId: json["investor_address_proof_id"],
    investorTypeId: json["investor_type_id"],
    isVerify: json["is_verify"],
    address2: json["address_2"],
    tokenImageName: json["token_image_name"],
    isCompleteInvDetail: json["is_complete_inv_detail"],
    profileImageUrl: json["profile_image_url"],
    guardainName: json["guardain_name"],
    aadharNo: json["aadharNo"],
    investorFamilyStatusId: json["investor_family_status_id"],
    stateId: json["stateId"],
    umrnRef: json["umrn_ref"],
    locationName: json["locationName"],
    registrationImageUrl: json["registration_image_url"],
    officePhone: json["office_phone"],
    umrn: json["umrn"],
    residencePhone: json["residence_phone"],
    investorPdfFormUrl: json["investor_pdf_form_url"],
    income: json["income"],
    guardianDob: json["guardian_dob"],
    cityId: json["cityId"],
    deleteInd: json["delete_ind"],
    placeOfBirth: json["place_of_birth"],
    address: json["address"],
    pincode: json["pincode"],
    idProof: json["idProof"],
  );

  Map<String, dynamic> toJson() => {
    "karvy_fatca_pdf_form_url": karvyFatcaPdfFormUrl,
    "countryId": countryId,
    "worth_income_date": worthIncomeDate,
    "agent_id": agentId,
    "phone": phone,
    "agent_assgin_datetime": agentAssginDatetime,
    "fatca_verify": fatcaVerify,
    "nationality_id": nationalityId,
    "token_image_path": tokenImagePath,
    "state_id": investorDetailsStateId,
    "mother_name": motherName,
    "countryName": countryName,
    "aadhaar_image_url": aadhaarImageUrl,
    "country_of_birth_id": countryOfBirthId,
    "occupation_id": occupationId,
    "nach_image_url": nachImageUrl,
    "politically_exposed_remark": politicallyExposedRemark,
    "kyc_image_url": kycImageUrl,
    "original_city": originalCity,
    "armed_forces": armedForces,
    "agreement_image_url": agreementImageUrl,
    "first_purchase_doc": firstPurchaseDoc,
    "relation_with_guardian": relationWithGuardian,
    "is_do_not_reg_nominee": isDoNotRegNominee,
    "father_spouse_name": fatherSpouseName,
    "cancelled_cheque_image_url": cancelledChequeImageUrl,
    "investor_agreement_form_url": investorAgreementFormUrl,
    "politically_exposed": politicallyExposed,
    "familyStatus": familyStatus,
    "investor_id_proof_id": investorIdProofId,
    "ecs_mandate_form_url": ecsMandateFormUrl,
    "overseas_no": overseasNo,
    "isInvestorRegisteredDate": isInvestorRegisteredDate?.toIso8601String(),
    "investor_registration_form_url": investorRegistrationFormUrl,
    "ATM_card": atmCard,
    "district": district,
    "occupation": occupation,
    "pan_image_url": panImageUrl,
    "cams_fatca_pdf_form_url": camsFatcaPdfFormUrl,
    "status": status,
    "assisted_emp_id": assistedEmpId,
    "ts": ts?.toIso8601String(),
    "worth_income": worthIncome,
    "pan": pan,
    "addressProof": addressProof,
    "is_assisted_by_emp": isAssistedByEmp,
    "investorType": investorType,
    "login_id": loginId,
    "city_id": investorDetailsCityId,
    "related_politically_exposed": relatedPoliticallyExposed,
    "nationality": nationality,
    "application_number": applicationNumber,
    "kin": kin,
    "is_incomplete_bank_detail": isIncompleteBankDetail,
    "stateName": stateName,
    "passport_image_url": passportImageUrl,
    "pos": pos,
    "gender": gender,
    "doa": "${doa!.year.toString().padLeft(4, '0')}-${doa!.month.toString().padLeft(2, '0')}-${doa!.day.toString().padLeft(2, '0')}",
    "name": name,
    "kyc_form_url": kycFormUrl,
    "email": email,
    "investor_id": investorId,
    "date_of_birth": dateOfBirth,
    "country": country,
    "investor_address_proof_id": investorAddressProofId,
    "investor_type_id": investorTypeId,
    "is_verify": isVerify,
    "address_2": address2,
    "token_image_name": tokenImageName,
    "is_complete_inv_detail": isCompleteInvDetail,
    "profile_image_url": profileImageUrl,
    "guardain_name": guardainName,
    "aadharNo": aadharNo,
    "investor_family_status_id": investorFamilyStatusId,
    "stateId": stateId,
    "umrn_ref": umrnRef,
    "locationName": locationName,
    "registration_image_url": registrationImageUrl,
    "office_phone": officePhone,
    "umrn": umrn,
    "residence_phone": residencePhone,
    "investor_pdf_form_url": investorPdfFormUrl,
    "income": income,
    "guardian_dob": guardianDob,
    "cityId": cityId,
    "delete_ind": deleteInd,
    "place_of_birth": placeOfBirth,
    "address": address,
    "pincode": pincode,
    "idProof": idProof,
  };
}

class InvestorStatus {
  int? investorStatusId;
  int? isInvestorRegistered;
  DateTime? isInvestorRegisteredDate;
  int? isMandateSend;
  DateTime? isMandateSendDate;
  int? isMandateReceived;
  DateTime? isMandateReceivedDate;
  int? isInvestorVerified;
  DateTime? isInvestorVerifiedDate;
  int? isKycDone;
  DateTime? isKycDoneDate;
  int? isEcsSentToBank;
  dynamic isEcsSentToBankDate;
  int? isReadyForInvestment;
  DateTime? isReadyForInvestmentDate;
  int? isReadyForInvestMonthly;
  DateTime? isReadyForInvestMonthlyDate;
  int? isNachEnabled;
  DateTime? isNachEnabledDate;
  int? investorId;
  DateTime? lastUpdation;
  int? firstRegistration;
  DateTime? firstRegistrationDate;
  int? isInvestorFormComplet;
  DateTime? isInvestorFormCompletDate;
  dynamic resetTemPassword;
  int? deleteInd;

  InvestorStatus({
    this.investorStatusId,
    this.isInvestorRegistered,
    this.isInvestorRegisteredDate,
    this.isMandateSend,
    this.isMandateSendDate,
    this.isMandateReceived,
    this.isMandateReceivedDate,
    this.isInvestorVerified,
    this.isInvestorVerifiedDate,
    this.isKycDone,
    this.isKycDoneDate,
    this.isEcsSentToBank,
    this.isEcsSentToBankDate,
    this.isReadyForInvestment,
    this.isReadyForInvestmentDate,
    this.isReadyForInvestMonthly,
    this.isReadyForInvestMonthlyDate,
    this.isNachEnabled,
    this.isNachEnabledDate,
    this.investorId,
    this.lastUpdation,
    this.firstRegistration,
    this.firstRegistrationDate,
    this.isInvestorFormComplet,
    this.isInvestorFormCompletDate,
    this.resetTemPassword,
    this.deleteInd,
  });

  factory InvestorStatus.fromJson(Map<String, dynamic> json) => InvestorStatus(
    investorStatusId: json["investorStatusId"],
    isInvestorRegistered: json["isInvestorRegistered"],
    isInvestorRegisteredDate: json["isInvestorRegisteredDate"] == null ? null : DateTime.parse(json["isInvestorRegisteredDate"]),
    isMandateSend: json["isMandateSend"],
    isMandateSendDate: json["isMandateSendDate"] == null ? null : DateTime.parse(json["isMandateSendDate"]),
    isMandateReceived: json["isMandateReceived"],
    isMandateReceivedDate: json["isMandateReceivedDate"] == null ? null : DateTime.parse(json["isMandateReceivedDate"]),
    isInvestorVerified: json["isInvestorVerified"],
    isInvestorVerifiedDate: json["isInvestorVerifiedDate"] == null ? null : DateTime.parse(json["isInvestorVerifiedDate"]),
    isKycDone: json["isKycDone"],
    isKycDoneDate: json["isKycDoneDate"] == null ? null : DateTime.parse(json["isKycDoneDate"]),
    isEcsSentToBank: json["isEcsSentToBank"],
    isEcsSentToBankDate: json["isEcsSentToBankDate"],
    isReadyForInvestment: json["isReadyForInvestment"],
    isReadyForInvestmentDate: json["isReadyForInvestmentDate"] == null ? null : DateTime.parse(json["isReadyForInvestmentDate"]),
    isReadyForInvestMonthly: json["isReadyForInvestMonthly"],
    isReadyForInvestMonthlyDate: json["isReadyForInvestMonthlyDate"] == null ? null : DateTime.parse(json["isReadyForInvestMonthlyDate"]),
    isNachEnabled: json["isNachEnabled"],
    isNachEnabledDate: json["isNachEnabledDate"] == null ? null : DateTime.parse(json["isNachEnabledDate"]),
    investorId: json["investorId"],
    lastUpdation: json["lastUpdation"] == null ? null : DateTime.parse(json["lastUpdation"]),
    firstRegistration: json["firstRegistration"],
    firstRegistrationDate: json["firstRegistrationDate"] == null ? null : DateTime.parse(json["firstRegistrationDate"]),
    isInvestorFormComplet: json["isInvestorFormComplet"],
    isInvestorFormCompletDate: json["isInvestorFormCompletDate"] == null ? null : DateTime.parse(json["isInvestorFormCompletDate"]),
    resetTemPassword: json["resetTemPassword"],
    deleteInd: json["deleteInd"],
  );

  Map<String, dynamic> toJson() => {
    "investorStatusId": investorStatusId,
    "isInvestorRegistered": isInvestorRegistered,
    "isInvestorRegisteredDate": isInvestorRegisteredDate?.toIso8601String(),
    "isMandateSend": isMandateSend,
    "isMandateSendDate": isMandateSendDate?.toIso8601String(),
    "isMandateReceived": isMandateReceived,
    "isMandateReceivedDate": isMandateReceivedDate?.toIso8601String(),
    "isInvestorVerified": isInvestorVerified,
    "isInvestorVerifiedDate": isInvestorVerifiedDate?.toIso8601String(),
    "isKycDone": isKycDone,
    "isKycDoneDate": isKycDoneDate?.toIso8601String(),
    "isEcsSentToBank": isEcsSentToBank,
    "isEcsSentToBankDate": isEcsSentToBankDate,
    "isReadyForInvestment": isReadyForInvestment,
    "isReadyForInvestmentDate": isReadyForInvestmentDate?.toIso8601String(),
    "isReadyForInvestMonthly": isReadyForInvestMonthly,
    "isReadyForInvestMonthlyDate": isReadyForInvestMonthlyDate?.toIso8601String(),
    "isNachEnabled": isNachEnabled,
    "isNachEnabledDate": isNachEnabledDate?.toIso8601String(),
    "investorId": investorId,
    "lastUpdation": lastUpdation?.toIso8601String(),
    "firstRegistration": firstRegistration,
    "firstRegistrationDate": firstRegistrationDate?.toIso8601String(),
    "isInvestorFormComplet": isInvestorFormComplet,
    "isInvestorFormCompletDate": isInvestorFormCompletDate?.toIso8601String(),
    "resetTemPassword": resetTemPassword,
    "deleteInd": deleteInd,
  };
}

class Nominee {
  int? nomineeDetailsId;
  String? name;
  String? relationWithInvestor;
  DateTime? dateOfBirth;
  String? guardianName;
  String? relationWithGuardian;
  String? signednomineeUrl;
  String? nomineeaddressUrl;
  String? address;
  dynamic pinCode;
  int? investorId;
  int? status;
  String? percentage;
  dynamic deleteInd;
  DateTime? ts;

  Nominee({
    this.nomineeDetailsId,
    this.name,
    this.relationWithInvestor,
    this.dateOfBirth,
    this.guardianName,
    this.relationWithGuardian,
    this.signednomineeUrl,
    this.nomineeaddressUrl,
    this.address,
    this.pinCode,
    this.investorId,
    this.status,
    this.percentage,
    this.deleteInd,
    this.ts,
  });

  factory Nominee.fromJson(Map<String, dynamic> json) => Nominee(
    nomineeDetailsId: json["nomineeDetailsId"],
    name: json["name"],
    relationWithInvestor: json["relationWithInvestor"],
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    guardianName: json["guardianName"],
    relationWithGuardian: json["relationWithGuardian"],
    signednomineeUrl: json["signednomineeUrl"],
    nomineeaddressUrl: json["nomineeaddressUrl"],
    address: json["address"],
    pinCode: json["pinCode"],
    investorId: json["investorId"],
    status: json["status"],
    percentage: json["percentage"],
    deleteInd: json["deleteInd"],
    ts: json["ts"] == null ? null : DateTime.parse(json["ts"]),
  );

  Map<String, dynamic> toJson() => {
    "nomineeDetailsId": nomineeDetailsId,
    "name": name,
    "relationWithInvestor": relationWithInvestor,
    "dateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "guardianName": guardianName,
    "relationWithGuardian": relationWithGuardian,
    "signednomineeUrl": signednomineeUrl,
    "nomineeaddressUrl": nomineeaddressUrl,
    "address": address,
    "pinCode": pinCode,
    "investorId": investorId,
    "status": status,
    "percentage": percentage,
    "deleteInd": deleteInd,
    "ts": ts?.toIso8601String(),
  };
}

class OccupationsList {
  int? occupationId;
  String? occupation;
  String? birlamfOccCode;
  String? dspmfOccCode;
  String? hdfcmfOccCode;
  String? hsbcmfOccCode;
  String? icicimfOccCode;
  String? idfcmfOccCode;
  String? iiflmfOccCode;
  String? jpmmfOccCode;
  String? kotakmfOccCode;
  String? lntmfOccCode;
  String? ppfasmfOccCode;
  String? sbimfOccCode;
  String? srirammfOccCode;
  String? tatamfOccCode;
  String? ukbcmfOccCode;
  String? karvyOccCode;
  String? fatcaOccCode;
  FatcaOccType? fatcaOccType;
  String? fatcaSrcOfWelCode;
  String? fatcaSrcOfWelth;
  bool? status;

  OccupationsList({
    this.occupationId,
    this.occupation,
    this.birlamfOccCode,
    this.dspmfOccCode,
    this.hdfcmfOccCode,
    this.hsbcmfOccCode,
    this.icicimfOccCode,
    this.idfcmfOccCode,
    this.iiflmfOccCode,
    this.jpmmfOccCode,
    this.kotakmfOccCode,
    this.lntmfOccCode,
    this.ppfasmfOccCode,
    this.sbimfOccCode,
    this.srirammfOccCode,
    this.tatamfOccCode,
    this.ukbcmfOccCode,
    this.karvyOccCode,
    this.fatcaOccCode,
    this.fatcaOccType,
    this.fatcaSrcOfWelCode,
    this.fatcaSrcOfWelth,
    this.status,
  });

  factory OccupationsList.fromJson(Map<String, dynamic> json) => OccupationsList(
    occupationId: json["occupationId"],
    occupation: json["occupation"],
    birlamfOccCode: json["birlamfOccCode"],
    dspmfOccCode: json["dspmfOccCode"],
    hdfcmfOccCode: json["hdfcmfOccCode"],
    hsbcmfOccCode: json["hsbcmfOccCode"],
    icicimfOccCode: json["icicimfOccCode"],
    idfcmfOccCode: json["idfcmfOccCode"],
    iiflmfOccCode: json["iiflmfOccCode"],
    jpmmfOccCode: json["jpmmfOccCode"],
    kotakmfOccCode: json["kotakmfOccCode"],
    lntmfOccCode: json["lntmfOccCode"],
    ppfasmfOccCode: json["ppfasmfOccCode"],
    sbimfOccCode: json["sbimfOccCode"],
    srirammfOccCode: json["srirammfOccCode"],
    tatamfOccCode: json["tatamfOccCode"],
    ukbcmfOccCode: json["ukbcmfOccCode"],
    karvyOccCode: json["karvyOccCode"],
    fatcaOccCode: json["fatcaOccCode"],
    fatcaOccType: fatcaOccTypeValues.map[json["fatcaOccType"]]!,
    fatcaSrcOfWelCode: json["fatcaSrcOfWelCode"],
    fatcaSrcOfWelth: json["fatcaSrcOfWelth"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "occupationId": occupationId,
    "occupation": occupation,
    "birlamfOccCode": birlamfOccCode,
    "dspmfOccCode": dspmfOccCode,
    "hdfcmfOccCode": hdfcmfOccCode,
    "hsbcmfOccCode": hsbcmfOccCode,
    "icicimfOccCode": icicimfOccCode,
    "idfcmfOccCode": idfcmfOccCode,
    "iiflmfOccCode": iiflmfOccCode,
    "jpmmfOccCode": jpmmfOccCode,
    "kotakmfOccCode": kotakmfOccCode,
    "lntmfOccCode": lntmfOccCode,
    "ppfasmfOccCode": ppfasmfOccCode,
    "sbimfOccCode": sbimfOccCode,
    "srirammfOccCode": srirammfOccCode,
    "tatamfOccCode": tatamfOccCode,
    "ukbcmfOccCode": ukbcmfOccCode,
    "karvyOccCode": karvyOccCode,
    "fatcaOccCode": fatcaOccCode,
    "fatcaOccType": fatcaOccTypeValues.reverse[fatcaOccType],
    "fatcaSrcOfWelCode": fatcaSrcOfWelCode,
    "fatcaSrcOfWelth": fatcaSrcOfWelth,
    "status": status,
  };
}

enum FatcaOccType {
  B,
  O,
  S
}

final fatcaOccTypeValues = EnumValues({
  "B": FatcaOccType.B,
  "O": FatcaOccType.O,
  "S": FatcaOccType.S
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
