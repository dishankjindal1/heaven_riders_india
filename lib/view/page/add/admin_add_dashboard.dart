import 'package:flutter/cupertino.dart';

class AdminAddDashboardPage extends StatelessWidget {
  const AdminAddDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: AddPostWidget());
  }
}

class AddPostWidget extends StatefulWidget {
  const AddPostWidget({Key? key}) : super(key: key);

  @override
  _AddPostWidgetState createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Add Page'),
    );
  }
}
