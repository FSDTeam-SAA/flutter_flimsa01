class LogOutResponseModel {
  bool? success;
  String? message;

  LogOutResponseModel({this.success, this.message});

  LogOutResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
