import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/config.dart';
import '../my_theme.dart';

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
      body: Column(
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
          ListTile(
            horizontalTitleGap: 0.3,
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
            horizontalTitleGap: 0.3,
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
              CustomRadioButton('English'),
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
          Spacer(),
          Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {},
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Logout ',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontFamily: 'AnekMalayalam',
                        ),
                      ),
                      Icon(
                        Icons.logout_rounded,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
