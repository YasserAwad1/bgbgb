import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:kay_sy/screens/first_screen.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../l10n/l10n.dart';

class OTPScreen extends StatefulWidget {
  // static const routeName = '/otp-screen';
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  int? _resendToken;
  final TextEditingController _pinPutController = TextEditingController();
  final focusNode = FocusNode();
  int start = const Duration(seconds: 30).inSeconds;
  bool wait = false;

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = true;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  formatedTime({required int timeInSecond}) {
    int sec = start % 60;
    int min = (start / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  @override
  void dispose() {
    _pinPutController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final defaultPinTheme = const PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 22,
      color: Color.fromARGB(255, 227, 99, 99),
    ),
    decoration: BoxDecoration(),
  );

  final cursor = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 56,
        height: 3,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 227, 99, 99),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );

  final preFilledWidget = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 56,
        height: 3,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
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
              const Spacer(),
              const Text(
                'Verification Code',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const Spacer()
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h, left: 10.w),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'A 6-digit code has been sent to  ',
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: Theme.of(context).colorScheme.primary),
                  children: [
                    TextSpan(
                        text: '+963-${widget.phone}',
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary)),
                    TextSpan(
                        text:
                            '.\nPlease enter it below to verify your phone number.',
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Pinput(
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsRetrieverApi,
              length: 6,
              defaultPinTheme: defaultPinTheme,
              controller: _pinPutController,
              showCursor: true,
              cursor: cursor,
              preFilledWidget: preFilledWidget,
              focusNode: focusNode,
              pinAnimationType: PinAnimationType.slide,
              onSubmitted: (pin) async {
                if (_pinPutController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please enter the verification code !'),
                    backgroundColor: Theme.of(context).errorColor,
                  ));
                } else if (_pinPutController.text.length < 6) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Verification code must be 6 digits'),
                    backgroundColor: Theme.of(context).errorColor,
                  ));
                } else {
                  verification(pin);
                }
              },
            ),
          ),
          TextButton.icon(
            onPressed: () async {
              verification(_pinPutController.text);
            },
            icon: const Icon(
              Icons.verified_outlined,
              color: Colors.white,
            ),
            label: const Text(
              'Verify',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            style: TextButton.styleFrom(
                fixedSize: Size.fromWidth(130.w),
                backgroundColor: Theme.of(context).colorScheme.secondary),
          ),
          SizedBox(
            height: 13.h,
          ),
          if (wait == true)
            Text(
              'Did not get the code ?',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          if (wait == true)
            TextButton(
                onPressed: () {
                  _verifyPhone();
                  setState(() {
                    start = const Duration(seconds: 120).inSeconds;
                    wait = false;
                    startTimer();
                  });
                },
                child: Text(
                  'Resend code',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary),
                )),
          if (wait == false)
            Text(
              formatedTime(timeInSecond: start),
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+963${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
          print('error in verification');
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
            _resendToken = resendToken;
          });
        },
        forceResendingToken: _resendToken,
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  verification(String pin) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode!, smsCode: pin))
          .then((value) async {
        if (value.user != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => FirstScreen()),
              (route) => false);
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid verification code'),
        backgroundColor: Theme.of(context).errorColor,
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
    startTimer();
  }
}
