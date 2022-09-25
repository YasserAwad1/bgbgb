import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/screens/sellerScreens/add_product_screen.dart';
import '../../widgets/custom_listtile.dart';

class SellerScreen extends StatelessWidget {
  static const routeName = '/seller-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddProductScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(6.0.sp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                'KAY',
                style: TextStyle(
                    fontFamily: "AnekMalayalam",
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_on_rounded,
                  size: 28.sp,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              children: [
                Icon(
                  Icons.sell_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 35.sp,
                ),
                Text(
                  ' Manage my Products',
                  style: TextStyle(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "AnekMalayalam",
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            indent: 10.w,
            endIndent: 10.w,
            color: Theme.of(context).colorScheme.secondary,
          ),
          CustomListTile(
              title: 'My products',
              subTitle: 'See all the products you displayed',
              icon: Icons.shopping_bag_rounded,
              onTap: () {}),
          CustomListTile(
              title: 'Pending products',
              subTitle: 'Check the state of the products you want to display',
              icon: Icons.hourglass_top_sharp,
              onTap: () {}),
          CustomListTile(
              title: 'Ordered products',
              subTitle: 'Your products that were ordered',
              icon: Icons.local_shipping_rounded,
              onTap: () {}),
          CustomListTile(
              title: 'History',
              subTitle: '',
              icon: Icons.history_rounded,
              onTap: () {}),
        ]),
      ),
    );
  }
}
