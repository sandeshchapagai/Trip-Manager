import 'package:flutter/material.dart';
import 'package:trip_manager/core/app/constants/dimensions.dart';
import 'package:trip_manager/core/app/constants/font_size.dart';
import 'package:trip_manager/core/app/constants/icons.dart';
import 'package:trip_manager/core/app/constants/styles.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';
import 'package:trip_manager/presentation/widgets/custom_image_asset_widget.dart';
import 'package:trip_manager/presentation/widgets/custom_svg_widget.dart';

class CustomHomeFeedWidget extends StatelessWidget {
  final String name, description, image;
  const CustomHomeFeedWidget(
      {super.key,
      required this.name,
      required this.image,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colors.white, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
              kHSizedBox1,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: name,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: "11h",
                    color: context.colors.caption,
                  ),
                ],
              )
            ],
          ),
          kVSizedBox1,
          CustomText(text: description),
          kVSizedBox0,
          CustomText(
            fontWeight: FontWeight.w500,
            text: "#travel#baglung",
            color: context.colors.blue,
          ),
          kVSizedBox0,
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomImageAssetWidget(
                  height: 200,
                  width: appWidth(context),
                  fit: BoxFit.cover,
                  image: image)),
          kVSizedBox2,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomSvgWidget(
                    icon: kLikeOffIcon,
                    height: 20,
                  ),
                  kHSizedBox1,
                  CustomText(
                    text: "1400 Likes",
                    fontSize: FontSize.kS11,
                    fontWeight: FontWeight.w500,
                  ),
                  kHSizedBox1,
                ],
              ),
              Row(
                children: [
                  CustomSvgWidget(
                    icon: kCommentOffIcon,
                    height: 20,
                  ),
                  kHSizedBox1,
                  CustomText(
                    text: "1400 Likes",
                    fontSize: FontSize.kS11,
                    fontWeight: FontWeight.w500,
                  ),
                  kHSizedBox1,
                ],
              ),
              Row(
                children: [
                  CustomSvgWidget(
                    icon: kShareIcon,
                    height: 30,
                  ),
                  kHSizedBox1,
                  CustomText(
                    text: "1400 Likes",
                    fontSize: FontSize.kS11,
                    fontWeight: FontWeight.w500,
                  ),
                  kHSizedBox1,
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
