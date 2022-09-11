import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'package:kay_sy/widgets/custom_textformfield.dart';
import 'package:provider/provider.dart';
import '../providers/address_provider.dart';
import '../models/address_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditAddressScreen extends StatefulWidget {
  static const routeName = '/EditAdressScreen';

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  var _editedAddress = AddressModel(
      id: null.toString(),
      city: '',
      street: '',
      buildingNumber: '',
      floor: '',
      description: '');

  var _initValues = {
    'city': '',
    'street': '',
    'buildingNumber': '',
    'floor': '',
    'description': ''
  };

  var isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      final addressId = ModalRoute.of(context)!.settings.arguments as String;
      if (addressId != null) {
        _editedAddress = Provider.of<AddressProvider>(context, listen: false)
            .findById(addressId);
        _initValues = {
          'city': _editedAddress.city,
          'street': _editedAddress.street,
          'buildingNumber': _editedAddress.buildingNumber,
          'floor': _editedAddress.floor,
          'description': _editedAddress.description!,
        };
      }
    }
    isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    if (_editedAddress.id != null) {
      Provider.of<AddressProvider>(context, listen: false)
          .editAddress(_editedAddress.id, _editedAddress);
    } else {
      Provider.of<AddressProvider>(context, listen: false)
          .addAddress(_editedAddress);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    String? addressId = ModalRoute.of(context)!.settings.arguments as String?;
    AddressModel loadedAddress = addressProvider.findById(addressId!);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                        context: context,
                        labelText: 'City',
                        initVal: loadedAddress.city,
                        inputAction: TextInputAction.next,
                        myKeyboardType: TextInputType.text,
                        myOnSaved: null,
                        myValidator: null,
                        myController: null,
                        isEnabled: false),
                    CustomTextFormField(
                      context: context,
                      labelText: 'Street',
                      initVal: loadedAddress.street,
                      inputAction: TextInputAction.next,
                      myKeyboardType: TextInputType.text,
                      myOnSaved: (value) => _editedAddress = AddressModel(
                          id: _editedAddress.id,
                          city: _editedAddress.city,
                          street: value!,
                          buildingNumber: _editedAddress.buildingNumber,
                          floor: _editedAddress.floor,
                          description: _editedAddress.description),
                      myValidator: (value){
                        if(value!.isEmpty){
                          return 'please provide a value';
                        }
                        return null;
                      },
                      myController: null,
                      isEnabled: true,
                    ),
                    CustomTextFormField(
                        context: context,
                        labelText: 'Building number',
                        initVal: loadedAddress.buildingNumber,
                        inputAction: TextInputAction.next,
                        myKeyboardType: TextInputType.number,
                        myOnSaved: (value) => _editedAddress = AddressModel(
                            id: _editedAddress.id,
                            city: _editedAddress.city,
                            street: _editedAddress.street,
                            buildingNumber: value!,
                            floor: _editedAddress.floor,
                            description: _editedAddress.description),
                        myValidator: null,
                        myController: null,
                        isEnabled: true),
                    CustomTextFormField(
                        context: context,
                        labelText: 'Floor',
                        initVal: loadedAddress.floor,
                        inputAction: TextInputAction.next,
                        myKeyboardType: TextInputType.number,
                        myOnSaved: (value) => _editedAddress = AddressModel(
                            id: _editedAddress.id,
                            city: _editedAddress.city,
                            street: _editedAddress.street,
                            buildingNumber: _editedAddress.buildingNumber,
                            floor: value!,
                            description: _editedAddress.description),
                        myValidator: null,
                        myController: null,
                        isEnabled: true),
                    CustomTextFormField(
                        context: context,
                        labelText: 'Description',
                        initVal: loadedAddress.description!,
                        inputAction: TextInputAction.done,
                        myKeyboardType: TextInputType.multiline,
                        myOnSaved: (value) => _editedAddress = AddressModel(
                            id: _editedAddress.id,
                            city: _editedAddress.city,
                            street: _editedAddress.street,
                            buildingNumber: _editedAddress.buildingNumber,
                            floor: _editedAddress.floor,
                            description: value!),
                        myValidator: null,
                        myController: null,
                        isEnabled: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: CustomButton(
              text: "Submit", onTap: _saveForm, width: 200.w, height: 50.h)),
    );
  }
}
