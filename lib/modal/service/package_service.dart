import 'package:dio/dio.dart';
import 'package:heaven_riders_india/modal/data/package.dart';
import 'package:heaven_riders_india/modal/service/config/base_config.dart';

class PackageService extends BaseConfig {
  PackageDataModal _fetch(dynamic json) {
    return PackageDataModal.fromJson(json);
  }

  Future<List<PackageDataModal>> fetchList(String data) async {
    return Future.delayed(const Duration(seconds: 3)).then((value) async {
      setGeneratedApiUrl([itemPath, '/', data]);
      try {
        var res = await dio.get(generatedApiUrl);
        return (res.data as List).map((e) => _fetch(e)).toList();
      } on DioError {
        throw Exception('Package not found');
      }
      // switch (res.statusCode) {
      //   case 200:
      //     return (res.data as List).map((e) => _fetch(e)).toList();
      //   case 404:
      //   default:
      //     throw Exception(
      //         'There is some network problem with the request : ${res.statusCode}');
      // }
    });
  }
}
