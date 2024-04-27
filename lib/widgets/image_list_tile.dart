
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';


class ImageListTile extends StatelessWidget {
  final int? id;
  final String? imageUrl;
  final int? views;
  final int? likes;
  const ImageListTile({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.views,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: 'hero-img$id',
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            filterQuality: FilterQuality.low,
            imageUrl: imageUrl ?? "https://cdn.pixabay.com/photo/2024/04/01/05/18/green-8667981_1280.jpg",
            placeholder: (context, url) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade400,
                child: Container(
                  color: Colors.grey.shade100.withOpacity(0.7),
                  width: double.infinity,
                ),
              );
            },

            errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.grey, size: 40),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            color: Colors.grey.withOpacity(0.55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Icon(Icons.people, color: Colors.black54),
                    const SizedBox(width: 2),
                    Text(
                      '$views',
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.red),
                    const SizedBox(width: 2),
                    Text(
                      '$likes',
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // get createImageCodecFromUrl {}
}
