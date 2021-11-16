import 'package:heaven_riders_india/view_model/base_view_modal.dart';

class SettingStateViewModal extends BaseViewModal {
  bool _gridViewCount = false;
  bool get gridViewCount => _gridViewCount;

  setGridViewCount() {
    _gridViewCount = !_gridViewCount;
    notifyListeners();
  }
}
