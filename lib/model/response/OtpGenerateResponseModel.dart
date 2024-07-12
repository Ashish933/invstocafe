class OtpGenarateResponseModel {
  String? idToken;
  bool? isLoginPinExist;

  OtpGenarateResponseModel({this.idToken, this.isLoginPinExist});

  OtpGenarateResponseModel.fromJson(Map<String, dynamic> json) {
    idToken = json['id_token'];
    isLoginPinExist = json['is_login_pin_exist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_token'] = this.idToken;
    data['is_login_pin_exist'] = this.isLoginPinExist;
    return data;
  }
}
