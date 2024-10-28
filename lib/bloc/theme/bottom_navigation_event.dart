part of 'bottom_navigation_bloc.dart';

sealed class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class BottomNavigationItemRendered extends BottomNavigationEvent {
  final List<AppStaticModel> bottomNavbarItem;
  final List<Widget> bottomNavbarPages;
  const BottomNavigationItemRendered(
      {this.bottomNavbarItem = const [], this.bottomNavbarPages = const []});
}

class BottomNavigationSwitched extends BottomNavigationEvent {
  final int currentIndex;
  const BottomNavigationSwitched({required this.currentIndex});
}
