import 'package:flutter/material.dart';

class AddReviewButton extends StatefulWidget {
  bool expandForReview;
  AddReviewButton({
    required this.expandForReview,
  });

  @override
  State<AddReviewButton> createState() => _AddReviewButtonState();
}

class _AddReviewButtonState extends State<AddReviewButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary),
        onPressed: () {
          setState(() {
            widget.expandForReview = true;
            print(widget.expandForReview);
          });
        },
        icon: const Icon(Icons.add_comment_rounded),
        label: const Text('Add a review'));
  }
}
