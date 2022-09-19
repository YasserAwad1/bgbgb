import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/screens/first_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
              color: Theme.of(context).colorScheme.secondary,
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
                  'Start shopping!',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            )
          : Container(
              // decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(90))),
              height: 60.h,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => controller.jumpToPage(2),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp),
                        )),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                          spacing: 10,
                          activeDotColor:
                              Theme.of(context).colorScheme.secondary,
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
                          'Next',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp),
                        )),
                  ]),
            ),
    );
  }
}
