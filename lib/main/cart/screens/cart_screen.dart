import 'package:flutter/material.dart';
import 'package:kay_sy/main/cart/widgets/cart_products_list.dart';
import 'package:kay_sy/main/cart/widgets/cart_top_bar.dart';
import 'package:kay_sy/main/cart/widgets/cart_total.dart';
import 'package:kay_sy/main/cart/widgets/checkout_button.dart';
import 'package:kay_sy/common/widgets/loader.dart';
import 'package:provider/provider.dart';
import '../../../providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  static const routeName = 'cart-screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final _future;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          _future =
              Provider.of<CartProvider>(context, listen: false).getCartItems()
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
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
                    children: const [
                      CartTopBar(),
                      CartProductsList(),
                    ],
                  );
                }),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                children: const [CartTotal(), CheckoutButton()],
              ),
            ),
          ),
        ),
        if (Provider.of<CartProvider>(context).isLoading) const Loader()
      ],
    );
  }
}
