import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/screens/first_screen.dart';

class GoToShopButton extends StatelessWidget {
  const GoToShopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              AppLocalizations.of(context)!.noOrders,
              style: TextStyle(fontFamily: "AnekMalayalam", fontSize: 20.sp),
            ),
          ),
          TextButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(FirstScreen.routeName);
              },
              icon: Icon(
                Icons.shopping_basket_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: Text(AppLocalizations.of(context)!.goToShop))
        ],
      ),
    );
  }
}
