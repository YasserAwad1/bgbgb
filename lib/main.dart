import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/config.dart';
import 'package:kay_sy/providers/address_provider.dart';
import 'package:kay_sy/screens/edit_profile_screen.dart';
import 'package:kay_sy/screens/locations_screen.dart';

import 'package:kay_sy/screens/products_screen.dart';
import 'package:provider/provider.dart';

import './providers/product_provider.dart';
import './providers/cart_provider.dart';
import '../screens/first_screen.dart';
import './screens/product_details_screen.dart';
import './screens/cart_screen.dart';

import 'providers/sections_provider.dart';
import 'providers/user_provider.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }
  // final darkTheme = ThemeData(
  //   colorScheme: ColorScheme.fromSwatch().copyWith(
  //             // primary: const Color.fromARGB(255, 29, 14, 70),
  //             primary: Colors.black,
  //             secondary: Color.fromARGB(255, 227, 99, 99),
  //           ),
  //   iconTheme: IconThemeData(color: Color.fromARGB(255, 227, 99, 99)),
  //   primarySwatch: Colors.grey,
  //   primaryColor: Colors.white,
  //   brightness: Brightness.dark,
  //   backgroundColor: Colors.black,
  //   accentColor: Colors.white,
  //   accentIconTheme: IconThemeData(color: Colors.black),
  //   dividerColor: Colors.black12,
  // );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => ProductProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => SectionsProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => UserProvider(),
          ),
          ChangeNotifierProvider(create: (ctx) => AddressProvider())
        ],
        child: MaterialApp(
          // localizationsDelegates:
          //     translator.delegates,
          // locale: translator.activeLocale,
          // supportedLocales: translator.locals(),
          themeMode: ThemeMode.light,
          darkTheme: ThemeData.dark(),
          builder: (context, child) => SafeArea(child: child!),
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: "AnekMalayalam",
            colorScheme: ColorScheme.fromSwatch().copyWith(
              // primary: const Color.fromARGB(255, 29, 14, 70),
              primary: Colors.black,
              secondary: Color.fromARGB(255, 227, 99, 99),
            ),
          ),
          routes: {
            ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            ProductsScreen.routeName: (ctx) => ProductsScreen(),
            LocationsScreen.routeName: (ctx) => LocationsScreen(),
            EditProfileScreen.routeName: (context) => EditProfileScreen(),
          },
          home: FirstScreen(),
        ),
      ),
    );
  }
}
