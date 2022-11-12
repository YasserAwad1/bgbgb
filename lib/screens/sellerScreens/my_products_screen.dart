import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../widgets/seller/my_product_widget.dart';

class MyProductsScreen extends StatelessWidget {
  static const routeName = '/my-products-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: 45,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                'My Products',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, i) => Column(
                children: [
                  MyProductWidget(),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context).colorScheme.secondary,
                    indent: 13.w,
                    endIndent: 13.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
