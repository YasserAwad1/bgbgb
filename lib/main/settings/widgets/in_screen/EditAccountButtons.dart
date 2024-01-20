import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../screens/edit_profile_screen.dart';
import '../../screens/locations_screen.dart';
import '../../screens/orders_screen.dart';
import '../../../../common/widgets/custom_listtile.dart';

class EditAccountButtons extends StatelessWidget {
  const EditAccountButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  EDIT YOUR PROFILE
        CustomListTile(
            title: AppLocalizations.of(context)!.editProfile,
            icon: Icons.person,
            onTap: () {
              Navigator.of(context).pushNamed(EditProfileScreen.routeName);
            }),
        //  EDIT YOUR LOCATIONS
        CustomListTile(
            title: AppLocalizations.of(context)!.editLocations,
            icon: Icons.location_on,
            onTap: () {
              Navigator.pushNamed(context, LocationsScreen.routeName);
            }),
        //   MY ORDERS
        CustomListTile(
            title: AppLocalizations.of(context)!.myOrders,
            icon: Icons.shopping_basket_rounded,
            onTap: () {
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
            }),
      ],
    );
  }
}
