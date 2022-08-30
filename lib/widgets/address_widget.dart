import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/address_model.dart';

class AddressWidget extends StatelessWidget {
  final AddressModel address;
  AddressWidget({required this.address});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(address.city),
      subtitle: Text(address.street),
      trailing: SizedBox(
        width: 90.w,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Provider.of<AddressProvider>(context, listen: false)
                //     .removeAddress(address.id);
              },
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Navigator.of(context).pushNamed(
                //     EditAddressScreen.routeName,
                //     arguments: address.id);
              },
            ),
          ],
        ),
      ),
      children: [
        Text("Building: ${address.buildingNumber}"),
        if (address.description != null) Text("Notes: " + address.description!),
      ],
    );
  }
}
