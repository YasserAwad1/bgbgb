import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kay_sy/widgets/custom_button.dart';
import 'package:kay_sy/widgets/custom_textfield.dart';
import 'package:rive/rive.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = '/edit_profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 45.w,
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
               Text(
                 // EDIT YOUR PROFILE 
                AppLocalizations.of(context)!.editProfile,
                style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              Spacer()
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
              height: 250.h, child: const RiveAnimation.asset('assets/edit.riv')),
          CustomTextField(label: "Edit your name"),
          SizedBox(
            height: 20.h,
          ),
          // CustomTextField(label: "Edit your email"),
          // SizedBox(
          //   height: 20.h,
          // ),
          CustomTextField(label: "Edit your number"),
          SizedBox(
            height: 20.h,
          ),
          // SAVE
          CustomButton(text: AppLocalizations.of(context)!.save, onTap: () {}, width: 200.w, height: 50.h)
        ],
      )),
    );
  }
}
