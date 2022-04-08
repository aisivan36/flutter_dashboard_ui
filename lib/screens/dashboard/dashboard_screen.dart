import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_dashboard/constants.dart';
import 'package:web_dashboard/responsiveness.dart';
import 'package:web_dashboard/screens/dashboard/components/header.dart';
import 'package:web_dashboard/screens/dashboard/components/my_fields.dart';
import 'package:web_dashboard/screens/dashboard/components/recent_file.dart';
import 'package:web_dashboard/screens/dashboard/components/storage_detail.dart';

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
                      const SizedBox(height: defaultPadding),
                      const RecentFileWidget(),
                      if (Responsiveness.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsiveness.isMobile(context))
                        const Storagedetails(),
                    ],
                  ),
                ),
                if (!Responsiveness.isMobile(context))
                  const SizedBox(width: defaultPadding),
                if (!Responsiveness.isMobile(context))
                  const Expanded(flex: 2, child: Storagedetails()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
