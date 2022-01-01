import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:heaven_riders_india/view/home/view/widgets/card.widget.dart';
import 'package:heaven_riders_india/view/home/view/widgets/my_sliver_app_bar.widget.dart';

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
        drawer: Drawer(
          child: Column(
            children: [
              Text(FirebaseAuth.instance.currentUser?.phoneNumber ?? 'No data'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhoneInputScreen()));
                },
                child: const Text('Mobile Login'),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Image.asset(
                  'assets/images/bg/img.jpeg',
                  height: 750,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CustomScrollView(
              slivers: [
                const MySliverAppBar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Column(
                        children: const [
                          MyCard(odd: Colors.white, data: Object()),
                          MyCard(data: Object()),
                          MyCard(odd: Colors.white, data: Object()),
                          MyCard(data: Object()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
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
        ),
      ),
    );
  }
}
