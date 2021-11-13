import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/modal/data/image.dart';
import 'package:heaven_riders_india/modal/data/package.dart';

class CardView extends StatefulWidget {
  const CardView({Key? key, required this.imageList, required this.packageData})
      : super(key: key);

  final PackageDataModal packageData;
  final Future<List<ImageDataModal>> imageList;

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    // print(jsonDecode(widget.imageList.then((value) => value).toString()));
    return FutureBuilder<List<ImageDataModal>>(
      future: widget.imageList,
      builder: (context, imageSnapshot) {
        if (!imageSnapshot.hasData &&
            imageSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!imageSnapshot.hasData) {
          return Text(
            'No image found',
            style: Theme.of(context).textTheme.subtitle1,
          );
        }

        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: imageSnapshot.data!.length,
                itemBuilder: (context, imageIndex, pageIndex) => ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: imageSnapshot.data![imageIndex].image,
                    placeholder: (context, text) => const Placeholder(),
                  ),
                ),
                options: CarouselOptions(aspectRatio: 16 / 9, autoPlay: true),
              ),
              Text(widget.packageData.title),
              const SizedBox(height: 2),
              Text(widget.packageData.description),
            ],
          ),
        );
      },
    );
  }
}
