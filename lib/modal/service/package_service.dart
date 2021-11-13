import 'package:heaven_riders_india/modal/data/package.dart';
import 'package:heaven_riders_india/modal/service/config/base_config.dart';

class PackageService extends BaseConfig {
  PackageDataModal _fetch(dynamic json) {
    return PackageDataModal.fromJson(json);
  }

  Future<List<PackageDataModal>> fetchList(String data) async {
    return Future.delayed(const Duration(seconds: 3)).then((value) async {
      setGeneratedApiUrl([itemPath, '/', data]);
      var res = await dio.get(generatedApiUrl);
      return (res.data as List).map((e) => _fetch(e)).toList();
    });
  }
}
