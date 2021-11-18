import 'package:dio/dio.dart';
import 'package:heaven_riders_india/modal/data/image.dart';
import 'package:heaven_riders_india/modal/service/config/base_config.dart';

class ImageService extends BaseConfig {
  ImageDataModal _fetch(dynamic json) {
    return ImageDataModal.fromJson(json);
  }

  Future<List<ImageDataModal>> fetchList(String data) async {
    return Future.delayed(const Duration(seconds: 3)).then((value) async {
      setGeneratedApiUrl([itemPath, '/$data', imagePath]);
      try {
        var res = await dio.get(generatedApiUrl);
        return (res.data as List).map((e) => _fetch(e)).toList();
      } on DioError {
        throw Exception('Image not found');
      }
      // switch (res.statusCode) {
      //   case 200:
      //     return (res.data as List).map((e) => _fetch(e)).toList();

      //   case 404:
      //     throw Exception('Image not found');
      //   default:
      //     throw Exception(
      //         'There is some network problem with the request : ${res.statusCode}');
      // }
    });
  }
}
