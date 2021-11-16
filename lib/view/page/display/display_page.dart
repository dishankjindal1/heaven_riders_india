import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/modal/data/image.dart';
import 'package:heaven_riders_india/modal/data/package.dart';
import 'package:heaven_riders_india/view/page/display/utils/disable_scroll_glow.dart';

class DisplayPage extends StatelessWidget {
  const DisplayPage(
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
                        imageUrl: imageList[imageIndex].image,
                        placeholder: (context, text) => const Placeholder(),
                      ),
                    ),
                    options: CarouselOptions(
                        aspectRatio: 4 / 3,
                        viewportFraction: 1,
                        autoPlay: true),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(2),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.25),
                              ),
                              child: const Icon(Icons.person),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Text(
                                '10',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.all(2),
                          width: 50,
                          height: 25,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.all(2),
                          width: 50,
                          height: 25,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
          ],
        ),
      ),
    );
  }
}
