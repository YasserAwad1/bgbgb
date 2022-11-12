import 'package:flutter/material.dart';
import 'package:kay_sy/providers/user_provider.dart';
import 'package:kay_sy/screens/search_screen.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../screens/favorites_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';
import 'sellerScreens/seller_screen.dart';

class FirstScreen extends StatefulWidget {
  static const routeName = '/first-screen';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // final user = Provider.of<UserProvider>(context)
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: _listOfWidget,
        ),
      ),
      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: Colors.white,
        onButtonPressed: onButtonPressed,
        iconSize: 30,
        selectedIndex: selectedIndex,
        barItems: <BarItem>[
          BarItem(
            icon: Icons.home,
            title: AppLocalizations.of(context)!.home,
            activeColor: Theme.of(context).colorScheme.secondary,
            inactiveColor: Theme.of(context).colorScheme.primary,
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: AppLocalizations.of(context)!.search,
            activeColor: Theme.of(context).colorScheme.secondary,
            inactiveColor: Theme.of(context).colorScheme.primary,
          ),
          BarItem(
            icon: Icons.sell_rounded,
            title: 'Dashboard',
            activeColor: Theme.of(context).colorScheme.secondary,
            inactiveColor: Theme.of(context).colorScheme.primary,
          ),
          // BarItem(
          //   icon: Icons.favorite,
          //   title: AppLocalizations.of(context)!.favorites,
          //   activeColor: Theme.of(context).colorScheme.secondary,
          //   inactiveColor: Theme.of(context).colorScheme.primary,
          // ),
          BarItem(
            icon: Icons.settings,
            title: AppLocalizations.of(context)!.settings,
            activeColor: Theme.of(context).colorScheme.secondary,
            inactiveColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }

  final List<Widget> _listOfWidget = <Widget>[
    HomeScreen(),
    SearchScreen(),
    SellerScreen(),
    // FavoritesScreen(),
    SettingsScreen(),
  ];
}
