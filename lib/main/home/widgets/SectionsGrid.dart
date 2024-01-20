import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/sections_provider.dart';
import 'section_widget.dart';

class SectionsGrid extends StatelessWidget {
  const SectionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            Provider.of<SectionsProvider>(context, listen: false).getSections(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: EdgeInsets.all(25.0.w),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 30.w,
              ),
              itemCount: Provider.of<SectionsProvider>(context).sections.length,
              itemBuilder: (ctx, index) => SectionWidget(
                id: Provider.of<SectionsProvider>(context).sections[index].id,
                icon:
                    Provider.of<SectionsProvider>(context).sections[index].icon,
                title: Provider.of<SectionsProvider>(context)
                    .sections[index]
                    .title,
              ),
            ),
          );
        });
  }
}
