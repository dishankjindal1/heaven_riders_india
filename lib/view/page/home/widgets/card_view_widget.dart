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
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Hero(
            tag: packageData.packageId,
            child: CarouselSlider.builder(
              itemCount: imageList.length,
              itemBuilder: (context, imageIndex, pageIndex) => ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: imageList[imageIndex].image,
                  placeholder: (context, index) => const Placeholder(),
                ),
              ),
              options: CarouselOptions(aspectRatio: 16 / 9, autoPlay: true),
            ),
          ),
          Text(packageData.title),
          const SizedBox(height: 2),
          Text(
            packageData.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
