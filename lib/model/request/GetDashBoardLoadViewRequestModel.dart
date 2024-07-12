
class GetDashbordLoadViewRequestModel {
  String? bearertoken;

  GetDashbordLoadViewRequestModel({this.bearertoken});



  Map<String, dynamic> toJson () => {
    "id_token": this.bearertoken
  };


}
