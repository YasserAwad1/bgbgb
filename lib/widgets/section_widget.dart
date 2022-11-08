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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: FloatingActionButton.extended(
          elevation: 13,
          onPressed: () {
            Navigator.pushNamed(context, ProductsScreen.routeName,
                arguments: id);
          },
          // become a seller
          label: Text(
            title,
            style: TextStyle(fontSize: 16.sp),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          icon: Icon(IconData(icon, fontFamily: 'MaterialIcons')),
        ),
      ),
    );
  }
}
