import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'rating_star_widget.dart';

class CommentCardWidget extends StatefulWidget {
  bool expandForReview;
  CommentCardWidget({
    required this.expandForReview,
  });

  @override
  State<CommentCardWidget> createState() => _CommentCardWidgetState();
}

class _CommentCardWidgetState extends State<CommentCardWidget> {
  File? _pickedImage;
  ImageSource? source;
  double userRating = 0.0;

  Future pickImage() async {
    try {
      final selectedImage = await ImagePicker().pickImage(source: source!);
      if (selectedImage == null) return;
      final image = File(selectedImage.path);
      setState(() {
        _pickedImage = image;
      });
    } on PlatformException catch (e) {
      //FAILED TO PICK IMAGE
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 20,
      color: Colors.white.withOpacity(0.65),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        height: 200.h,
        width: 300.w,
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Rating ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                StarRating(
                    rating: userRating,
                    onRatingChanged: (newRating) {
                      setState(() {
                        userRating = newRating;
                      });
                    },
                    color: Colors.amber),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.expandForReview = false;
                    });
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text('Comment'),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: _pickedImage != null
                        ? Image.file(
                            _pickedImage!,
                            fit: BoxFit.cover,
                          )
                        : const FittedBox(
                            child: Center(
                            child: Text('no image'),
                          )),
                  ),
                ),
                const Spacer(),
                ElevatedButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Wrap(children: [
                                Column(
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.camera_alt),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        source = ImageSource.camera;
                                        pickImage();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.photo),
                                      title: const Text('Gallery'),
                                      onTap: () {
                                        source = ImageSource.gallery;
                                        pickImage();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              ]));
                    },
                    icon: const Icon(Icons.add_photo_alternate_rounded),
                    label: const Text('Add photo')),
                SizedBox(
                  width: 5.w,
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.secondary),
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Post review')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
