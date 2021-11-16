import 'package:heaven_riders_india/view_model/base_view_modal.dart';

class SettingStateViewModal extends BaseViewModal {
  int _gridViewCount = 1;
  int get gridViewCount => _gridViewCount;

  setGridViewCount(int value) {
    _gridViewCount = value;
    notifyListeners();
  }
}
