import 'package:flutter/material.dart';

import '../../../screens/add_address_screen.dart';

class AddressDialog extends StatelessWidget {
  const AddressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        'You haven\'t added a shipping address !',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text('Please add an address to continue'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .restorablePopAndPushNamed(AddAddressScreen.routeName);
            },
            child: Text(
              'add address',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            )),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'))
      ],
    );
  }
}
