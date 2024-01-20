import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kay_sy/main/checkout/widgets/order_now_dialog.dart';
import 'package:kay_sy/main/checkout/widgets/address_dialog.dart';
import 'package:kay_sy/main/checkout/widgets/checkout_items_list.dart';
import 'package:kay_sy/main/checkout/widgets/checkout_top_bar.dart';
import 'package:kay_sy/main/checkout/widgets/receipt_widget.dart';

import 'package:provider/provider.dart';

import '../../../providers/address_provider.dart';

class CheckOutScreen extends StatefulWidget {
  static const routeName = '/checkOutScreen';

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    final addressList = Provider.of<AddressProvider>(context).addresses;

    // var Provider.of<AddressProvider>(context).selectedAddress! = addressList.first;

    // void changeLocation(AddressModel newAddress) {
    //   setState(() {
    //     Provider.of<AddressProvider>(context).selectedAddress! = newAddress;
    //   });
    // }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            //TOP BAR
            CheckoutTopBar(),

            //ITEMS LIST
            CheckoutItemsList(),

            //RECEIPT WIDGET
            ReceiptWidget(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  addressList.isEmpty
                      ? showDialog(
                          context: context,
                          builder: (context) => const AddressDialog(),
                        )
                      : showDialog(
                          context: context,
                          builder: (context) => const OrderNowDialog());
                },
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.orderNow,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontFamily: 'AnekMalayalam',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
