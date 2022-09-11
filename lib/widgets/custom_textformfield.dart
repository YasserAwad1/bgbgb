import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {required this.context,
      required this.labelText,
      required this.initVal,
      required this.inputAction,
      required this.myKeyboardType,
      required this.myOnSaved,
      required this.myValidator,
      required this.myController,
      required this.isEnabled});

  final BuildContext context;
  final String labelText;
  final String? initVal;
  final TextInputAction inputAction;
  final TextInputType myKeyboardType;
  final void Function(String? p1)? myOnSaved;
  final String? Function(String? p1)? myValidator;
  final TextEditingController? myController;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved: myOnSaved,
        keyboardType: myKeyboardType,
        textInputAction: inputAction,
        validator: myValidator,
        enabled: isEnabled,
        initialValue: initVal,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary, fontSize: 20.sp),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
        ),
      ),
    );
  }
}
