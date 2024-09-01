import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app/constants/app_text.dart';
import '../../core/services/di_injection/get_di_injection.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeModeSwitched>(_onSwitchThemeMode);
  }

  _onSwitchThemeMode(ThemeModeSwitched event, Emitter<ThemeState> emit) async {
    ThemeMode theme = await event.themeMode;
    await secureStorage.saveThemeMode(themeMode: theme);

    return switch (theme.name) {
      AppText.systemTheme =>
        emit(const ThemeState(themeMode: ThemeMode.system)),
      AppText.darkTheme => emit(const ThemeState(themeMode: ThemeMode.dark)),
      _ => emit(const ThemeState(themeMode: ThemeMode.light))
    };
  }
}
