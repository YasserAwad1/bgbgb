import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../screens/become_seller_screen.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/locations_screen.dart';
import '../screens/logIn_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/walkThrough_scree.dart';
import '../widgets/custom_listtile.dart';

//21/6 7:00 PM

// enum Languages { English, Arabic }

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // var language;
  var languages;

  @override
  Widget build(BuildContext context) {
    bool isArabic = Provider.of<LanguageProvider>(context).isArabic();

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'KAY',
              style: TextStyle(
                  fontFamily: "AnekMalayalam",
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Icons.person_outline_rounded,
                  size: 35,
                ),
                //  ACCOUNT
                Text(
                  AppLocalizations.of(context)!.account,
                  style: TextStyle(
                    fontSize: 21.sp,
                    fontFamily: "AnekMalayalam",
                  ),
                ),
                Spacer(),
                // LOGOUT
                Padding(
                  padding: EdgeInsets.only(right: 7.0.w),
                  child: SizedBox(
                    height: 30.h,
                    width: isArabic ? 140.w : 110.w,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.primary,
                          onPrimary: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pushNamed(LogInScreen.routeName);
                      },
                      label: Text(
                        AppLocalizations.of(context)!.logout,
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      icon: const Icon(
                        Icons.logout_rounded,
                        size: 22,
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            indent: 18.w,
            endIndent: 18.w,
            color: Theme.of(context).colorScheme.secondary,
          ),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: FloatingActionButton.extended(
                elevation: 13,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(BecomeASellerScreen.routeName);
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
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(WalkThroughScreen.routeName);
            },
            icon: Icon(Icons.abc),
          ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            // LANGUAGE
            child: Row(
              children: [
                Text(
                  '${AppLocalizations.of(context)!.language}  ',
                  style: TextStyle(fontSize: 18.sp),
                ),
                Icon(Icons.language_rounded)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Provider.of<LanguageProvider>(context, listen: false)
                      .changeLocale('en');
                },
                style: TextButton.styleFrom(
                  // backgroundColor: isArabic
                  //     ? Theme.of(context).colorScheme.primary
                  //     : Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.w,
                      color: isArabic
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'English',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Provider.of<LanguageProvider>(context, listen: false)
                      .changeLocale('ar');
                },
                style: TextButton.styleFrom(
                  // backgroundColor: isArabic
                  //     ? Theme.of(context).colorScheme.secondary
                  //     : Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2.w,
                      color: isArabic
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child:
                    const Text('Arabic', style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ]),
      ),
    ));
  }

  // Row CustomRadioButton(String text, String local, Languages lang) {
  //   return Row(
  //     children: [
  //       Radio<Languages>(
  //         activeColor: Theme.of(context).colorScheme.secondary,
  //         groupValue: languages,
  //         onChanged: (Languages? val) {
  //           Provider.of<LanguageProvider>(context, listen: false)
  //               .changeLocale(local);
  //           setState(() {
  //             languages = lang;
  //           });
  //         },
  //         value: lang,
  //       ),
  //       Text(text)
  //     ],
  //   );
  // }
}
