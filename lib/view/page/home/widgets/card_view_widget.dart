import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/modal/data/image.dart';
import 'package:heaven_riders_india/modal/data/package.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key, required this.packageData, required this.imageList})
      : super(key: key);

  final PackageDataModal packageData;
  final List<ImageDataModal> imageList;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Theme.of(context).cardTheme.shape,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: packageData.packageId,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              child: CarouselSlider.builder(
                itemCount: imageList.length,
                itemBuilder: (context, imageIndex, pageIndex) =>
                    CachedNetworkImage(
                  width: 1920,
                  fit: BoxFit.fitWidth,
                  imageUrl: imageList[imageIndex].image,
                  placeholder: (context, index) => const Placeholder(),
                ),
                options: CarouselOptions(
                  viewportFraction: 1,
                  // aspectRatio: 4 / 3,
                  autoPlay: true,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              packageData.title,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Text(
          //   packageData.description,
          //   overflow: TextOverflow.ellipsis,
          //   maxLines: 4,
          // ),
        ],
      ),
    );
  }
}
