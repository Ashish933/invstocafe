// class SignInRequestModel {
//   String? username;
//   String? password;
//   bool? rememberme;
//
//   SignInRequestModel({this.username, this.password, this.rememberme});
//
//   SignInRequestModel.fromJson(Map<String, dynamic> json) {
//     username = json['username'];
//     password = json['password'];
//     rememberme = json['rememberme'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['username'] = this.username;
//     data['password'] = this.password;
//     data['rememberme'] = this.rememberme;
//     return data;
//   }
// }
//
class SignInRequestModel {
  String? email;
  String? password;
  bool? rememberme;

  SignInRequestModel({this.email, this.password, this.rememberme});

  SignInRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    rememberme = json['rememberme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['rememberme'] = this.rememberme;
    return data;
  }
}

