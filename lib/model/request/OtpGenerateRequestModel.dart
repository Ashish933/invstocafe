
class OtpGenarateRequestModel {
  String? uuid;
  String? otp;

  OtpGenarateRequestModel({this.uuid, this.otp});



  Map<String, dynamic> toJson () => {
    "uuid": this.uuid,
    "otp": this.otp
  };

  //   data['uuid'] = this.uuid;
  //   data['otp'] = this.otp;
  //   return data;
  // }
}
