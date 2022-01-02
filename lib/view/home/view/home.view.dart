import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/view/home/view/widgets/my_card.widget.dart';
import 'package:heaven_riders_india/view/home/view/widgets/my_drawer.widget.dart';
import 'package:heaven_riders_india/view/home/view/widgets/my_sliver_app_bar.widget.dart';
import 'package:heaven_riders_india/utils/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<HomeView> {
  int _bottomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawerWidget(),
        body: _myBody(),
        bottomNavigationBar: _myBottomNavBar(),
      ),
    );
  }

  Stack _myBody() {
    return Stack(
      children: [
        _backgroundImageFixed(),
        _myBodyContainer(
          data: Column(
            children: [
              MyCard(
                onTap: () {
                  'dishank tapped here'.log();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Scaffold(
                      body: Center(child: Text('Dishank')),
                    );
                  }));
                },
                odd: Colors.white,
                data: Object(),
              ),
              MyCard(
                onTap: () {
                  'dishank tapped here'.log();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Scaffold(
                      body: Center(child: Text('Dishank')),
                    );
                  }));
                },
                data: Object(),
              ),
              MyCard(
                onTap: () {
                  'dishank tapped here'.log();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Scaffold(
                      body: Center(child: Text('Dishank')),
                    );
                  }));
                },
                odd: Colors.white,
                data: Object(),
              ),
              MyCard(
                onTap: () {
                  'dishank tapped here'.log();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Scaffold(
                      body: Center(child: Text('Dishank')),
                    );
                  }));
                },
                data: Object(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  CustomScrollView _myBodyContainer({required Widget data}) {
    return CustomScrollView(
      slivers: [
        const MySliverAppBar(),
        SliverToBoxAdapter(child: data),
      ],
    );
  }

  Positioned _backgroundImageFixed() {
    return Positioned(
      top: 0,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Image.asset(
          'assets/images/bg/img.jpeg',
          height: 750,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  BottomNavigationBar _myBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _bottomNavBarIndex,
      onTap: (value) => setState(() => _bottomNavBarIndex = value),
      items: const [
        BottomNavigationBarItem(
          label: 'bottom_nav_home',
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'bottom_nav_add',
          icon: Icon(Icons.article_outlined),
          activeIcon: Icon(Icons.article),
        ),
        BottomNavigationBarItem(
          label: 'bottom_nav_person',
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
        ),
      ],
    );
  }
}
