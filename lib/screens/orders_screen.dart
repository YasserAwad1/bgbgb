import 'package:flutter/material.dart';
import 'package:kay_sy/screens/first_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/order_provider.dart';
import '../widgets/order_widget.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late final _future;
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      _future = Provider.of<OrderProvider>(context).getOrders();
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
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
                      const Spacer(),
                      Text(
                        AppLocalizations.of(context)!.myOrders,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      const Spacer()
                    ],
                  ),
                  orderData.orders.isEmpty
                      ? SizedBox(
                          height: 500.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  AppLocalizations.of(context)!.noOrders,
                                  style: TextStyle(
                                      fontFamily: "AnekMalayalam",
                                      fontSize: 20.sp),
                                ),
                              ),
                              TextButton.icon(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        FirstScreen.routeName);
                                  },
                                  icon: Icon(
                                    Icons.shopping_basket_outlined,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  label: Text(
                                      AppLocalizations.of(context)!.goToShop))
                            ],
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: orderData.orders.length,
                            itemBuilder: (ctx, i) =>
                                OrderWidget(orderData.orders[i]),
                          ),
                        ),
                ],
              );
            }),
      ),
    );
  }
}
