import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kay_sy/constants.dart';
import 'package:kay_sy/models/cart/cart_model.dart';
import 'package:kay_sy/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckoutWidget extends StatelessWidget {
  final CartModel cartItem;
  const CheckoutWidget({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 50.h,
            width: 50.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "${Constants.baseUrl}/${cartItem.product.imageUrls[0]}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(cartItem.product.title),
          subtitle: Text(
            '${cartItem.quantity.toString()} X',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          trailing: Column(
            children: [
              Text(AppLocalizations.of(context)!.total,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary)),
              Text(NumberFormat()
                  .format(
                      Provider.of<CartProvider>(context).itemTotal(cartItem.id))
                  .toString())
            ],
          ),
        ),
        Divider(
          thickness: 0.45,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }
}
