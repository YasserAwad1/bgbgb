import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/screens/products_screen.dart';

class SectionWidget extends StatelessWidget {
  final int icon;
  final String title;
  final String id;
  SectionWidget({
    required this.id,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductsScreen.routeName, arguments: id);
      },
      child: Material(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 4)],
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Container(
                  height: 49.h,
                  width: 90.w,
                  child: Icon(
                    IconData(icon, fontFamily: 'MaterialIcons'),
                    color: Colors.white,
                    size: 30.sp,
                  )),
              Center(
                  child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.w),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
