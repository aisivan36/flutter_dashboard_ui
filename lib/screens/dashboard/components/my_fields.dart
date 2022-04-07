import 'package:flutter/material.dart';
import 'package:web_dashboard/constants.dart';
import 'package:web_dashboard/models/storage_model.dart';
import 'package:web_dashboard/responsiveness.dart';
import 'package:web_dashboard/screens/dashboard/components/file_info_card.dart';

class MyFields extends StatelessWidget {
  const MyFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Files',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding /
                      (Responsiveness.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add New"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsiveness(
          desktop: FileInfoCardGridView(
            childAspectRation: _size.width < 1400 ? 1.1 : 1.4,
          ),
          tablet: const FileInfoCardGridView(),
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 3,
            childAspectRation: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRation = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRation;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRation,
      ),
      itemBuilder: (context, index) {
        return FileInfoCard(
          info: demoMyFiles[index],
        );
      },
    );
  }
}
