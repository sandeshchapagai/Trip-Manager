part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeModeSwitched extends ThemeEvent {
  final Future<ThemeMode> themeMode;
  const ThemeModeSwitched({required this.themeMode});
}
