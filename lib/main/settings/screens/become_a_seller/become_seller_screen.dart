import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/become_a_seller/BAS_screen/Custom_rich_text.dart';
import '../../widgets/become_a_seller/BAS_screen/Topic.dart';
import '../../widgets/become_a_seller/BAS_screen/bas_top_bar.dart';
import '../../widgets/become_a_seller/BAS_screen/next_button.dart';

class BecomeASellerScreen extends StatefulWidget {
  static const routeName = '/become-a-seller';

  @override
  State<BecomeASellerScreen> createState() => _BecomeASellerScreenState();
}

class _BecomeASellerScreenState extends State<BecomeASellerScreen> {
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TOP BAR
                const BASTopBar(),
                // ICON AND TOPIC
                const Topic(),
                SizedBox(height: 5.h),
                CustomRichText(
                    text1: '1-', text2: AppLocalizations.of(context)!.term1),
                SizedBox(
                  height: 6.h,
                ),
                CustomRichText(
                    text1: '2-', text2: AppLocalizations.of(context)!.term2),
                SizedBox(
                  height: 6.h,
                ),
                CustomRichText(
                    text1: '3-', text2: AppLocalizations.of(context)!.term3),
                SizedBox(
                  height: 6.h,
                ),
                CustomRichText(
                    text1: '4-', text2: AppLocalizations.of(context)!.term4),
                SizedBox(
                  height: 6.h,
                ),
                CustomRichText(
                    text1: '5-', text2: AppLocalizations.of(context)!.term5),
                SizedBox(
                  height: 6.h,
                ),
                CustomRichText(
                    text1: '6-', text2: AppLocalizations.of(context)!.term6),
                SizedBox(
                  height: 6.h,
                ),
                CustomRichText(
                    text1: '7-', text2: AppLocalizations.of(context)!.term7),
                SizedBox(
                  height: 6.h,
                ),
                CustomRichText(
                    text1: '8-', text2: AppLocalizations.of(context)!.term8),
                SizedBox(
                  height: 6.h,
                ),
                CustomRichText(
                    text1: '9-', text2: AppLocalizations.of(context)!.term9),
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 1,
                ),
                //CHECK BOX
                CheckboxListTile(
                  activeColor: Theme.of(context).colorScheme.secondary,
                  title: Text(
                    AppLocalizations.of(context)!.agreeToTerms,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  value: agree,
                  onChanged: (newValue) {
                    setState(() {
                      agree = newValue!;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                NextButton(
                  agree: agree,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
