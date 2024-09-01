import 'package:flutter/material.dart';
import 'package:trip_manager/core/app/constants/styles.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';

import '../../../../core/app/constants/dimensions.dart';
import '../../../../core/services/di_injection/get_di_injection.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: appWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kVSizedBox8,
          CustomText(
            text: "Hello",
            // color: Colors.black,
            color: context.colors.primary,
          )
          // const Expanded(
          //   child: CustomRestaurantLogoWidget(),
          // ),
          // SizedBox(
          //   height: 80,
          //   child: Lottie.asset(
          //     kHorizontalLoaderJson,
          //     fit: BoxFit.cover,
          //     alignment: Alignment.bottomCenter,
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    splashRepository.initSplashScreen(context: context);
  }
}
