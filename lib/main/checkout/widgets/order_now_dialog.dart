import 'package:flutter/material.dart';

import 'package:kay_sy/main/checkout/widgets/submit_dialog/canel_button.dart';
import 'package:kay_sy/main/checkout/widgets/submit_dialog/checkout_dialog_content.dart';
import 'package:kay_sy/main/checkout/widgets/submit_dialog/location_button.dart';
import 'package:kay_sy/main/checkout/widgets/submit_dialog/submit_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderNowDialog extends StatelessWidget {
  const OrderNowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        // ARE YOU SURE YOU WANT TO SUBMIT THIS ORDER
        AppLocalizations.of(context)!.submitOrder,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: const [
        //SUBMIT BUTTON
        SubmitButton(),

        //ADD ADDRESS/ CHANGE LOCATION BUTTON
        LocationButton(),

        //CANCEL BUTOTN
        CancelButton()
      ],
      content: const CheckoutDialogContent(),
    );
  }
}
