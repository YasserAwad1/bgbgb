import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../../cart/screens/cart_screen.dart';
import '../../../common/widgets/badge.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // WHAT ARE YOU LOOKING FOR
          Text(
            AppLocalizations.of(context)!.searchqu,
            style: TextStyle(
                fontFamily: 'AnekMalayalam',
                fontSize: 25.sp,
                color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
