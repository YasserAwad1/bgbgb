import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ApplicationHeader extends StatelessWidget {
  const ApplicationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.aod_outlined,
                size: 33,
              ),
              // APPLICATION
              Text(
                AppLocalizations.of(context)!.application,
                style: TextStyle(
                  fontSize: 21.sp,
                  fontFamily: "AnekMalayalam",
                ),
              )
            ],
          ),
        ),
        Divider(
          thickness: 1,
          indent: 18,
          endIndent: 18,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }
}
