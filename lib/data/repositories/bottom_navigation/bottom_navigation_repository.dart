import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/constants/app_text.dart';
import '../../../../core/app/constants/icons.dart';
import '../../../../core/function/haptic_feedbacks.dart';
import '../../../../core/routes/route_navigator.dart';
import '../../../../presentation/screens/main/main_screen.dart';
import '../../../bloc/theme/bottom_navigation_bloc.dart';
import '../../models/app_static/app_static_model.dart';

class BottomNavigationRepository {
  List<Widget> navbarPages = [
    const Placeholder(),
    const Placeholder(),
    const SizedBox.shrink(),
    Placeholder(),
    Placeholder(),
  ];

  List<AppStaticModel> navbarItem = [
    AppStaticModel(heading: AppText.home, image: kHomeIcon),
    AppStaticModel(heading: AppText.home, image: kActivity2Icon),
    AppStaticModel(heading: AppText.home, image: kAirPlayIcon),
    AppStaticModel(heading: AppText.home, image: kSearchIcon),
  ];
  bottomNavigationAction({required int index, required BuildContext context}) {
    var bottomNavigationBloc = context.read<BottomNavigationBloc>();

    if (index != 2) {
      HapticFeedbacks.vibrate();
      bottomNavigationBloc.add(BottomNavigationSwitched(currentIndex: index));
    }
  }

  mainPageRedirection({required BuildContext context}) {
    var bottomNavigationBloc = context.read<BottomNavigationBloc>();

    bottomNavigationBloc.add(const BottomNavigationSwitched(currentIndex: 1));
    RouteNavigator.pushAndRemoveUntil(context, const MainScreen());
  }
}
