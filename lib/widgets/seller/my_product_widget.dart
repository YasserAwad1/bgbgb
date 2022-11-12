import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.h,
        width: double.infinity,
        child: Row(
          children: [
            //image
            Container(
              height: 100.h,
              width: 100.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "https://m.media-amazon.com/images/I/51N6YHeigOS._AC_SY580_.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ), //title
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'title',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "AnekMalayalam",
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'price',
                      style: TextStyle(
                          color: Colors.grey[600], fontSize: 12.sp),
                      children: [
                        TextSpan(
                          // SYP
                          text:
                              ' ${AppLocalizations.of(context)!.currency}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                            fontFamily: 'AnekMalayalam',
                          ),
                        ),
                      ],
                    ),
                  ),
                  //total
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}