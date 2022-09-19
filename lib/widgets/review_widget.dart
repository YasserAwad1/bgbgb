import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kay_sy/models/review_model.dart';
import 'package:kay_sy/providers/user_provider.dart';
import 'package:kay_sy/widgets/rating_star_widget.dart';
import 'package:provider/provider.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel review;
  ReviewWidget({required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Text(
              //   user.name,
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              // ),
              SizedBox(width: 4.w),
              RatingBar.builder(
                onRatingUpdate: (value) {},
                itemSize: 15.sp,
                initialRating: review.rating,
                glow: false,
                ignoreGestures: true,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              Spacer(),
              Text(
                DateFormat('dd/MM/yyyy').format(review.date),
              )
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          if (review.content != null)
            Text(
              review.content!,
              style: TextStyle(fontSize: 15.sp),
            ),
          if (review.image != null)
            SizedBox(
              height: 180.h,
              child: Image.network(review.image!),
            ),
          const Divider(
            thickness: 3,
          ),
        ],
      ),
    );
  }
}
