import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_manager/core/app/constants/icons.dart';

import '../../../../../../bloc/theme/bottom_navigation_bloc.dart';
import '../../../../../../core/app/constants/app_text.dart';
import '../../../../../../core/routes/route_navigator.dart';
import '../../../../../../data/models/app_static/app_static_model.dart';
import '../../../presentation/screens/friends/friends_screen.dart';
import '../../../presentation/screens/home/home_screen.dart';
import '../../../presentation/screens/main/main_screen.dart';

class BottomNavigationRepository {
  List<Widget> navbarPages = [
    const HomeScreen(),
    const FriendsScreen(),
    const Placeholder(),
    const Placeholder(),
  ];

  List<AppStaticModel> navbarItem = [
    AppStaticModel(heading: AppText.home, image: kHomeIcon),
    AppStaticModel(heading: AppText.friends, image: kFriendsIcon),
    AppStaticModel(heading: AppText.expense, image: kExpenseIcon),
    AppStaticModel(heading: AppText.settings, image: kSettingsIcon),
  ];
  bottomNavigationAction({required int index, required BuildContext context}) {
    var bottomNavigationBloc = context.read<BottomNavigationBloc>();
    bottomNavigationBloc.add(BottomNavigationSwitched(currentIndex: index));
  }

  mainPageRedirection({required BuildContext context}) {
    var bottomNavigationBloc = context.read<BottomNavigationBloc>();
    bottomNavigationBloc.add(const BottomNavigationSwitched(currentIndex: 1));
    RouteNavigator.pushAndRemoveUntil(context, const MainScreen());
  }
}
