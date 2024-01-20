import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../common/screens/first_screen.dart';

class BASDialog extends StatelessWidget {
  const BASDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                FirstScreen.routeName, (Route<dynamic> route) => false);
            // formKey.currentState!.dispose();
          },
          child: Text(
            //   yes
            AppLocalizations.of(context)!.yes,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        TextButton(
            // no
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context)!.no))
      ],
    );
  }
}
