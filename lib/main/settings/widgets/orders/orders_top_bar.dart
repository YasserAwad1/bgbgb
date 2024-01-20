import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrdersTopBar extends StatelessWidget {
  const OrdersTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 45,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
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
        Text(
          AppLocalizations.of(context)!.myOrders,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const Spacer()
      ],
    );
  }
}
