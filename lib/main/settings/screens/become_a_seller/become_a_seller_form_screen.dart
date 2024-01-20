import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kay_sy/main/settings/widgets/become_a_seller/BAS_form/BAS_form_top_bar.dart';
import 'package:kay_sy/common/widgets/custom_button.dart';

import '../../../../common/widgets/custom_textformfield.dart';

class BecomeASellerFormScreen extends StatelessWidget {
  static const routeName = '/become-a-seller-form-screen';
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const BASFormTopBar(),
            CustomTextFormField(
                context: context,
                labelText: AppLocalizations.of(context)!.fullName,
                suffix: '',
                initVal: null,
                inputAction: TextInputAction.next,
                myKeyboardType: TextInputType.name,
                myOnSaved: null,
                myValidator: (val) {
                  if (val!.isEmpty) {
                    return AppLocalizations.of(context)!.enterName;
                  } else if (val.length < 5) {
                    return AppLocalizations.of(context)!.nameMustBe;
                  }
                  return null;
                },
                myController: null,
                isEnabled: true),
            CustomTextFormField(
                context: context,
                labelText: AppLocalizations.of(context)!.contactNumber,
                suffix: '',
                initVal: null,
                inputAction: TextInputAction.done,
                myKeyboardType: TextInputType.phone,
                myOnSaved: null,
                myValidator: (val) {
                  if (val!.isEmpty) {
                    return AppLocalizations.of(context)!.pleaseEnterPhone;
                  } else if (val.trim().length != 10) {
                    return AppLocalizations.of(context)!.phoneMustBe;
                  }
                  return null;
                },
                myController: null,
                isEnabled: true),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.sellerLastLine,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: CustomButton(
          text: AppLocalizations.of(context)!.submit,
          onTap: () {},
          width: double.infinity.w,
          height: 50.h,
        ),
      ),
    );
  }
}
