import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/config.dart';
import 'package:kay_sy/screens/edit_profile_screen.dart';
import 'package:kay_sy/screens/locations_screen.dart';
import 'package:kay_sy/widgets/custom_listtile.dart';
import '../my_theme.dart';

//21/6 7:00 PM

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var language;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  Text(
                    ' Account',
                    style: TextStyle(
                      fontSize: 21.sp,
                      fontFamily: "AnekMalayalam",
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 7.0.w),
                    child: SizedBox(
                      height: 30.h,
                      width: 110.w,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).colorScheme.primary,
                            onPrimary: Colors.white),
                        onPressed: () {},
                        label: Text(
                          'Logout',
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
            CustomListTile(
                title: "Edit Your Profile",
                icon: Icons.person,
                onTap: () {
                  Navigator.of(context).pushNamed(EditProfileScreen.routeName);
                }),
            CustomListTile(
                title: "Edit your locations",
                icon: Icons.location_on,
                onTap: () {
                  Navigator.pushNamed(context, LocationsScreen.routeName);
                }),
            CustomListTile(
                title: "My Orders",
                icon: Icons.shopping_basket_rounded,
                onTap: () {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: FloatingActionButton.extended(
                  elevation: 13,
                  onPressed: () {},
                  label: Text(
                    'Become a seller',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  icon: Icon(Icons.sell_rounded),
                ),
              ),
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
                  Text(
                    ' Application',
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
              child: Text(
                'language',
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadioButton('Arabic'),
                CustomRadioButton('English')
              ],
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Text(
                    'Dark Mode',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      currentTheme.switchTheme();
                    },
                    icon: Icon(Icons.dark_mode))
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Row CustomRadioButton(String text) {
    return Row(
      children: [
        Radio(
          activeColor: Theme.of(context).colorScheme.secondary,
          groupValue: language,
          onChanged: (value) {
            setState(() {
              language = value;
            });
          },
          value: text,
        ),
        Text(text)
      ],
    );
  }
}
// IconButton(
                //     onPressed: () {
                //       // translator.setNewLanguage(context,
                //       //     newLanguage: translator.activeLanguageCode == 'ar'
                //       //         ? 'en'
                //       //         : 'ar',
                //       //     remember: true,
                //       //     restart: true);
                //     },
                //     icon: Icon(Icons.language)),