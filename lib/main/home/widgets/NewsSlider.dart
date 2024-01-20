import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/events/event_model.dart';
import '../../../providers/product_provider.dart';
import 'event_widget.dart';

class NewsSlider extends StatelessWidget {
  const NewsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return CarouselSlider.builder(
      itemCount: productProvider.trendingProducts.length,
      itemBuilder: (context, index, e) {
        return EventWidget(
          event: EventModel(
            id: 'aaa',
            description: 'wwwww',
            image:
                'https://images.unsplash.com/photo-1533745848184-3db07256e163?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80',
            title: 'wwww',
          ),
        );
      },
      options: CarouselOptions(
        // enlargeCenterPage: true,
        autoPlay: true,
        viewportFraction: 1,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        clipBehavior: Clip.none,
      ),
    );
  }
}
