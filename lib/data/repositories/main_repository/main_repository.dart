import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/theme/bottom_navigation_bloc.dart';
import '../../../core/services/di_injection/get_di_injection.dart';

class MainRepository {
  initMainScreen({
    required BuildContext context,
  }) async {
    context.read<BottomNavigationBloc>().add(BottomNavigationItemRendered(
        bottomNavbarItem: bottomNavigationRepository.navbarItem,
        bottomNavbarPages: bottomNavigationRepository.navbarPages));
  }
}
