import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/main/home/widgets/NewsSlider.dart';
import 'package:kay_sy/main/home/widgets/SectionsGrid.dart';
import 'package:kay_sy/main/home/widgets/HomeAppBar.dart';
import 'package:kay_sy/main/home/widgets/TrendingSlider.dart';
import 'package:kay_sy/providers/cart_provider.dart';
import 'package:kay_sy/providers/language_provider.dart';
import 'package:kay_sy/main/home/widgets/coins_widget.dart';
import 'package:kay_sy/main/home/widgets/title_container.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String _selectedLocation = '';
  bool isInit = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<CartProvider>(context, listen: false).getCartItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = Provider.of<LanguageProvider>(context).isArabic();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //TOP APP BAR
              const HomeAppBar(),
              SizedBox(
                height: 0.h,
              ),
              // COINS WIDGET
              const CoinsWidget(),
              SizedBox(
                height: 20.h,
              ),
              //NEWS SLIDER
              const NewsSlider(),
              SizedBox(
                height: 20.h,
              ),
              //   TRENDING
              Align(
                alignment:
                    isArabic ? const Alignment(1, -1) : const Alignment(-1, 1),
                //TRENDING TITLE
                child: TitleContainer(
                  title: AppLocalizations.of(context)!.trending,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              //TRENDING PRODUCTS SLIDER
              TrendingProductsSlider(),
              SizedBox(
                height: 20.h,
              ),
              //SECTIONS TITLE
              Align(
                  alignment: isArabic
                      ? const Alignment(1, -1)
                      : const Alignment(-1, 1),
                  child: TitleContainer(
                    title: AppLocalizations.of(context)!.sections,
                  )),
              SizedBox(
                height: 10.h,
              ),
              //SECTIONS GRID
              const SectionsGrid(),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
