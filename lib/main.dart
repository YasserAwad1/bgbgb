import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/product_provider.dart';
import './providers/cart_provider.dart';
import '../screens/first_screen.dart';
import './screens/product_details_screen.dart';
import './screens/cart_screen.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color gold = const Color.fromRGBO(163, 138, 0, 1);
  Color myBlue = Color.fromARGB(255, 6, 30, 163);
  Color pink = Color.fromARGB(255, 227, 99, 99);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            // primary: const Color.fromARGB(255, 29, 14, 70),
            primary: Colors.black,
            secondary: gold,
          ),
        ),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
        home: FirstScreen(),
      ),
    );
  }
}
