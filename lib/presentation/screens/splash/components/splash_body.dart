import 'package:flutter/material.dart';
import 'package:trip_manager/core/app/constants/dimensions.dart';
import 'package:trip_manager/core/app/constants/images.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';

import '../../../../core/app/constants/app_text.dart';
import '../../../../core/app/constants/font_size.dart';
import '../../../../core/app/constants/styles.dart';
import '../../../../core/services/di_injection/get_di_injection.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(kBackground), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(
                text: AppText.appName,
                fontWeight: FontWeight.w700,
                fontSize: FontSize.kS32,
                color: context.colors.white,
              ),
              kVSizedBox2,
              CustomText(
                text: AppText.appDescription,
                fontSize: FontSize.kS18,
                color: context.colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    splashRepository.initSplashScreen(context: context);
  }
}
