import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/config.dart';
import 'package:kay_sy/screens/products_screen.dart';
import 'package:provider/provider.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import './providers/product_provider.dart';
import './providers/cart_provider.dart';
import '../screens/first_screen.dart';
import './screens/product_details_screen.dart';
import './screens/cart_screen.dart';
import 'providers/sections_provider.dart';

void main()  {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  // await translator.init(
  //   localeType: LocalizationDefaultType.device,
  //   languagesList: <String>['ar', 'en'],
  //   assetsDirectory: 'assets/languages/',
  // );

  runApp(
    MyApp(),
  );
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
          )
        ],
        child: MaterialApp(
          // localizationsDelegates:
          //     translator.delegates, 
          // locale: translator.activeLocale, 
          // supportedLocales: translator.locals(),
          themeMode: currentTheme.currentTheme(),
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
            ProductsScreen.routeName: (ctx) => ProductsScreen()
          },
          home: FirstScreen(),
        ),
      ),
    );
  }
}
