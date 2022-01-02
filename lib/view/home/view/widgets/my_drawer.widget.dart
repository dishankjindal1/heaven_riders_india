
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
