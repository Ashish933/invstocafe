class SignUpRequestModel {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? status;

  SignUpRequestModel(
      {this.name, this.email, this.password, this.phone, this.status});

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['status'] = this.status;
    return data;
  }
}
