// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyCard extends StatefulWidget {
  const MyCard(
      {this.odd = const Color.fromARGB(50, 200, 200, 200),
      required Object data,
      required VoidCallback onTap,
      Key? key})
      : cardData = data,
        onTapCallback = onTap,
        super(key: key);

  final Color odd;
  final Object cardData;
  final VoidCallback onTapCallback;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final _imageController = PageController();
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _imageController.addListener(() {
      setState(() {
        activeIndex = _imageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _imageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        color: widget.odd,
        width: double.maxFinite,
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.all(16.0),
                    child: PageView(
                      controller: _imageController,
                      children: [1, 2, 3, 4, 5]
                          .map(
                            (e) => Image.asset(
                              'assets/images/bg/img.jpeg',
                              fit: BoxFit.cover,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 25,
                  left: MediaQuery.of(context).size.width / 2.75,
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: 5,
                    effect: const WormEffect(),
                    onDotClicked: (index) {
                      _imageController.jumpToPage(index);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 25,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Sankri, Uttrakhand',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.thumb_up_outlined,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: widget.onTapCallback,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Kedarkantha Trek',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          const SizedBox(width: 25),
                          IconButton(
                            padding: const EdgeInsets.only(left: 20),
                            onPressed: widget.onTapCallback,
                            icon: const CircleAvatar(
                              child: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                size: 25,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.timer_outlined,
                          size: 25,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '5 Days',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const Spacer(),
                        Text(
                          'FROM',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '\$8999',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
