import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/common/widgets/CartButton.dart';

import 'package:kay_sy/main/home/widgets/DeliverToWidget.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../../cart/screens/cart_screen.dart';
import '../../favorites/screens/favorites_screen.dart';
import '../../../common/widgets/badge.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 60.h,
            width: 200.w,
            child: const DeliverToWidget(),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.of(context).pushNamed(FavoritesScreen.routeName);
            },
          ),
           CartButton(),
        ],
      ),
    );
  }
}
