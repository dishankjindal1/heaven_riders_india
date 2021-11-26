import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heaven_riders_india/main.dart';
import 'package:heaven_riders_india/router/app_router.gr.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'widgets/card_view_widget.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({Key? key}) : super(key: key);

  @override
  State<HomeDashboardPage> createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppStateViewModal>(context);
    app.app = app;
    var orientation = MediaQuery.of(context).orientation;
    var router = AutoRouter.of(context);

    return SafeArea(
      child: SmartRefresher(
        enablePullDown: true,
        enableTwoLevel: true,
        header: const WaterDropHeader(),
        controller: refreshController,
        onRefresh: () async {
          await app.getPackages();
          refreshController.refreshCompleted();
        },
        onLoading: () => refreshController.loadComplete(),
        child: GridView.builder(
          itemCount: app.packageList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 4 / 2.75,
              crossAxisCount: orientation == Orientation.portrait ? 1 : 2),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => router.push(DetailRoute(
                imageList: app.imageListOfList[index],
                packageData: app.packageList[index])),
            child: CardView(
                packageData: app.packageList[index],
                imageList: app.imageListOfList[index]),
          ),
        ),
      ),
    );
  }
}
