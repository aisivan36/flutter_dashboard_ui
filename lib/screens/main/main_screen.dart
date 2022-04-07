import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashboard/bloc_drawer/menu_drawer_bloc.dart';
import 'package:web_dashboard/responsiveness.dart';
import 'package:web_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:web_dashboard/screens/main/components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuDrawerBloc>(
      create: (context) => MenuDrawerBloc()..add(MenuDrawer()),
      child: BlocBuilder<MenuDrawerBloc, MenuDrawerState>(
        builder: (context, state) {
          if (state is MenuDrawerOpen) {
            return Scaffold(
              key: state.scaffoldKey,
              drawer: const SideMenu(),
              body: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsiveness.isDesktop(context))
                      const Expanded(
                        child: SideMenu(),
                      ),
                    const Expanded(
                      flex: 5,
                      child: DashBoardScreen(),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is MenuDrawerLoading) {
            return Container(
              color: Colors.amber,
              child: const Center(child: CircularProgressIndicator()),
            );
          }
          return const Scaffold(
            body: Center(
              child: ColoredBox(
                color: Colors.amber,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Empty',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
