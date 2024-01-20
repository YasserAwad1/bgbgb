
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/providers/language_provider.dart';
import 'package:kay_sy/main/search/screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:kay_sy/config.dart';
import 'l10n/l10n.dart';

import './providers/address_provider.dart';
import './providers/product_provider.dart';
import './providers/cart_provider.dart';
import 'main/settings/screens/become_a_seller/become_seller_screen.dart';
import 'providers/sections_provider.dart';
import 'providers/user_provider.dart';
import './providers/order_provider.dart';

import 'main/products/screens/products_screen.dart';
import 'common/screens/first_screen.dart';
import 'main/products/screens/product_details_screen.dart';
import 'main/cart/screens/cart_screen.dart';
import 'screens/add_address_screen.dart';
import 'main/checkout/screens/checkOut_screen.dart';
import 'main/settings/screens/orders_screen.dart';
import 'main/settings/screens/edit_profile_screen.dart';
import 'main/settings/screens/locations_screen.dart';
import './screens/logIn_screen.dart';
import './screens/walkThrough_scree.dart';
import 'main/settings/screens/become_a_seller/become_a_seller_form_screen.dart';
import 'screens/sellerScreens/seller_screen.dart';
import 'package:kay_sy/main/favorites/screens/favorites_screen.dart';
import './screens/sellerScreens/add_product_screen.dart';
import './screens/sellerScreens/my_products_screen.dart';

void main() async {
  print('aa');
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();
  // Provider.debugCheckInvalidValueType = null;
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
          ChangeNotifierProvider(
            create: (ctx) => AddressProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => OrderProvider(),
          ),
          ChangeNotifierProvider<LanguageProvider>(
            create: (ctx) => LanguageProvider(),
          )
        ],
        child: Builder(
          builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: Provider.of<LanguageProvider>(context, listen: true)
                .currentLocale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            // localizationsDelegates:
            //     translator.delegates,
            // locale: translator.activeLocale,
            // supportedLocales: translator.locals(),
            themeMode: ThemeMode.light,
            darkTheme: ThemeData.dark(),

            builder: (context, child) => SafeArea(child: child!),
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.grey[300],
              fontFamily: "AnekMalayalam",
              colorScheme: ColorScheme.fromSwatch().copyWith(
                // primary: const Color.fromARGB(255, 29, 14, 70),
                primary: Colors.black,
                secondary: const Color.fromARGB(255, 227, 99, 99),
              ),
            ),
            routes: {
              FirstScreen.routeName: (ctx) => FirstScreen(),
              ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              ProductsScreen.routeName: (ctx) => ProductsScreen(),
              LocationsScreen.routeName: (ctx) => LocationsScreen(),
              EditProfileScreen.routeName: (context) => EditProfileScreen(),
              AddAddressScreen.routeName: (ctx) => AddAddressScreen(),
              CheckOutScreen.routeName: (ctx) => CheckOutScreen(),
              OrdersScreen.routeName: (ctx) => OrdersScreen(),
              BecomeASellerScreen.routeName: (ctx) => BecomeASellerScreen(),
              LogInScreen.routeName: (ctx) => LogInScreen(),
              WalkThroughScreen.routeName: (ctx) => WalkThroughScreen(),
              SearchScreen.routeName: (ctx) => SearchScreen(),
              BecomeASellerFormScreen.routeName: (ctx) =>
                  BecomeASellerFormScreen(),
              SellerScreen.routeName: (ctx) => SellerScreen(),
              FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
              AddProductScreen.routeName: (ctx) => AddProductScreen(),
              MyProductsScreen.routeName: (ctx) => MyProductsScreen(),
            },
            home: FirstScreen(),
          ),
        ),
      ),
    );
  }
}
