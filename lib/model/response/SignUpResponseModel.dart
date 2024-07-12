class SignUpResponseModel {
  bool? success;
  String? message;
  String? msg;

  SignUpResponseModel({this.success, this.message, this.msg});

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['msg'] = this.msg;
    return data;
  }
}
