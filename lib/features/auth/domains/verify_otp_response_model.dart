class VerifyOTPResponseModel {
  bool? success;
  String? message;

  VerifyOTPResponseModel({this.success, this.message});

  VerifyOTPResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
