import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PdRatingWidget extends StatefulWidget {
  const PdRatingWidget({super.key});

  @override
  State<PdRatingWidget> createState() => _PdRatingWidgetState();
}

class _PdRatingWidgetState extends State<PdRatingWidget> {
  double pRating = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: const Alignment(-0.9, 1),
            child: Text(
              "Reviews",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 10.h,
        ),
        //Rating
        Container(
          padding: EdgeInsets.all(15.h),
          width: 300.w,
          margin: EdgeInsets.only(left: 30.w, right: 30.w),
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$pRating',
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(
                width: 15.w,
              ),
              RatingBar.builder(
                itemSize: 30.sp,
                initialRating: pRating,
                glow: false,
                ignoreGestures: true,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    pRating = rating;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
