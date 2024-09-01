import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/theme/theme_bloc.dart';
import '../function/theme_modes.dart';

class BlocProviders {
  static List<BlocProvider> blocProvider = [
    BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc()
          ..add(ThemeModeSwitched(themeMode: ThemeModes.getThemeMode()))),
  ];
}
