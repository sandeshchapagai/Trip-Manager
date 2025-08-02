import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_manager/bloc/expense_bloc.dart';
import 'package:trip_manager/bloc/theme/bottom_navigation_bloc.dart';

import '../../bloc/theme/theme_bloc.dart';
import '../function/theme_modes.dart';

class BlocProviders {
  static List<BlocProvider> blocProvider = [
    BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc()
          ..add(ThemeModeSwitched(themeMode: ThemeModes.getThemeMode()))),
    BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc()),
    BlocProvider<ExpenseBloc>(create: (context) => ExpenseBloc()),
  ];
}
