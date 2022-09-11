import 'package:flutter/material.dart';
import 'package:kay_sy/screens/first_screen.dart';
import 'package:kay_sy/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/order_provider.dart';
import '../widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context);
    return SafeArea(
      child: Scaffold(
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
                  'My orders',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Spacer()
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
                            'No orders yet, start shopping now!',
                            style: TextStyle(
                                fontFamily: "AnekMalayalam", fontSize: 20.sp),
                          ),
                        ),
                        TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(FirstScreen.routeName);
                            },
                            icon: Icon(Icons.shopping_basket_outlined, color: Theme.of(context).colorScheme.secondary,),
                            label: const Text('Go to shop'))
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: orderData.orders.length,
                      itemBuilder: (ctx, i) => OrderWidget(orderData.orders[i]),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
