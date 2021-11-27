// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
  GlobalKey<FormBuilderState> formkey = GlobalKey<FormBuilderState>();

  List<DateTime> listOfDates = <DateTime>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FormBuilder(
              key: formkey,
              child: Column(
                children: [
                  FormBuilderImagePicker(
                    name: 'images',
                    decoration: const InputDecoration(
                      hintText: 'Pick Images',
                      border: InputBorder.none,
                    ),
                  ),
                  Card(
                    child: FormBuilderTextField(
                      name: 'title',
                      decoration: const InputDecoration(
                        hintText: 'Pick Title',
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Card(
                    child: FormBuilderTextField(
                      name: 'description',
                      decoration: const InputDecoration(
                        hintText: 'Write Description',
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Card(
                    child: FormBuilderTextField(
                      name: 'instruction',
                      decoration: const InputDecoration(
                        hintText: 'Write Instruction',
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Card(
                    child: FormBuilderTouchSpin(
                      name: 'money',
                      decoration: const InputDecoration(
                        hintText: 'Pick Money',
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                      ),
                      initialValue: 5000,
                      min: 1000,
                      step: 100,
                      max: 100000,
                    ),
                  ),
                  Card(
                    child: FormBuilderTouchSpin(
                      name: 'duration',
                      decoration: const InputDecoration(
                        hintText: 'Pick Duration',
                        contentPadding: EdgeInsets.all(8.0),
                        border: InputBorder.none,
                      ),
                      initialValue: 5,
                      min: 1,
                      max: 100,
                      step: 1,
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        showBottomSheet(
                          context: context,
                          builder: (context) {
                            return SafeArea(
                              child: SizedBox(
                                height: 400,
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Confirm'),
                                    ),
                                    SfDateRangePicker(
                                      initialSelectedDates: listOfDates,
                                      view: DateRangePickerView.year,
                                      selectionMode:
                                          DateRangePickerSelectionMode.multiple,
                                      onSelectionChanged: (list) {
                                        setState(() {
                                          listOfDates =
                                              list.value as List<DateTime>;
                                          listOfDates.sort();
                                        });
                                        formkey.currentState!
                                            .patchValue({'dates': listOfDates});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: FormBuilderFilterChip(
                        name: 'dates',
                        decoration: const InputDecoration(
                          labelText: 'Pick Dates',
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          contentPadding: EdgeInsets.all(8.0),
                          border: InputBorder.none,
                        ),
                        options: [
                          for (DateTime date in listOfDates)
                            FormBuilderFieldOption(
                              value: date,
                              child:
                                  Text('${date.day} ${month[date.month - 1]}'),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  if (formkey.currentState!.saveAndValidate()) {
                    // print(formkey.currentState!.value);
                    print(formkey.currentState!.value['images'][0].path);
                  }
                  // List listOfBase64Image = [];
                  // for (var image
                  //     in formkey.currentState!.value['images'] ?? []) {
                  // listOfBase64Image
                  //     .add(base64Encode(File(image.path).readAsBytesSync()));
                  //   formkey.currentState!
                  //       .patchValue({'images': listOfBase64Image});
                  // }
                  // formkey.currentState!.reset();
                },
                onLongPress: () {
                  formkey.currentState!.reset();
                  // print(formkey.currentState!.value);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Text(
                    "Submit".toUpperCase(),
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Month {
  january,
  febuary,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december
}
List month = [
  "January",
  "Febuary",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];
