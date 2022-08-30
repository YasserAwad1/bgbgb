import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/address_model.dart';
import 'package:kay_sy/providers/address_provider.dart';
import 'package:kay_sy/widgets/address_widget.dart';
import 'package:kay_sy/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class LocationsScreen extends StatelessWidget {
  static const routeName = '/locations';
  @override
  Widget build(BuildContext context) {
    final List<AddressModel> addresses =
        Provider.of<AddressProvider>(context).addresses;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: CustomButton(
              height: 50.h, width: 200.w, text: "Add Address", onTap: () {})),
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: addresses.isEmpty
          ? Center(
              child: Text('No Locations try to add one'),
            )
          : ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (ctx, i) => AddressWidget(address: addresses[i]),
            ),
    );
  }
}
