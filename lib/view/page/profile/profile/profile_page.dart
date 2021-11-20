import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppStateViewModal>(context);
    app.app = app;
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;

    if (orientation == Orientation.portrait) {
      return const ProfilePagePotraitMode();
    } else {
      return Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: size.width / 3,
                    height: size.height - 100,
                    color: Colors.black26,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Spacer(),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: size.width / 14,
                          child: CircleAvatar(
                            radius: size.width / 15,
                            backgroundImage: const NetworkImage(
                              'https://tinyjpg.com/images/social/website.jpg',
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Spacer(),
                        const Spacer(),
                        const Spacer(),
                        Text(
                          'Dishank Jindal sdfsdfsd'.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.button!.copyWith(
                                fontSize: size.width / 50,
                                wordSpacing: 5,
                                letterSpacing: 5,
                              ),
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                        ),
                        const Spacer(),
                        const Spacer(),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 5,
                  height: size.width / 3,
                  color: Theme.of(context).dividerColor,
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 50,
                    width: size.width / 2,
                    color: Colors.black26,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'SignOut'.toUpperCase(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 50,
                    width: size.width / 2,
                    color: Colors.black26,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'SignOut'.toUpperCase(),
                        style: Theme.of(context).textTheme.button!.copyWith(
                              fontSize: size.width / 50,
                              wordSpacing: 5,
                              letterSpacing: 5,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 50,
                    width: size.width / 2,
                    color: Colors.black26,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'SignOut'.toUpperCase(),
                        style: Theme.of(context).textTheme.button!.copyWith(
                              fontSize: size.width / 50,
                              wordSpacing: 5,
                              letterSpacing: 5,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 50,
                    width: size.width / 2,
                    color: Colors.black26,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'SignOut'.toUpperCase(),
                        style: Theme.of(context).textTheme.button!.copyWith(
                              fontSize: size.width / 50,
                              wordSpacing: 5,
                              letterSpacing: 5,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      );
    }
  }
}

class ProfilePagePotraitMode extends StatelessWidget {
  const ProfilePagePotraitMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      // width: size.width,
      // color: Colors.brown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 200,
              // width: size.width,
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: size.width / 7,
                    child: CircleAvatar(
                      radius: size.width / 8,
                      backgroundImage: const NetworkImage(
                        'https://tinyjpg.com/images/social/website.jpg',
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  Container(
                    width: 3,
                    height: size.width / 3,
                    color: Theme.of(context).dividerColor,
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        'Dishank Jindal sdfsdfsd'.toUpperCase(),
                        style: Theme.of(context).textTheme.button!.copyWith(
                              fontSize: size.width / 20,
                              wordSpacing: 5,
                              letterSpacing: 5,
                            ),
                        overflow: TextOverflow.visible,
                        maxLines: 2,
                        textScaleFactor: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              width: size.width - 100,
              child: const Divider(
                thickness: 5,
              ),
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 75,
              width: size.width,
              color: Colors.black26,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'SignOut'.toUpperCase(),
                  style: Theme.of(context).textTheme.button!.copyWith(
                        fontSize: 25,
                        wordSpacing: 5,
                        letterSpacing: 5,
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 75,
              width: size.width,
              color: Colors.black26,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'SignOut'.toUpperCase(),
                  style: Theme.of(context).textTheme.button!.copyWith(
                        fontSize: 25,
                        wordSpacing: 5,
                        letterSpacing: 5,
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 75,
              width: size.width,
              color: Colors.black26,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'SignOut'.toUpperCase(),
                  style: Theme.of(context).textTheme.button!.copyWith(
                        fontSize: 25,
                        wordSpacing: 5,
                        letterSpacing: 5,
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 75,
              width: size.width,
              color: Colors.black26,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'SignOut'.toUpperCase(),
                  style: Theme.of(context).textTheme.button!.copyWith(
                        fontSize: 25,
                        wordSpacing: 5,
                        letterSpacing: 5,
                      ),
                ),
              ),
            ),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
