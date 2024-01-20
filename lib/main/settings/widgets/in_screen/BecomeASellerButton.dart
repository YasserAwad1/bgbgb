import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../screens/become_a_seller/become_seller_screen.dart';

class BecomeASellerButton extends StatelessWidget {
  const BecomeASellerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: FloatingActionButton.extended(
          elevation: 13,
          onPressed: () {
            Navigator.of(context).pushNamed(BecomeASellerScreen.routeName);
          },
          // become a seller
          label: Text(
            AppLocalizations.of(context)!.becomeSeller,
            style: TextStyle(fontSize: 16.sp),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          icon: const Icon(Icons.sell_rounded),
        ),
      ),
    );
  }
}
