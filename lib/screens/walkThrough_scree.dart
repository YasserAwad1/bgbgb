import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:kay_sy/screens/first_screen.dart';

class WalkThroughScreen extends StatefulWidget {
  static const routeName = '/walkthrough-screen';

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 60.h),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Fast shipping option',
                      style: TextStyle(
                          fontSize: 45.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    Image.asset('images/delivery-removebg-preview.png'),
                    Text(
                      'Get your order on the same day or within 24 hours',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              color: Colors.black,
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: Size.fromHeight(60.h)),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(FirstScreen.routeName);
                },
                child: Text(
                  // START SHOPPING
                  AppLocalizations.of(context)!.startShoping,
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            )
          : Container(
              // decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(90))),
              height: 60.h,
              color: Theme.of(context).colorScheme.secondary,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => controller.jumpToPage(2),
                        child: Text(
                          // SKIP
                          AppLocalizations.of(context)!.skip,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Colors.white),
                        )),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                          dotColor: Colors.white,
                          spacing: 10,
                          activeDotColor: Theme.of(context).colorScheme.primary,
                        ),
                        onDotClicked: (index) => controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () => controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut),
                        child: Text(
                          //  NEXT
                          AppLocalizations.of(context)!.next,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Colors.white),
                        )),
                  ]),
            ),
    );
  }
}
