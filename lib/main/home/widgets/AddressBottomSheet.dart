import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import '../../../providers/address_provider.dart';
import '../../../screens/add_address_screen.dart';


class AddressBottomSheet extends StatelessWidget {
  const AddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var addressProvider = Provider.of<AddressProvider>(context);
    var addressList = addressProvider.addresses;
    
    return Container(
      height: 250.h,
      child: Column(children: [
        Text(
          AppLocalizations.of(context)!.your_addresses,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        addressList.isEmpty
            ? SizedBox(
                height: 200.h,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // NO ADDRESSES YET
                      Text(
                        AppLocalizations.of(context)!.noAddress,
                        style: TextStyle(
                            fontFamily: 'AnekMalayalam',
                            color: Theme.of(context).errorColor,
                            fontSize: 16.sp),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context)
                                .pushNamed(AddAddressScreen.routeName);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_location_alt,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Text(
                                // ADD ADDRESS
                                AppLocalizations.of(context)!.addAddress,
                                style: TextStyle(
                                    fontFamily: 'AnekMalayalam',
                                    fontSize: 15.sp.sp),
                              )
                            ],
                          ))
                    ],
                  ),
                ))
            : Expanded(
                child: ListView.builder(
                  itemCount: addressList.length,
                  itemBuilder: (context, i) => GestureDetector(
                    onTap: () {
                      Provider.of<AddressProvider>(context, listen: false)
                          .selectLocation(addressList[i]);
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.h, vertical: 4.w),
                      child: Card(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //    STREET
                          RichText(
                            text: TextSpan(
                                text: AppLocalizations.of(context)!.street,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                children: [
                                  TextSpan(
                                      text: addressList[i].street,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                ]),
                          ),
                          //    BUILDING NUMBER
                          RichText(
                            text: TextSpan(
                                text: AppLocalizations.of(context)!.bn,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                children: [
                                  TextSpan(
                                      text: addressList[i].buildingNumber,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                ]),
                          ),
                          //     FLOOR
                          RichText(
                            text: TextSpan(
                                text: AppLocalizations.of(context)!.floor,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                children: [
                                  TextSpan(
                                      text: addressList[i].floor,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                ]),
                          ),
                          //     DETAILS
                          RichText(
                            text: TextSpan(
                                text: AppLocalizations.of(context)!.details,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                children: [
                                  TextSpan(
                                      text: addressList[i].description,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
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
              )
      ]),
    );
  }
}
