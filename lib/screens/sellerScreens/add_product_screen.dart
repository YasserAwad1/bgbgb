import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kay_sy/widgets/custom_button.dart';

import '/widgets/custom_textformfield.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = '/add-product-screen';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton.icon(
            onPressed: () {
              selectImages();
            },
            icon: const Icon(
              Icons.add_photo_alternate_rounded,
              color: Colors.white,
            ),
            label: Text(
              'Add images',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary),
          ),
          CustomButton(
              text: 'Send request', onTap: () {}, width: 200.w, height: 50.h),
        ],
      )),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 45.w,
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
              Text(
                // ADD A PRODUCT
                'Add a product',
                style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
          CustomTextFormField(
              context: context,
              labelText: 'Product name',
              suffix: '',
              initVal: null,
              inputAction: TextInputAction.next,
              myKeyboardType: TextInputType.name,
              myOnSaved: null,
              myValidator: null,
              myController: null,
              isEnabled: true),
          CustomTextFormField(
              context: context,
              labelText: 'Product price',
              initVal: null,
              suffix: 'SYP',
              inputAction: TextInputAction.next,
              myKeyboardType: TextInputType.number,
              myOnSaved: null,
              myValidator: null,
              myController: null,
              isEnabled: true),
          CustomTextFormField(
              context: context,
              labelText: 'Product details',
              suffix: '',
              initVal: null,
              inputAction: TextInputAction.unspecified,
              myKeyboardType: TextInputType.multiline,
              myOnSaved: null,
              myValidator: null,
              myController: null,
              isEnabled: true),
          if (imageFileList!.isNotEmpty)
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: double.infinity,
                height: imageFileList!.length * 40 + 15,
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: GridView.builder(
                      // scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: imageFileList!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Image.file(
                          File(imageFileList![index].path),
                          fit: BoxFit.cover,
                        );
                      }),
                ),
              ),
            ),
          // SizedBox(
          //   height: 15.h,
          // ),
        ]),
      ),
    );
  }
}
