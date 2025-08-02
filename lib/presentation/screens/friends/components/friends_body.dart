import 'package:flutter/material.dart';
import 'package:trip_manager/core/app/constants/dimensions.dart';
import 'package:trip_manager/core/utils/responsive.dart';

import 'chat_widgets.dart';

class FriendsBody extends StatelessWidget {
  const FriendsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      context: context,
      child: Column(
        children: [kVSizedBox8, Expanded(child: ChatHomePage())],
      ),
    );
  }
}
