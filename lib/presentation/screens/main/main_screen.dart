import 'package:flutter/material.dart';
import 'package:trip_manager/core/app/constants/dimensions.dart';
import 'package:trip_manager/core/app/constants/images.dart';
import 'package:trip_manager/core/app/constants/styles.dart';
import 'package:trip_manager/core/enums/enums.dart';
import 'package:trip_manager/core/routes/route_config.dart';
import 'package:trip_manager/core/routes/route_navigator.dart';
import 'package:trip_manager/core/utils/responsive.dart';
import 'package:trip_manager/core/utils/theme_extensions.dart';
import 'package:trip_manager/presentation/widgets/custom_button_widget.dart';

import '../../../core/services/di_injection/get_di_injection.dart';
import '../../widgets/custom_text_field_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(kBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Responsive(
            context: context,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomTextFieldWidget(
                    style: customTextStyle(color: context.colors.white),
                    title: "Email",
                    isMandatory: true,
                    titleColor: context.colors.white),
                kVCreateButtonGap,
                CustomTextFieldWidget(
                    title: "Password",
                    titleColor: context.colors.white,
                    style: customTextStyle(color: context.colors.white)),
                kVCreateButtonGap,
                kVCreateButtonGap,
                CustomButton(buttonType: ButtonType.text).widget(
                    context: context,
                    runCode: () {
                      RouteNavigator.navigateNamed(
                          context, RouteConfig.homeRoute);
                    },
                    title: "Sign In",
                    titleColor: context.colors.white,
                    backgroundColor: context.colors.primary)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mainRepository.initMainScreen(
      context: context,
    );
  }
}
