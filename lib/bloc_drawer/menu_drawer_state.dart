part of 'menu_drawer_bloc.dart';

@immutable
abstract class MenuDrawerState {}

class MenuDrawerInitial extends MenuDrawerState {}

class MenuDrawerLoading extends MenuDrawerState {}

class MenuDrawerOpen extends MenuDrawerState {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final String testTitle;

  // GlobalKey<ScaffoldState> get scafolldKey => _scaffoldKey;

  MenuDrawerOpen({required this.scaffoldKey, required this.testTitle});
}
