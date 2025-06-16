import 'package:flimsa01mvp/features/auth/domains/login_respnse_model.dart';
import 'package:flimsa01mvp/features/auth/presentations/screens/code_verify.dart';
import 'package:flimsa01mvp/features/auth/presentations/screens/create_password.dart';
import 'package:flimsa01mvp/features/auth/presentations/screens/user_login.dart';
import 'package:flimsa01mvp/features/auth/services/auth_service_interface.dart';
import 'package:flimsa01mvp/features/home/movie_home_page.dart';
import 'package:flimsa01mvp/helpers/remote/data/api_checker.dart';
import 'package:flimsa01mvp/utils/display_helper.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../helpers/remote/data/api_client.dart';

class AuthController extends GetxController implements GetxService {
  final AuthServiceInterface authServiceInterface;

  AuthController({required this.authServiceInterface});

  bool _isLoading = false;
  final bool _acceptTerms = false;
  bool get isLoading => _isLoading;
  bool get acceptTerms => _acceptTerms;
  final String _mobileNumber = '';
  String get mobileNumber => _mobileNumber;
  XFile? _pickedProfileFile;
  XFile? get pickedProfileFile => _pickedProfileFile;
  XFile identityImage = XFile('');
  List<XFile> identityImages = [];
  List<MultipartBody> multipartList = [];
  String countryDialCode = '+880';
  String email = '';

  late LoginResponseModel loginResponseModel;

  void setCountryCode(String code) {
    countryDialCode = code;
    update();
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    update();

    // Response? response = Response();

    Response? response = await authServiceInterface.login(email, password);
    if (response!.statusCode == 200) {
      String token = '';
      String refreshToken = '';

      print(token.toString());

      loginResponseModel = LoginResponseModel.fromJson(response.body);

      refreshToken = loginResponseModel.refreshToken!;

      token = loginResponseModel.token!;

      print('accessToken ${loginResponseModel.token} NOWW Jonhnney  Bruites');
      print('refreshToken $refreshToken NOWW Jonhnney  Bruites');
      print(
        'User Token $token  ================================== from comtroller ',
      );
      // setUserToken(token, refreshToken);

      Get.offAll(const MovieHomePage());

      print('objectmmmmmmmmmmm mm m mmm m mm ');
      showCustomSnackBar('Welcome you have successfully Logged In');

      _isLoading = false;
    } else if (response.statusCode == 202) {
      if (response.body['data']['is_phone_verified'] == 0) {}
    } else if (response.statusCode == 400) {
      //Get.offAll(SignUp());
      showCustomSnackBar('Sorry you have no account, please create a account');
    } else {
      _isLoading = false;
      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }

  Future<void> register(
    String fullName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    _isLoading = true;
    update();
    Response? response = await authServiceInterface.register(
      fullName,
      email,
      password,
      confirmPassword,
    );
    if (response!.statusCode == 201) {
      Get.to(const LoginScreen());
      showCustomSnackBar('Welcome you have successfully Registered');
    } else if (response.statusCode == 400) {
      showCustomSnackBar(
        'This email is associate with other account, please provide a new email',
      );
    } else {
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> forgetPassword(String emails) async {
    email = emails;
    _isLoading = true;
    update();

    Response? response = await authServiceInterface.forgetPassword(emails);

    if (response?.statusCode == 200) {
      _isLoading = false;
      showCustomSnackBar('successfully sent otp');
      Get.to(CodeVerify(email: emails));
    } else {
      _isLoading = false;
      showCustomSnackBar('invalid mail');
    }
    update();
  }

  Future<void> otpVerification(String otp, String email) async {
    _isLoading = true;
    update();
    Response? response = await authServiceInterface.verifyCode(otp, email);
    if (response!.statusCode == 200) {
      showCustomSnackBar('Otp verification has been successful');
      Get.to( CreatePassword(email: email));
    } else {
      showCustomSnackBar('There is a problem in sending OTP');
      // Get.find<AuthController>().logOut();
    }

    update();
  }

  Future<void> resetPassword(String email, String password, String newPassword) async {
    _isLoading = true;

    update();

    Response? response = await authServiceInterface.resetPassword(
      email,
      password,
      newPassword,
    );
    if (response!.statusCode == 200) {
      // SnackBarWidget('password_change_successfully'.tr, isError: false);
      showCustomSnackBar('Password Change Successfully');
      Get.offAll(() => const LoginScreen());
    } else {
      showCustomSnackBar('Password Change was  Unsuccessfully');
      ApiChecker.checkApi(response);
    }

    _isLoading = false;

    update();
  }
}
