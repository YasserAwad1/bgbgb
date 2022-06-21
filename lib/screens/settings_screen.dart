import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/config.dart';
import '../my_theme.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

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
            ListTile(
              horizontalTitleGap: 0.3.w,
              leading: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(
                'Edit your profile',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            ),
            ListTile(
              horizontalTitleGap: 0.3.w,
              leading: Icon(
                Icons.location_on,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(
                'Edit your locations',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            ListTile(
              horizontalTitleGap: 0.3.w,
              leading: Icon(
                Icons.shopping_basket_rounded,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(
                'My orders',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
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