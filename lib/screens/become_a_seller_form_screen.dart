import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/screens/first_screen.dart';
import 'package:kay_sy/widgets/custom_button.dart';

import '../widgets/custom_textformfield.dart';

class BecomeASellerFormScreen extends StatelessWidget {
  static const routeName = '/become-a-seller-form-screen';
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
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
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: Text(
                            'Are you sure you want to cancel ?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      FirstScreen.routeName);
                                },
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('No'))
                          ],
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                ),
                Spacer(),
                const Text(
                  'Become a seller',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
            CustomTextFormField(
                context: context,
                labelText: 'Full Name',
                initVal: null,
                inputAction: TextInputAction.next,
                myKeyboardType: TextInputType.name,
                myOnSaved: null,
                myValidator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter your name';
                  } else if (val.length < 5) {
                    return 'name must be atleast 5 characters long';
                  }
                  return null;
                },
                myController: null,
                isEnabled: true),
            CustomTextFormField(
                context: context,
                labelText: 'Contact Number',
                initVal: null,
                inputAction: TextInputAction.done,
                myKeyboardType: TextInputType.phone,
                myOnSaved: null,
                myValidator: (val) {
                  if (val!.isEmpty) {
                    return 'please enter your phone number';
                  } else if (val.trim().length != 10) {
                    return 'phone number must be 10 characters long';
                  }
                  return null;
                },
                myController: null,
                isEnabled: true),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'We will contact you and set a meeting so you can sign some papers, the contact number you entered must be valid.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: CustomButton(
              text: 'Sumbit',
              onTap: () {},
              width: double.infinity.w,
              height: 50.h)),
    );
  }
}
