import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'menu_drawer_event.dart';
part 'menu_drawer_state.dart';

class MenuDrawerBloc extends Bloc<MenuDrawerEvent, MenuDrawerState> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  MenuDrawerBloc() : super(MenuDrawerInitial()) {
    on<MenuDrawerEvent>((event, emit) {
      if (event is MenuDrawer) {
        try {
          emit(MenuDrawerLoading());

          emit(MenuDrawerOpen(
              scaffoldKey: _scaffoldKey, testTitle: 'Jajal Ko Bloc State'));
          if (emit is MenuDrawerOpen) {
            tap();
          }
        } catch (err) {
          debugPrint(err.toString());
        }
      }
    });
  }

  void tap() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
