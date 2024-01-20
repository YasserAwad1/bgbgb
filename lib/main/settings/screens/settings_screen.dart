import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/main/settings/widgets/in_screen/AccountHeader.dart';
import 'package:kay_sy/main/settings/widgets/in_screen/ApplicationHeader.dart';
import 'package:kay_sy/main/settings/widgets/in_screen/BecomeASellerButton.dart';
import 'package:kay_sy/main/settings/widgets/in_screen/EditAccountButtons.dart';
import 'package:kay_sy/main/settings/widgets/in_screen/LanguageButtons.dart';
import 'package:kay_sy/main/settings/widgets/in_screen/TitleWidget.dart';
import '../../../providers/language_provider.dart';
import 'package:provider/provider.dart';

import '../../../screens/walkThrough_scree.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isArabic = Provider.of<LanguageProvider>(context).isArabic();

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //KAY LOGO
          const TitleWidget(),

          //ACCOUNT HEADER AND LOGOUT BUTTON
          AccountHeader(
            isArabic: isArabic,
          ),

          //EDITING BUTTONS
          const EditAccountButtons(),

          //BECOME A SELLER BUTTON
          const BecomeASellerButton(),

          //APPLICTION HEADER
          const ApplicationHeader(),

          //LANGUAGES
          LanguageButtons(
            isArabic: isArabic,
          ),

          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(WalkThroughScreen.routeName);
            },
            icon: const Icon(Icons.abc),
          ),
        ]),
      ),
    ));
  }
}
