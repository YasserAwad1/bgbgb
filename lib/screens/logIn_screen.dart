import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kay_sy/models/user_model.dart';
import 'package:kay_sy/providers/user_provider.dart';
import 'package:kay_sy/screens/first_screen.dart';
import 'package:kay_sy/screens/walkThrough_scree.dart';
import 'package:provider/provider.dart';

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
  static final formKey = GlobalKey<FormState>();
  var _authMode = authMode.signUp;
  bool isLoading = false;
  UserModel user = UserModel(
    id: '',
    name: '',
    phoneNumber: '',
  );

  void _saveForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.of(context).pushReplacementNamed(FirstScreen.routeName);
    }
  }

  void signUp() {
    Provider.of<UserProvider>(context, listen: false).addUser(user);
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
                      label: const Text(
                        'Phone number',
                      ),
                      prefixIcon: Icon(Icons.phone,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'please enter your phone number';
                      } else if (val.length != 10) {
                        return 'phone number must be 10 characters long';
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
                          : const Text(
                              'login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account ?'),
                      TextButton(
                          onPressed: () {
                            switchAuthMode();
                          },
                          child: Text(
                            'Signup instead',
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
                    label: const Text('Full Name'),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please enter your name';
                    } else if (val.length < 3) {
                      return 'Name must be atleast 3 characters long';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    user = UserModel(
                        id: user.id, name: val!, phoneNumber: user.phoneNumber);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    helperText: 'ex:09XXXXXXXX',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    label: const Text(
                      'Phone number',
                    ),
                    prefixIcon: Icon(Icons.phone,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'please enter your phone number';
                    } else if (val.trim().length != 10) {
                      return 'phone number must be 10 characters long';
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
                    signUp();
                    // Navigator.of(context)
                    //     .pushReplacementNamed(WalkThroughScreen.routeName);
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : const Text(
                          'Signup',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account ?'),
                    TextButton(
                        onPressed: () {
                          switchAuthMode();
                        },
                        child: Text(
                          'Login instead',
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