import 'package:dio/dio.dart';
import 'package:heaven_riders_india/modal/data/user.dart';
import 'package:heaven_riders_india/modal/service/authentication/via/phone.dart';
import 'package:heaven_riders_india/modal/service/config/base_config.dart';
import 'package:heaven_riders_india/modal/service/image_service.dart';
import 'package:heaven_riders_india/modal/service/package_service.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';

//remove BaseConfig from here
class AppRepository extends BaseConfig {
  final ImageService _imageService = ImageService();
  final PackageService _packageService = PackageService();

  Future getCollection({required String data, required String item}) async {
    if (data == 'packages') {
      return await _packageService.fetchList(item);
    } else {
      return await _imageService.fetchList(item);
    }
  }

  Future<UserDataModal> mockData({id = '1'}) async {
    setGeneratedApiUrl(['/user/', id]);
    var res = await Future.delayed(const Duration(seconds: 3))
        .then((value) => Dio().get(generatedApiUrl));
    return UserDataModal.fromJson(res.data);
  }

  signIn(SignInMethod method, dynamic data, AppStateViewModal app) async {
    switch (method) {
      case SignInMethod.phone:
        return await PhoneAuth(app).signInWithPhone(data as String);
      case SignInMethod.google:
        break;
      default:
    }
  }

  signOut(AppStateViewModal app) async {
    return await PhoneAuth(app).signOutFromPhone();
  }
}

enum SignInMethod { phone, google }
