import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heaven_riders_india/modal/utils/app_state.dart';
import 'package:heaven_riders_india/view_model/app_state_view_modal.dart';

Stack advertOverlayBannerWidget(AppStateViewModal avm) => Stack(
      fit: StackFit.expand,
      children: [
        const Image(
          image: CachedNetworkImageProvider(
              'https://wallpapercave.com/dwp2x/wp5326049.jpg'),
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 80,
          right: 50,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 21,
              backgroundColor: Colors.black,
              child: IconButton(
                onPressed: () => avm.setViewState(Status.completed),
                icon: const Icon(Icons.close),
              ),
            ),
          ),
        )
      ],
    );
