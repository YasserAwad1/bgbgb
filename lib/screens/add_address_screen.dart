import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kay_sy/providers/address_provider.dart';
import 'package:provider/provider.dart';

import 'package:kay_sy/models/address_model.dart';

import 'package:kay_sy/widgets/custom_textformfield.dart';

import '../widgets/custom_button.dart';

class AddAddressScreen extends StatefulWidget {
  static const routeName = '/addAddressScreen';

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  static final _formKey = GlobalKey<FormState>();

  // var _initValues = {
  //   'city': '',
  //   'street': '',
  //   'buildingNumber': '',
  //   'floor': '',
  //   'description': ''
  // };

  // var isInit = true;

  // @override
  // void didChangeDependencies() {
  //   if (isInit) {
  //     if (newAddress.id != null) {
  //       _initValues = {
  //         'city': newAddress.city,
  //         'street': newAddress.street,
  //         'buildingNumber': newAddress.buildingNumber,
  //         'floor': newAddress.floor,
  //         'description': newAddress.description!,
  //       };
  //     }
  //   }
  //   isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    var newAddress = AddressModel(
        id: '',
        city: '',
        street: '',
        buildingNumber: '',
        floor: '',
        description: '');

    void _saveForm() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        // print('saved');
        Provider.of<AddressProvider>(context, listen: false)
            .addAddress(newAddress);
        Navigator.of(context).pop();
        // print(newAddress.street);
      }
      return;
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                    AppLocalizations.of(context)!.addNewAddress,
                    style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  const Spacer()
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        // city
                          context: context,
                          labelText: AppLocalizations.of(context)!.city,
                          suffix: '',
                          initVal: 'Damascus',
                          inputAction: TextInputAction.next,
                          myKeyboardType: TextInputType.text,
                          myOnSaved: (value) => newAddress = AddressModel(
                              id: newAddress.id,
                              city: value!,
                              street: newAddress.street,
                              buildingNumber: newAddress.buildingNumber,
                              floor: newAddress.floor,
                              description: newAddress.description),
                          myValidator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provider a value';
                            }
                            return null;
                          },
                          myController: null,
                          isEnabled: false),
                      CustomTextFormField(
                        // street
                          context: context,
                          labelText: AppLocalizations.of(context)!.street,
                          suffix: '',
                          initVal: null,
                          inputAction: TextInputAction.next,
                          myKeyboardType: TextInputType.text,
                          myOnSaved: (value) => newAddress = AddressModel(
                              id: newAddress.id,
                              city: newAddress.city,
                              street: value!,
                              buildingNumber: newAddress.buildingNumber,
                              floor: newAddress.floor,
                              description: newAddress.description),
                          myValidator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!.pleaseAddStreet;
                            }
                            return null;
                          },
                          myController: null,
                          isEnabled: true),
                      CustomTextFormField(
                          context: context,
                          labelText: AppLocalizations.of(context)!.bn,
                          suffix: '',
                          initVal: null,
                          inputAction: TextInputAction.next,
                          myKeyboardType: TextInputType.text,
                          myOnSaved: (value) => newAddress = AddressModel(
                              id: newAddress.id,
                              city: newAddress.city,
                              street: newAddress.street,
                              buildingNumber: value!,
                              floor: newAddress.floor,
                              description: newAddress.description),
                          myValidator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!.pleaseAddBn;
                            }
                            return null;
                          },
                          myController: null,
                          isEnabled: true),
                      CustomTextFormField(
                          context: context,
                          labelText: AppLocalizations.of(context)!.floor,
                          suffix: '',
                          initVal: null,
                          inputAction: TextInputAction.next,
                          myKeyboardType: TextInputType.text,
                          myOnSaved: (value) => newAddress = AddressModel(
                              id: newAddress.id,
                              city: newAddress.city,
                              street: newAddress.street,
                              buildingNumber: newAddress.buildingNumber,
                              floor: value!,
                              description: newAddress.description),
                          myValidator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!.pleaseAddFloor;
                            }
                            return null;
                          },
                          myController: null,
                          isEnabled: true),
                      CustomTextFormField(
                          context: context,
                          labelText: AppLocalizations.of(context)!.details,
                          suffix: '',
                          initVal: null,
                          inputAction: TextInputAction.done,
                          myKeyboardType: TextInputType.multiline,
                          myOnSaved: (value) => newAddress = AddressModel(
                              id: newAddress.id,
                              city: newAddress.city,
                              street: newAddress.street,
                              buildingNumber: newAddress.buildingNumber,
                              floor: newAddress.floor,
                              description: value),
                          myValidator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!.pleaseAddDetails;
                            }
                            return null;
                          },
                          myController: null,
                          isEnabled: true),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: CustomButton(
              text: AppLocalizations.of(context)!.save, onTap: _saveForm, width: 200.w, height: 50.h)
        ),
      ),
    );
  }
}
