import 'package:heaven_riders_india/modal/data/image.dart';
import 'package:heaven_riders_india/modal/service/config/base_config.dart';

class ImageService extends BaseConfig {
  ImageDataModal _fetch(dynamic json) {
    return ImageDataModal.fromJson(json);
  }

  Future<List<ImageDataModal>> fetchList(String data) async {
    return Future.delayed(const Duration(seconds: 3)).then((value) async {
      setGeneratedApiUrl([itemPath, '/$data', imagePath]);
      var res = await dio.get(generatedApiUrl);
      return (res.data as List).map((e) => _fetch(e)).toList();
    });
  }
}
