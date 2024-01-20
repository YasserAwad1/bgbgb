import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../providers/language_provider.dart';

class BASTopBar extends StatelessWidget {
  const BASTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = Provider.of<LanguageProvider>(context).isArabic();
    
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
              Navigator.of(context).pop();
            },
            icon: Icon(
              isArabic
                  ? Icons.arrow_back_ios_new_outlined
                  : Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ),
        const Spacer(),
        //BECOME A SELLER
        Text(
          AppLocalizations.of(context)!.becomeSeller,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
      ],
    );
  }
}
