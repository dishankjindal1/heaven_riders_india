import 'package:flutter/material.dart';
import 'package:heaven_riders_india/theme/theme.dart';
import '../utils/utils.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: myAppTheme(),
      home: const ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _bottomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 400,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Container(),
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const FlutterLogo(
                  size: 75,
                ),
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Spacer(),
                    FlutterLogo(
                      size: 75,
                    ),
                    Spacer(),
                    FlutterLogo(),
                    Spacer(),
                  ],
                ),
              ),
              actions: const [
                Icon(Icons.search),
              ],
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    'Button Pressed'.log();
                  },
                  child: const Text('Profile View'),
                ),
              ),
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
