import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Topic extends StatelessWidget {
  const Topic({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.sell,
          size: 50.r,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            '${AppLocalizations.of(context)!.sellerTopic}\n${AppLocalizations.of(context)!.terms}',
            softWrap: true,
            maxLines: 9,
            overflow: TextOverflow.visible,
            style: TextStyle(
                fontSize: 20.sp,
                fontFamily: 'AnekMalayalam',
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ],
    );
  }
}
