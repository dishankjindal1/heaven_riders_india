import 'package:heaven_riders_india/modal/app_repository.dart';
import 'package:heaven_riders_india/modal/data/image.dart';
import 'package:heaven_riders_india/modal/data/package.dart';
import 'package:heaven_riders_india/modal/data/user.dart';
import 'package:heaven_riders_india/view_model/base_view_modal.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';

class AppStateViewModal extends BaseViewModal {
  final AppRepository _appRepository = AppRepository();

  UserDataModal _userDataModal = UserDataModal.initial();
  UserDataModal get userDataModal => _userDataModal;

  List<PackageDataModal> _packageList = [];
  List<PackageDataModal> get packageList => _packageList;

  List<List<ImageDataModal>> _imageListOfList = [[]];
  List<List<ImageDataModal>> get imageListOfList => _imageListOfList;

  // Data Persistence

  getPackages() async {
    setviewState(Status.loading);
    _packageList =
        await _appRepository.getCollection(data: 'packages', item: '');
    _imageListOfList = List.generate(
      _packageList.length,
      (index) => List.filled(
        1,
        ImageDataModal(
          imageId: '1',
          packageId: '1',
          image: 'https://sliq.mewaredu.com/app/webroot/img/1.jpg',
        ),
        growable: true,
      ),
    );
    notifyListeners();
    getListOfImages();
    setviewState(Status.completed);
  }

  getListOfImages() async {
    for (var item in _packageList) {
      int index = int.parse(item.packageId);
      _imageListOfList[index - 1] = await _appRepository.getCollection(
        data: 'images',
        item: index.toString(),
      );
      notifyListeners();
    }
  }

  getImages({required String packageId}) async {
    setviewState(Status.loading);
    setviewState(Status.completed);
  }

  Future<void> mockData({int id = 1}) async {
    setviewState(Status.loading);
    _userDataModal = await _appRepository.mockData();
    setauthState(Status.completed);
    setviewState(Status.completed);
  }

  Future<void> signIn({required String email, required String password}) async {
    setviewState(Status.loading);
    await _appRepository.userSignIn(email: email, password: password);
    setauthState(Status.completed);
    setviewState(Status.completed);
  }

  Future<void> signOut() async {
    setviewState(Status.loading);
    await _appRepository.userSignOut();
    setauthState(Status.initial);
    setviewState(Status.completed);
  }
}
