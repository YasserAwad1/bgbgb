import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kay_sy/screens/first_screen.dart';
import 'package:kay_sy/widgets/custom_button.dart';

import '../widgets/custom_textformfield.dart';

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
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: Text(
                            // sure you want ot cancel
                            AppLocalizations.of(context)!.sureToCancel,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      FirstScreen.routeName,
                                      (Route<dynamic> route) => false);
                                  ;
                                  // formKey.currentState!.dispose();
                                },
                                child: Text(
                                  //   yes
                                  AppLocalizations.of(context)!.yes,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                )),
                            TextButton(
                                // no
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(AppLocalizations.of(context)!.no))
                          ],
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  AppLocalizations.of(context)!.becomeSeller,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
              ],
            ),
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
              height: 50.h)),
    );
  }
}
