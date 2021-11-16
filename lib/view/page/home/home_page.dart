import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heaven_riders_india/router/app_router.gr.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:heaven_riders_india/view_model/setting_state_view_modal.dart';
import 'package:provider/provider.dart';

import 'widgets/card_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var asvm = Provider.of<AppStateViewModal>(context);
    var router = AutoRouter.of(context);
    return GridView.builder(
      itemCount: asvm.packageList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              Provider.of<SettingStateViewModal>(context).gridViewCount),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          router.push(
            DisplayRoute(
              imageList: asvm.imageListOfList[index],
              packageData: asvm.packageList[index],
            ),
          );
        },
        child: CardView(
          packageData: asvm.packageList[index],
          imageList: asvm.imageListOfList[index],
        ),
      ),
    );
  }
}
