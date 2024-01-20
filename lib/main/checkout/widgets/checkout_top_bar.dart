import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutTopBar extends StatelessWidget {
  const CheckoutTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          const SizedBox(
            width: 100,
          ),
          // YOUR ORDER
          Text(
            AppLocalizations.of(context)!.yourOrder,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
        ],
      ),
    );
  }
}
