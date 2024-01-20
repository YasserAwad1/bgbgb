import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/main/home/widgets/AddressBottomSheet.dart';
import 'package:provider/provider.dart';

import '../../../providers/address_provider.dart';

class DeliverToWidget extends StatelessWidget {
  const DeliverToWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 1,
      onTap: () => showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          )),
          context: context,
          builder: (builder) {
            return const AddressBottomSheet();
          }),
      leading: Icon(
        Icons.location_on_outlined,
        color: Theme.of(context).colorScheme.primary,
      ),

      //DELIVER TO
      title: Text(
        AppLocalizations.of(context)!.delivery,
        style: TextStyle(
            fontSize: 14.sp,
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold),
      ),

      //PLEASE ADD AN ADDRESS
      subtitle: Text(
        overflow: TextOverflow.clip,
        Provider.of<AddressProvider>(context).selectedAddress == null
            ? "Please Add an address"
            : Provider.of<AddressProvider>(context).selectedAddress!.street,
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.black,
        ),
      ),
      trailing: const Icon(Icons.expand_more_rounded),
    );
  }
}
