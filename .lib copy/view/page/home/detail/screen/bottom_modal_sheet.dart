import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/modal/data/package.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';
import 'package:provider/provider.dart';

class BottomModalSheet extends StatefulWidget {
  const BottomModalSheet({Key? key, required this.data}) : super(key: key);

  final PackageDataModal data;
  @override
  State<BottomModalSheet> createState() => _BottomModalSheetState();
}

class _BottomModalSheetState extends State<BottomModalSheet> {
  DateTime time = DateTime.now();
  int numberpicker = 1;

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppStateViewModal>(context);
    app.app = app;
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                height: 100,
                child: Text(
                  'Cancel'.toUpperCase(),
                  style: Theme.of(context).textTheme.button!.copyWith(
                        fontSize: 50,
                        wordSpacing: 5,
                        letterSpacing: 5,
                      ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: GestureDetector(
              onTap: () => setState(() {
                numberpicker++;
              }),
              onLongPress: () => setState(() {
                numberpicker = 1;
              }),
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$9999'.toUpperCase(),
                      style: Theme.of(context).textTheme.button!.copyWith(
                            fontSize: 50,
                            wordSpacing: 5,
                            letterSpacing: 5,
                          ),
                    ),
                    Text(
                      ' x ',
                      style: Theme.of(context).textTheme.button!.copyWith(
                            fontSize: 50,
                            wordSpacing: 5,
                            letterSpacing: 5,
                          ),
                    ),
                    Text(
                      numberpicker.toString(),
                      style: Theme.of(context).textTheme.button!.copyWith(
                            fontSize: 50,
                            wordSpacing: 5,
                            letterSpacing: 5,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: InkWell(
              onTap: () => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 10)),
                      lastDate: DateTime.now().add(const Duration(days: 100)))
                  .then((value) {
                if (value != null) {
                  setState(() {
                    time = value;
                  });
                }
              }),
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                height: 100,
                child: Text(
                  time.hour == DateTime.now().hour
                      ? 'Select Date'
                      : '${time.day}/${time.month}/${time.year}',
                  style: Theme.of(context).textTheme.button!.copyWith(
                        fontSize: 50,
                        wordSpacing: 5,
                        letterSpacing: 5,
                      ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                Navigator.pop(context);
              },
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
