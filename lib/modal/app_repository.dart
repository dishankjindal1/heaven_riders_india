import 'package:dio/dio.dart';
import 'package:heaven_riders_india/modal/data/user.dart';
import 'package:heaven_riders_india/modal/service/auth_service.dart';
import 'package:heaven_riders_india/modal/service/config/base_config.dart';
import 'package:heaven_riders_india/modal/service/image_service.dart';
import 'package:heaven_riders_india/modal/service/package_service.dart';

//remove BaseConfig from here
class AppRepository extends BaseConfig {
  final AuthService _authService = AuthService();
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

  Future<void> userSignIn(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 3))
        .then((value) => _authService.signin(email, password));
  }

  Future<void> userSignOut() async {
    await Future.delayed(const Duration(seconds: 3))
        .then((value) => _authService.signout());
  }

  Future<void> userUpdate({required callbackFn, required data}) async {
    await Future.delayed(const Duration(seconds: 3))
        .then((value) => _authService.update(callbackFn, data));
  }
}
