import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../providers/address_provider.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final addressList = Provider.of<AddressProvider>(context).addresses;
    return TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      titlePadding: EdgeInsets.only(left: 8.sp, top: 5.sp),
                      title: Text(
                        // CHOOSE AN ADDRESS
                        AppLocalizations.of(context)!.chooseAddress,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        Container(
                          height: 250.h,
                          width: 300.w,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: addressList.length,
                            itemBuilder: (context, i) => Padding(
                              padding: EdgeInsets.all(10.sp),
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<AddressProvider>(context,
                                          listen: false)
                                      .selectLocation(addressList[i]);
                                  Navigator.of(context).pop();
                                },
                                child: Card(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          // STREET
                                          text: AppLocalizations.of(context)!
                                              .street,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                          children: [
                                            TextSpan(
                                                text: addressList[i].street,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary)),
                                          ]),
                                    ),
                                    RichText(
                                      // BUILDING NUMBER
                                      text: TextSpan(
                                          text:
                                              AppLocalizations.of(context)!.bn,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                          children: [
                                            TextSpan(
                                                text: addressList[i]
                                                    .buildingNumber,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary)),
                                          ]),
                                    ),
                                    RichText(
                                      // FLOOR
                                      text: TextSpan(
                                          text: AppLocalizations.of(context)!
                                              .floor,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                          children: [
                                            TextSpan(
                                                text: addressList[i].floor,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary)),
                                          ]),
                                    ),
                                    RichText(
                                      // DETAILS
                                      text: TextSpan(
                                          text: AppLocalizations.of(context)!
                                              .details,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                          children: [
                                            TextSpan(
                                                text:
                                                    addressList[i].description,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary)),
                                          ]),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ]));
        },
        child: Text(
          Provider.of<AddressProvider>(context).selectedAddress == null
              ? "Choose an address"
              : AppLocalizations.of(context)!.changeLocation,
          style: const TextStyle(color: Colors.grey),
        ));
  }
}
