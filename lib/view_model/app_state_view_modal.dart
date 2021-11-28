import 'package:heaven_riders_india/modal/app_repository.dart';
import 'package:heaven_riders_india/modal/data/image.dart';
import 'package:heaven_riders_india/modal/data/package.dart';
import 'package:heaven_riders_india/view_model/base_view_modal.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';

class AppStateViewModal extends BaseViewModal {
  final AppRepository _appRepository = AppRepository();

  late AppStateViewModal app;

  List<PackageDataModal> _packageList = [];
  List<PackageDataModal> get packageList => _packageList;

  List<List<ImageDataModal>> _imageListOfList = [[]];
  List<List<ImageDataModal>> get imageListOfList => _imageListOfList;

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;

  getPackages() async {
    setViewState(Status.busy);
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

    // We will replace it with local storage in newer version
    _isAdmin = (firebaseAuth.currentUser?.phoneNumber ?? "no number") ==
        "+919803050043";

    notifyListeners();
    getListOfImages();
    setViewState(Status.ideal);
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

  phoneSignIn(String value, Function(String, int?) codeSent) async {
    setViewState(Status.busy);
    await _appRepository.signIn(SignInMethod.phone, [value, codeSent], app);
    _isAdmin = (firebaseAuth.currentUser?.phoneNumber ?? "no number") ==
        "+919803050043";
    notifyListeners();
    // when the auth is fully complete
    // setviewState(Status.ideal);
  }

  signOut() async {
    setViewState(Status.busy);
    await _appRepository.signOut(app);
    _isAdmin = false;
    notifyListeners();

    // when the auth is fully complete
    // setviewState(Status.ideal);
  }

  checkAuthState() async {
    setViewState(Status.busy);
    if (firebaseAuth.currentUser != null) {
      _isAdmin = true;
    }
    setViewState(Status.ideal);
  }
}
