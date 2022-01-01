import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:heaven_riders_india/utils/utils.dart';

class MyFlexibleSpaceBar extends StatelessWidget {
  MyFlexibleSpaceBar({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      background: Padding(
        padding: const EdgeInsets.only(
            top: 80, left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          children: [
            Text(
              'Travel With Adventuresome Souls'.toUpperCase(),
              style: Theme.of(context).primaryTextTheme.headline1,
              textAlign: TextAlign.center,
            ),
            Text(
              'Tours, Adventures & Escapes',
              style: Theme.of(context).primaryTextTheme.headline2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero)),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 16.0, right: 16.0),
                      child: FormBuilderTextField(
                        name: 'form_appBar_search_term',
                        onChanged: _onChanged,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.search_outlined,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          iconColor: Theme.of(context).colorScheme.onSecondary,
                          hintText: 'Manali, Kasol, Hampta Pass Trek, etc...',
                        ),
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    const Divider(thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: FormBuilderDateTimePicker(
                            name: 'form_appBar_date',
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 90)),
                            onChanged: _onChanged,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.date_range,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              hintText: 'When',
                            ),
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: FormBuilderTextField(
                            name: 'form_appBar_guests',
                            onChanged: _onChanged,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.numeric(context),
                              FormBuilderValidators.min(context, 1),
                              FormBuilderValidators.max(context, 15),
                            ]),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.groups_outlined,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              hintText: 'Guests',
                            ),
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ],
                    ),
                    // const Divider(thickness: 1),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.all(0),
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.onSecondary,
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            _formKey.currentState?.value.toString().log();
                          } else {
                            'Validation Failed'.log();
                          }
                        },
                        child: Text(
                          'Submit',
                          style: Theme.of(context).primaryTextTheme.button,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0: FixedColumnWidth(50),
                  1: FlexColumnWidth(1),
                  2: FixedColumnWidth(25),
                  3: FixedColumnWidth(50),
                  4: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 50,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      Text(
                        'Expert Guides',
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 25),
                      Icon(
                        Icons.place_outlined,
                        size: 50,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      Text(
                        'Handcrafted Experiences',
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const TableRow(children: [
                    SizedBox(height: 25),
                    SizedBox(height: 25),
                    SizedBox(height: 25),
                    SizedBox(height: 25),
                    SizedBox(height: 25),
                  ]),
                  TableRow(
                    children: [
                      Icon(
                        Icons.bookmark_outline,
                        size: 50,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      Text(
                        '12000+ Happy Travelers',
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 25),
                      Icon(
                        Icons.money_outlined,
                        size: 50,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      Text(
                        'Best Price Guaranteed',
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onChanged(dynamic value) {
    '$value'.log();
  }
}
