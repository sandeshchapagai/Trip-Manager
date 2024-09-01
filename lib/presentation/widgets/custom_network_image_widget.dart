import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final double placeHolderHeight;
  final double placeHolderWidth;
  final BoxFit boxFit;
  final bool? isFromServer;

  const CustomNetworkImageWidget({
    super.key,
    this.imageUrl,
    this.placeHolderWidth = 20,
    this.placeHolderHeight = 20,
    this.isFromServer = true,
    this.height = 40,
    this.boxFit = BoxFit.cover,
    this.width = 40,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? "",
      placeholder: (context, url) => Center(
        child: SizedBox(
          height: placeHolderHeight,
          width: placeHolderWidth,
          child: const CircularProgressIndicator(strokeWidth: 1.5),
        ),
      ),
      errorWidget: (context, url, error) => Container(
          padding: const EdgeInsets.all(8),
          child: Image(image: AssetImage(""))),
      fit: boxFit,
      height: height,
      width: width,
    );
  }
}
