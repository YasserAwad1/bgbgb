import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// class CommentWidget extends StatelessWidget {
//   const CommentWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 'userName',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
//               ),
//               SizedBox(width: 4.w),
//               FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: StarRating(
//                   onRatingChanged: ((rating) => setState(() {
//                         loadedProduct.rating = rating;
//                       })),
//                   color: Colors.amber,
//                   rating: loadedProduct.rating,
//                 ),
//               ),
//               Spacer(),
//               Text(
//                 DateFormat('dd/MM/yyyy').format(
//                   DateTime.now(),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 3,
//           ),
//           Text(
//             loadedProduct.comments,
//             style: TextStyle(fontSize: 15.sp),
//           ),
//           // Row(
//           //   children: [
//           //     Expanded(
//           //       child: ListView.builder(
//           //         scrollDirection: Axis.horizontal,
//           //         itemCount: 3,
//           //         physics: NeverScrollableScrollPhysics(),
//           //         shrinkWrap: true,
//           //         // gridDelegate:
//           //         //     const SliverGridDelegateWithFixedCrossAxisCount(
//           //         //         crossAxisCount: 1),
//           //         itemBuilder: (ctx, i) => Container(
//           //           height: 50,
//           //           width: 50,
//           //           child: Image.network(
//           //             loadedProduct.imageUrl,
//           //           ),
//           //         ),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           Divider(),
//         ],
//       ),
//     );
//   }
// }
