import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kay_sy/main/settings/widgets/locations/loctaion_app_bar.dart';
import 'package:kay_sy/models/address_model.dart';
import 'package:kay_sy/providers/address_provider.dart';
import 'package:kay_sy/screens/add_address_screen.dart';
import 'package:kay_sy/main/settings/widgets/locations/address_widget.dart';
import 'package:kay_sy/common/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class LocationsScreen extends StatefulWidget {
  static const routeName = '/locations';

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  late final _future;
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      _future = Provider.of<AddressProvider>(context).getAdresses();
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final List<AddressModel> addresses =
        Provider.of<AddressProvider>(context).addresses;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          // ADD ADDRESS BUTTON
          child: CustomButton(
            height: 50.h,
            width: 200.w,
            text: AppLocalizations.of(context)!.addAddress,
            onTap: () {
              Navigator.of(context).pushNamed(AddAddressScreen.routeName);
            },
          ),
        ),
        body: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  const LocationAppbar(),
                  SizedBox(
                    height: 20.h,
                  ),
                  addresses.isEmpty
                      ? Center(
                          child:
                              Text(AppLocalizations.of(context)!.noLocations),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: addresses.length,
                            itemBuilder: (ctx, i) => AddressWidget(
                              address: addresses[i],
                            ),
                          ),
                        ),
                ],
              );
            }),
      ),
    );
  }
}
