import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String title;
  CategoryWidget({
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 100,
            width: 150,
            decoration:
                BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
            child: Image.asset(
              image,
              //color: Theme.of(context).colorScheme.primary,
            )),
        const SizedBox(
          height: 5,
        ),
        Container(
          child: FittedBox(
            child: Center(
                child: Text(
              title,
              softWrap: true,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )),
          ),
        ),
      ],
    );
  }
}
