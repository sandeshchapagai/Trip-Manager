part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {
  final int currentIndex;
  final List<AppStaticModel> bottomNavbarItem;
  final List<Widget> bottomNavbarPages;
  const BottomNavigationState({
    this.currentIndex = 0,
    this.bottomNavbarItem = const [],
    this.bottomNavbarPages = const [],
  });
  @override
  List<Object> get props => [currentIndex, bottomNavbarItem, bottomNavbarPages];

  BottomNavigationState copyWith(
      {int? currentIndex,
      List<AppStaticModel>? bottomNavbarItem,
      List<Widget>? bottomNavbarPages,
      bool? hasActiveRestaurant}) {
    return BottomNavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      bottomNavbarItem: bottomNavbarItem ?? this.bottomNavbarItem,
      bottomNavbarPages: bottomNavbarPages ?? this.bottomNavbarPages,
    );
  }
}
