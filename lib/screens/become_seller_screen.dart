import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/screens/become_a_seller_form_screen.dart';

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
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                  ),
                ),
                Spacer(),
                const Text(
                  'Become a seller',
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
                    'Are you a tradesman ? Or have products that you want to display in our store ? Becoming a seller in KAY is that right place.\nTerms of becoming a seller:',
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
                'Becoming a seller is a monthly plan payment of 40,000 syp.'),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '2-', 'We require a photo of your id.'),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '3-',
                'When you are accepted, we will contact you for signing some papers, and payment will be made then.'),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '4-',
                'If your product is sold, we will be responsible for the shipping, you just display them and we\'ll take care of the rest.'),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '5-',
                'Not all products are accepted. When you display a product, we will accept it or deny it.'),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '6-',
                'Only new and sealed products are allowed, used products will be denied immediately.'),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '7-',
                'Products shouldn\'t be very large in size.(maximum 1 meter in height, 0.5 meters in width).'),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(context, '8-',
                'All products should have a clear photo, with a nice background (white or grey is preferred).'),
            SizedBox(
              height: 6.h,
            ),
            CustomRichText(
                context, '9-', 'Price should be in syrian pounds (syp).'),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
            ),
            CheckboxListTile(
              activeColor: Theme.of(context).colorScheme.secondary,
              title: Text(
                "I have read the terms and I agree",
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
                    child: const Center(
                      child: Text(
                        'Next',
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
