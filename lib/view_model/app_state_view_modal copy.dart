// ignore_for_file: file_names
// import 'package:heaven_riders_india/modal/app_repository.dart';
// import 'package:heaven_riders_india/modal/data/image.dart';
// import 'package:heaven_riders_india/modal/data/package.dart';
// import 'package:heaven_riders_india/modal/data/user.dart';
// import 'package:heaven_riders_india/view_model/base_view_modal.dart';
// import 'package:heaven_riders_india/modal/utils/app_state.dart';

// class AppStateViewModal extends BaseViewModal {
//   final AppRepository _appRepository = AppRepository();
//   UserDataModal _userDataModal = UserDataModal.initial();

//   UserDataModal get userDataModal => _userDataModal;

//   List<PackageDataModal> _packageList;

//   List<PackageDataModal> get packageList => _packageList;

//   List<List<ImageDataModal>> _imageListOfList;

//   List<List<ImageDataModal>> get imageListOfList => _imageListOfList;

//   Future<List<PackageDataModal>> getPackages() async {
//     return await _appRepository.getCollection(data: 'packages', item: '');
//   }

//   getItemsRefresh() async {
//     await getPackages();
//   }

//   Future<List<ImageDataModal>> getImages({required String packageId}) async {
//     return await _appRepository.getCollection(data: 'images', item: packageId);
//   }

//   Future<void> mockData({id = 1}) async {
//     setviewState(Status.loading);
//     _userDataModal = await _appRepository.mockData();
//     setauthState(Status.completed);
//     setviewState(Status.completed);
//   }

//   Future<void> signIn({required String email, required String password}) async {
//     setviewState(Status.loading);
//     await _appRepository.userSignIn(email: email, password: password);
//     setauthState(Status.completed);
//     setviewState(Status.completed);
//   }

//   Future<void> signOut() async {
//     setviewState(Status.loading);
//     await _appRepository.userSignOut();
//     setauthState(Status.initial);
//     setviewState(Status.completed);
//   }
// }
