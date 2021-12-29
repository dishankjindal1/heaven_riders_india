import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BaseConfig {
  String dbPath = 'myApp.json';
  String apiUrl = 'https://618911ccd0821900178d7757.mockapi.io/api/v1';
  String userPath = '/user';
  String itemPath = '/package';
  String imagePath = '/image';
  String generatedApiUrl = '';

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Dio dio = Dio();

  void setGeneratedApiUrl(List<String> string) {
    generatedApiUrl = apiUrl;
    for (var item in string) {
      generatedApiUrl += item;
    }
  }
}
