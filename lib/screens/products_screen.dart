import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/section_model.dart';
import 'package:kay_sy/providers/sections_provider.dart';
import 'package:kay_sy/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = '/productsScreen';

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    final SectionModel section =
        Provider.of<SectionsProvider>(context).findById(id);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 180.w,
                child: Text(
                  section.quote,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                IconData(section.icon, fontFamily: 'MaterialIcons'),
                size: 50.sp,
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          SearchBar()
        ],
      ),
    );
  }
}
