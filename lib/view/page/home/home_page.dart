import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heaven_riders_india/router/app_router.gr.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:heaven_riders_india/view_model/setting_state_view_modal.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/card_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    var asvm = Provider.of<AppStateViewModal>(context);
    var ssvm = Provider.of<SettingStateViewModal>(context);
    var router = AutoRouter.of(context);
    return SmartRefresher(
      enablePullDown: true,
      enableTwoLevel: true,
      header: const WaterDropHeader(),
      controller: refreshController,
      onRefresh: () async {
        await asvm.getPackages();
        refreshController.refreshCompleted();
      },
      onLoading: () {
        refreshController.loadComplete();
      },
      child: GridView.builder(
        itemCount: asvm.packageList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ssvm.gridViewCount ? 2 : 1),
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
      ),
    );
  }
}
