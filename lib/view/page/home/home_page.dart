import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heaven_riders_india/modal/data/image.dart';
import 'package:heaven_riders_india/modal/data/package.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';

import 'widgets/card_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppStateViewModal appStateViewModal = AppStateViewModal();

  late Future<List<PackageDataModal>> packageList;

  @override
  void initState() {
    super.initState();
    packageList = _getPackageList();
  }

  Future<List<PackageDataModal>> _getPackageList() async {
    return await appStateViewModal.getPackages();
  }

  Future<List<ImageDataModal>> _getImageList(index) async {
    return await appStateViewModal.getImages(packageId: index.toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: packageList,
      builder: (context,
              AsyncSnapshot<List<PackageDataModal>> packageSnapshot) =>
          packageSnapshot.hasData
              ? GridView.builder(
                  itemCount: packageSnapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (context, index) => CardView(
                    packageData: PackageDataModal(
                        title: packageSnapshot.data![index].title,
                        description: packageSnapshot.data![index].description,
                        packageId: packageSnapshot.data![index].packageId),
                    imageList: _getImageList(index + 1),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}
