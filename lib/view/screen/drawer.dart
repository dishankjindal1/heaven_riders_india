import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';

Drawer appDrawerLoggedIn(
        BuildContext context, AppStateViewModal appStateViewModel) =>
    Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                border: Border(
                  bottom: const BorderSide().copyWith(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: CachedNetworkImageProvider(
                        "https://www.cleverfiles.com/howto/wp-content/uploads/2018/03/minion.jpg"),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        appStateViewModel.userDataModal.name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        appStateViewModel.userDataModal.contact,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.home),
                    title: Text(
                      "Dishank",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            ),
            InkWell(
              onTap: () => appStateViewModel.signOut(),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    top: const BorderSide().copyWith(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width / 1.35,
                height: 100,
                child: Text(
                  "Logout".toUpperCase(),
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
          ],
        ),
      ),
    );

Drawer appDrawerLoggedOut(
        BuildContext context, AppStateViewModal appStateViewModal) =>
    Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                appStateViewModal.signIn(
                    email: 'dishank@gmail.com', password: '123456');
              },
              child: Text(
                "Login".toUpperCase(),
                style: Theme.of(context).textTheme.button,
              ),
            ),
            ElevatedButton(
              onPressed: () => appStateViewModal.signIn(
                  email: 'dishank@gmail.com', password: '123456'),
              child: Text(
                "Register".toUpperCase(),
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ],
        ),
      ),
    );
