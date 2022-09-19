import 'package:flutter/material.dart';
import 'package:kay_sy/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/screens/become_a_seller_form_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BecomeASellerScreen extends StatefulWidget {
  static const routeName = '/become-a-seller';

  @override
  State<BecomeASellerScreen> createState() => _BecomeASellerScreenState();
}

class _BecomeASellerScreenState extends State<BecomeASellerScreen> {
  bool agree = false;
 

  @override
  Widget build(BuildContext context) {
     bool isArabic = Provider.of<LanguageProvider>(context).isArabic();
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: 45,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon:  Icon( isArabic ? Icons.arrow_back_ios_new_outlined :
                      Icons.arrow_back_ios_new_rounded,
                    ),
                  ),
                ),
                Spacer(),
                //BECOME A SELLER 
                 Text(
                  AppLocalizations.of(context)!.becomeSeller,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.sell,
                  size: 50.r,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    '${AppLocalizations.of(context)!.sellerTopic}\n${AppLocalizations.of(context)!.terms}',
                    softWrap: true,
                    maxLines: 9,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'AnekMalayalam',
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            CustomRichText(context, '1-',
                AppLocalizations.of(context)!.term1),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '2-', AppLocalizations.of(context)!.term2),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '3-',
                AppLocalizations.of(context)!.term3),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '4-',
                AppLocalizations.of(context)!.term4),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '5-',
                AppLocalizations.of(context)!.term5),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '6-',
                AppLocalizations.of(context)!.term6),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '7-',
                AppLocalizations.of(context)!.term7),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '8-',
                AppLocalizations.of(context)!.term8),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(
                context, '9-', AppLocalizations.of(context)!.term9),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
            ),
            CheckboxListTile(
              activeColor: Theme.of(context).colorScheme.secondary,
              title: Text(
                AppLocalizations.of(context)!.agreeToTerms,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
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
            Center(
              child: Container(
                height: 50.h,
                width: 150.w,
                margin: EdgeInsets.all(5.sp),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.sp),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: agree
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.grey,
                    ),
                    onPressed: () {
                      agree
                          ? Navigator.of(context)
                              .pushNamed(BecomeASellerFormScreen.routeName)
                          : null;
                    },
                    child:  Center(
                      child: Text(
                        AppLocalizations.of(context)!.next,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    )));
  }

  RichText CustomRichText(BuildContext context, String text1, String text2) {
    return RichText(
      text: TextSpan(
          text: text1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 21,
          ),
          children: [
            TextSpan(
                text: text2,
                style: TextStyle(
                    height: 1.3.h,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary)),
          ]),
    );
  }
}
