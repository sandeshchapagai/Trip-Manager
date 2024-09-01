import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomImageAssetWidget extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final double? scale;
  final AlignmentGeometry alignment;
  final BoxFit? fit;
  final Function(BuildContext, Object, StackTrace?)? errorBuilder;

  const CustomImageAssetWidget({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.scale,
    this.alignment = Alignment.center,
    this.errorBuilder,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height,
      width: width,
      fit: fit,
      scale: scale,
      alignment: alignment,
      errorBuilder: (context, error, stackTrace) => errorBuilder != null
          ? errorBuilder!(context, error, stackTrace)
          : const SizedBox.shrink(),
    );
  }
}
