import 'package:flutter/material.dart';
import 'package:kay_sy/screens/add_address_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../providers/address_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/address_model.dart';

class AddressWidget extends StatelessWidget {
  final AddressModel address;
  AddressWidget({required this.address});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).colorScheme.secondary,
      elevation: 2,
      child: ExpansionTile(
        title: Text("Damascus"),
        subtitle: Text(address.street),
        trailing: SizedBox(
          width: 90.w,
          child: Row(
            children: [
              IconButton(
                color: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(AddAddressScreen.routeName,
                      arguments: address.id);
                },
              ),
              IconButton(
                color: Theme.of(context).errorColor,
                icon: Icon(Icons.delete),
                onPressed: () {
                  Provider.of<AddressProvider>(context, listen: false)
                      .removeAddress(address.id);
                },
              ),
            ],
          ),
        ),
        children: [
          Text("${AppLocalizations.of(context)!.bn} ${address.buildingNumber}"),
          if (address.description != null)
            Text(
                "${AppLocalizations.of(context)!.details} ${address.description!}"),
        ],
      ),
    );
  }
}
