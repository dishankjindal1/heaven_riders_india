import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:provider/provider.dart';

class BottomModalSheet extends StatefulWidget {
  const BottomModalSheet({Key? key}) : super(key: key);

  @override
  State<BottomModalSheet> createState() => _BottomModalSheetState();
}

class _BottomModalSheetState extends State<BottomModalSheet> {
  DateTime time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppStateViewModal>(context);
    app.app = app;
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 370,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime.now())
                            .then((value) {
                          if (value == null) {
                            time = DateTime.now();
                          } else {
                            setState(() {
                              time = value;
                            });
                          }
                        });
                      },
                      child: DateTime.now() == time
                          ? const Text('select time')
                          : Text(time.toString())),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                height: 100,
                child: Text(
                  'Confirm'.toUpperCase(),
                  style: Theme.of(context).textTheme.button!.copyWith(
                        fontSize: 50,
                        wordSpacing: 5,
                        letterSpacing: 5,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
