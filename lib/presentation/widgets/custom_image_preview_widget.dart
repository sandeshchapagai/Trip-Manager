import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/app/constants/colors.dart';
import '../../core/app/constants/dimensions.dart';
import '../../core/utils/responsive.dart';
import 'custom_image_asset_widget.dart';
import 'custom_network_image_widget.dart';

class CustomImagePreviewWidget extends StatelessWidget {
  final String? imgPath;
  final bool isNetworkImg;
  final bool isAssestImg;
  const CustomImagePreviewWidget(
      {Key? key,
      this.imgPath,
      this.isNetworkImg = true,
      this.isAssestImg = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kDARKTHEME,
      appBar: AppBar(
        backgroundColor: AppColors.kDARKTHEME,
        iconTheme: const IconThemeData(color: AppColors.kLIGHTTHEME),
      ),
      body: Responsive(
        context: context,
        child: Center(
          child: Container(
            child: isNetworkImg
                ? CustomNetworkImageWidget(
                    height: appHeight(context),
                    width: appWidth(context),
                    imageUrl: imgPath ?? "",
                    boxFit: BoxFit.contain,
                  )
                : isAssestImg == true
                    ? CustomImageAssetWidget(image: "$imgPath")
                    : Image.file(File("$imgPath")),
          ),
        ),
      ),
    );
  }
}
