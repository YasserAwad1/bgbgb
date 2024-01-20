import 'package:flutter/material.dart';
import 'package:kay_sy/main/settings/widgets/become_a_seller/BAS_form/BAS_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BASFormTopBar extends StatelessWidget {
  const BASFormTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: 45,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            onPressed: () {
              showDialog(
                  context: context, builder: (context) => const BASDialog());
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
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
      ],
    );
  }
}
