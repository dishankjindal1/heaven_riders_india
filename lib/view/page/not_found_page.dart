import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('PageNotFound'),
      ),
    );
  }
}
