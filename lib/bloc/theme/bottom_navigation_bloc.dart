import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/app_static/app_static_model.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationState()) {
    on<BottomNavigationItemRendered>(_onBottomNavigationItemRender);
    on<BottomNavigationSwitched>(_onBottomNavigationSwitch);
  }

  _onBottomNavigationItemRender(BottomNavigationItemRendered event,
      Emitter<BottomNavigationState> emit) async {
    emit(BottomNavigationState(
      bottomNavbarItem: event.bottomNavbarItem,
      bottomNavbarPages: event.bottomNavbarPages,
    ));
  }

  _onBottomNavigationSwitch(
      BottomNavigationSwitched event, Emitter<BottomNavigationState> emit) {
    emit(state.copyWith(currentIndex: event.currentIndex));
  }
}
