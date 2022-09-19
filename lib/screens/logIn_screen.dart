import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/user_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kay_sy/providers/user_provider.dart';
import 'package:kay_sy/screens/first_screen.dart';
import 'package:kay_sy/screens/walkThrough_scree.dart';
import 'package:provider/provider.dart';

import '../screens/otp_screen.dart';

enum authMode {
  logIn,
  signUp,
}

class LogInScreen extends StatefulWidget {
  //routename
  static const routeName = '/logInScreen';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _controller = TextEditingController();
  static final formKey = GlobalKey<FormState>();
  var _authMode = authMode.signUp;
  bool isLoading = false;
  UserModel user = UserModel(
    id: '',
    name: '',
    phoneNumber: '',
  );

  void signUp() {
    Provider.of<UserProvider>(context, listen: false).addUser(user);
  }

  void _saveForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      signUp();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => OTPScreen(_controller.text)));
    }
  }

  void switchAuthMode() {
    if (_authMode == authMode.logIn) {
      setState(() {
        _authMode = authMode.signUp;
      });
    } else {
      setState(() {
        _authMode = authMode.logIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: _authMode == authMode.logIn
            ? CustomLogIn(context)
            : CustomSignUp(context),
      ),
    );
  }

  Container CustomLogIn(BuildContext context) {
    return Container(
      height: 210.h,
      width: 340.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Colors.black,
        elevation: 20,
        color: Colors.white.withOpacity(0.8),
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      helperText: 'ex:09XXXXXXXX',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      label:  Text(
                        AppLocalizations.of(context)!.phoneNumber,
                      ),
                      prefixIcon: Icon(Icons.phone,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    validator: (val) {
                      if (val!.isEmpty) {
                        //please enter your phone number
                        return AppLocalizations.of(context)!.pleaseEnterPhone;
                      } else if (val.length != 10) {
                        return AppLocalizations.of(context)!.phoneMustBe;
                      }
                      return null;
                    },
                    onSaved: (val) {
                      // _userData['Email'] = val!.trim();
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        // _logIn();
                      },
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            )
                            // LOGIN
                          : Text(
                              AppLocalizations.of(context)!.login,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //DONT HAVE AN ACCOUNT
                      Text(AppLocalizations.of(context)!.dontHaveAccount),
                      TextButton(
                          onPressed: () {
                            switchAuthMode();
                          },
                          // SIGNUP INSTEAD
                          child: Text(
                            AppLocalizations.of(context)!.signupInstead,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  SizedBox CustomSignUp(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: 340.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Colors.black,
        elevation: 20,
        color: Colors.white.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  // autofocus: true,
                  // enabled: true,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    // FULL NAME
                    label: Text(AppLocalizations.of(context)!.fullName),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return AppLocalizations.of(context)!.enterName;
                    } else if (val.length < 3) {
                      return AppLocalizations.of(context)!.nameMustBe;
                    }
                    return null;
                  },
                  onSaved: (val) {
                    user = UserModel(
                        id: user.id, name: val!, phoneNumber: user.phoneNumber);
                  },
                ),
                TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    prefix: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('+963'),
                    ),
                    helperText: 'ex:09XXXXXXXX',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    // PHONE NUMBER 
                    label: Text(
                      AppLocalizations.of(context)!.phoneNumber,
                    ),
                    prefixIcon: Icon(Icons.phone,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  validator: (val) {
                    if (val!.isEmpty) {
                      // PLEASE ENTER PHONE NUMBER
                      return AppLocalizations.of(context)!.pleaseEnterPhone;
                    } else if (val.trim().length != 10) {
                      //PHNOE NUMBER MUST BE 10 .....
                      return AppLocalizations.of(context)!.phoneMustBe;
                    }
                    return null;
                  },
                  onSaved: (val) {
                    user = UserModel(
                        id: user.id, name: user.name, phoneNumber: val!);
                  },
                ),
                TextButton(
                  onPressed: () {
                    _saveForm();
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        )
                        // SIGNUP 
                      : Text(
                          AppLocalizations.of(context)!.signUp,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                ),
                // Already have an account ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text(AppLocalizations.of(context)!.alreadyHaveAccount),
                    TextButton(
                        onPressed: () {
                          switchAuthMode();
                        },
                        // LOGIN INSTEAD
                        child: Text(
                          AppLocalizations.of(context)!.logInInstead,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
