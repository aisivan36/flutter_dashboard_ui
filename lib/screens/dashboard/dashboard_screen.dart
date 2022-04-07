import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_dashboard/constants.dart';
import 'package:web_dashboard/screens/dashboard/components/header.dart';
import 'package:web_dashboard/screens/dashboard/components/my_fields.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            /// Header
            const Header(),

            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFields(),
                      Text(
                        'Dashboard',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
