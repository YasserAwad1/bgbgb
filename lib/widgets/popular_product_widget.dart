import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kay_sy/providers/product_provider.dart';
import 'package:kay_sy/widgets/circle_container.dart';
import 'package:provider/provider.dart';

import '../screens/product_details_screen.dart' as details;
import '../models/product/product.dart';
import '../providers/cart_provider.dart';

class PopularProductWidget extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int price;
  final String description;
  final int index;

  PopularProductWidget({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.index,
  });

  @override
  State<PopularProductWidget> createState() => _PopularProductWidgetState();
}

class _PopularProductWidgetState extends State<PopularProductWidget> {
  @override
  Widget build(BuildContext context) {
    final price = NumberFormat('#,##,000').format(widget.price);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(details.ProductDetailsScreen.routeName, arguments: {
          'productId': widget.id,
          'productName': widget.title,
        });
      },
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        shadowColor: Theme.of(context).colorScheme.secondary,
        child: Container(
          //margin: EdgeInsets.only(left: 10),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Stack(
                children: [
                  //image
                  SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      widget.imageUrl,
                      height: 150.h,
                    ),
                  ),
                  //rating
                  Positioned(
                      left: 0.h,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                            )),
                        padding: EdgeInsets.all(5),
                        child: Row(children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "4.5 ",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.sp),
                          )
                        ]),
                      ))
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                alignment: Alignment.center,
                height: 40.h,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(10, 12, 0, 0),
                decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(
                        "$price SYP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite_border))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
