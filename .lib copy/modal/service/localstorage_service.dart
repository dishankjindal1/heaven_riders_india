import 'package:localstorage/localstorage.dart';

class LocalStorageService {
  final LocalStorage _localStorage = LocalStorage('dbPath');
  dynamic _dataEn;

  Future check(String value) async {
    if (await getDetails(value)) {
      return true;
    } else {
      return false;
    }
  }

  Future setDetails(dynamic data) async {
    await _localStorage.setItem(data['gstin'].toString(), data);
  }

  Future getDetails(String value) async {
    _dataEn = await _localStorage.getItem(value);
    return _dataEn != null ? true : false;
  }
}
