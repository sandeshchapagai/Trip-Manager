import 'package:flutter/material.dart';
import 'package:trip_manager/core/app/constants/images.dart';
import 'package:trip_manager/core/app/constants/styles.dart';
import 'package:trip_manager/presentation/widgets/custom_image_asset_widget.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: "lfnskhjkjbhn"),
        CustomImageAssetWidget(
          image: kBackground,
          height: 100,
          width: 100,
        )
      ],
    );
  }
}
