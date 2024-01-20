import 'package:flutter/material.dart';
import 'package:kay_sy/main/settings/widgets/orders/go_top_shop_button.dart';
import 'package:kay_sy/main/settings/widgets/orders/orders_top_bar.dart';
import 'package:provider/provider.dart';

import '../../../providers/order_provider.dart';
import '../widgets/orders/order_widget.dart';

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
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  const OrdersTopBar(),
                  orderData.orders.isEmpty
                      ? const GoToShopButton()
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
