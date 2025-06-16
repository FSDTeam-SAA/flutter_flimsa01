import 'package:flimsa01mvp/helpers/remote/data/api_client.dart';
import 'package:flimsa01mvp/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_repository_interface.dart';

class AuthRepository implements AuthRepositoryInterface {
  final ApiClient apiClient;

  final SharedPreferences sharedPreferences;
  AuthRepository({required this.apiClient, required this.sharedPreferences});

  @override
  Future register(
    String fullName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    return await apiClient.postData(AppConstants.registration, {
      "first_name": fullName,
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
    });
  }

  @override
  Future accessAndRefreshToken(String refreshToken) async {
    return await apiClient.postData(AppConstants.refreshAccessToken, {
      "refreshToken": refreshToken,
    });
  }

  @override
  Future login(String email, String password) async {
    return await apiClient.postData(AppConstants.loginUri, {
      "email": email,
      "password": password,
    });
  }

  @override
  Future forgetPassword(String? email) async {
    return await apiClient.postData(AppConstants.forgetPassword, {
      "email": email,
    });
  }

  @override
  Future verifyCode(String otp, String email) async {
    return await apiClient.postData(AppConstants.otpVerification, {
      "otp": int.tryParse(otp),
      "email": email,
    });
  }

  @override
  Future resetPassword(String email, String password, String newPassword) async {
    return await apiClient.postData(AppConstants.resetPassword, {
      "email": email,
      "password": password,
      "password_confirmation": newPassword,
    });
  }

  @override
  bool isLoggedIn() {
    sharedPreferences.getString(AppConstants.token);
    bool isLoggedIn = sharedPreferences.getBool('IsLoggedIn') ?? false;
    if (isLoggedIn) {
      return true;
    }
    return false;
  }

  @override
  Future logout() {
    sharedPreferences.setBool('IsLoggedIn', false);
    return apiClient.getData(AppConstants.logout);
  }

  @override
  Future<bool?> saveUserToken(String token, String refreshToken) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    await sharedPreferences.setString(AppConstants.refreshToken, token);
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  //...............................for update RefreshToken...............................

  // @override
  // Future updateAccessAndRefreshToken() async{
  //   String? refresh = sharedPreferences.getString('refreshToken');
  //   return await apiClient.postData(Urls.updateRefreshAccessToken,
  //       {
  //         "refreshToken" : refresh
  //       }
  //
  //   );
  // }

  @override
  bool isFirstTimeInstall() {
    if (sharedPreferences.getBool('firstTimeInstall') == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void setFirstTimeInstall() {
    sharedPreferences.setBool('firstTimeInstall', true);
  }

  @override
  bool clearSharedAddress() {
    throw UnimplementedError();
  }

  @override
  Future<bool> clearUserCredentials() {
    throw UnimplementedError();
  }

  @override
  String getUserToken() {
    throw UnimplementedError();
  }

  @override
  Future resendOtp(String email) {
    return apiClient.postData(AppConstants.forgetPassword, {"email": email});
  }

  @override
  Future sendOtp({required String phone}) {
    throw UnimplementedError();
  }

  @override
  Future updateToken() {
    throw UnimplementedError();
  }

  Future changePassword(String oldPassword, String password) {
    throw UnimplementedError();
  }

  @override
  Future updateAccessAndRefreshToken() {
    throw UnimplementedError();
  }
}
