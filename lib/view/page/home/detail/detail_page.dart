import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/modal/data/image.dart';
import 'package:heaven_riders_india/modal/data/package.dart';
import 'package:heaven_riders_india/view/page/home/detail/screen/bottom_modal_sheet.dart';
import 'package:line_icons/line_icons.dart';

import 'utils/disable_scroll_glow.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {required this.imageList, required this.packageData, Key? key})
      : super(key: key);

  final List<ImageDataModal> imageList;
  final PackageDataModal packageData;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: packageData.packageId,
                  child: CarouselSlider.builder(
                    itemCount: imageList.length,
                    itemBuilder: (context, imageIndex, pageIndex) => ClipRRect(
                      child: CachedNetworkImage(
                        width: 1920,
                        height: 1080,
                        fit: BoxFit.fitWidth,
                        imageUrl: imageList[imageIndex].image,
                        placeholder: (context, text) => const Placeholder(),
                      ),
                    ),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Chip(
                          label: const Icon(LineIcons.thumbsUp),
                          deleteIcon: const Icon(LineIcons.cross),
                          onDeleted: () {},
                        ),
                        Badge(
                          badgeContent: const Text('90'),
                          child: const Icon(LineIcons.thumbsUp),
                        ),
                        Badge(
                          badgeContent: const Text('90'),
                          child: const Icon(LineIcons.thumbsUp),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ColoredBox(
              color: Theme.of(context).primaryColor,
              child: const SizedBox(
                height: 15,
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyScrollBehaviour(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        width: size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          packageData.title.toUpperCase(),
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        width: size.width,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          packageData.description,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        width: size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          packageData.title.toUpperCase(),
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        width: size.width,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          packageData.description,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ColoredBox(
              color: Theme.of(context).primaryColor,
              child: const SizedBox(
                height: 15,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const BottomModalSheet());
              },
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                height: 100,
                child: Text(
                  'Book Now'.toUpperCase(),
                  style: Theme.of(context).textTheme.button!.copyWith(
                        fontSize: 50,
                        wordSpacing: 5,
                        letterSpacing: 5,
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
