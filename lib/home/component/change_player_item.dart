import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePlayerItem extends StatelessWidget {
  final String imageUrl;
  const ChangePlayerItem({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: Colors.white),
      ),
      child: imageUrl.isEmpty
          ? Icon(Icons.add, color: Colors.white)
          : CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => Center(
                child: CupertinoActivityIndicator(animating: true, radius: 10, color: Colors.white),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.image_outlined, color: Colors.grey, size: 30),
            ),
    );
  }
}
