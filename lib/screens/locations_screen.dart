import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/address_model.dart';
import 'package:kay_sy/providers/address_provider.dart';
import 'package:kay_sy/screens/add_address_screen.dart';
import 'package:kay_sy/widgets/address_widget.dart';
import 'package:kay_sy/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class LocationsScreen extends StatelessWidget {
  static const routeName = '/locations';
  @override
  Widget build(BuildContext context) {
    final List<AddressModel> addresses =
        Provider.of<AddressProvider>(context).addresses;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: CustomButton(
            height: 50.h,
            width: 200.w,
            text: "Add Address",
            onTap: () {
              Navigator.of(context).pushNamed(AddAddressScreen.routeName);
            },
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                  ),
                ),
                Spacer(),
                const Text(
                  'Edit Your adresses',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            addresses.isEmpty
                ? const Center(
                    child: Text('No Locations yet, try to add one'),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: addresses.length,
                      itemBuilder: (ctx, i) =>
                          AddressWidget(address: addresses[i]),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
