import 'package:flutter/material.dart';
import 'package:heaven_riders_india/view/home/view/widgets/my_flexible_space_bar.widget.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      expandedHeight: 725,
      toolbarHeight: kToolbarHeight + 25,
      title: Image.asset(
        'assets/images/logo/512.png',
        width: 124,
        fit: BoxFit.fitHeight,
      ),
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: const Icon(Icons.menu_outlined, size: 35),
          ),
        );
      }),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, size: 30),
          ),
        ),
      ],
      flexibleSpace: MyFlexibleSpaceBar(),
    );
  }
}
