import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_name/mockup/personal_mockup.dart';
import 'package:project_name/model/personal_Info.dart';
import 'package:project_name/screen/add_information.dart';
import 'package:project_name/screen/home_page.dart';

class HomePageContext with ChangeNotifier {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();



  TextEditingController get firstName => firstNameController;
  TextEditingController get lastName => lastNameController;
  TextEditingController get phoneNumber => phoneNumberController;
  TextEditingController get email => emailController;
  TextEditingController get address => addressController;
  TextEditingController get idNumber => idNumberController;


  void provinces(String provider) {
    listProvince.add(provider);
  }

  void increment(
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String address,
    String idNumber,
    String value,
  ) {
    firstNameController.text = firstName;
    lastNameController.text = lastName;
    phoneNumberController.text = phoneNumber;
    emailController.text = email;
    addressController.text = address;
    idNumberController.text = idNumber;
    value = value;
    // province.addAll(lisInfoAll);
    lisInfoAll.add(
      PersonalInfo(
        province: value,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        address: address,
        idNumber: idNumber,
      ),
    );

    // print(firstName);
    // print(lastName);
    // print(phoneNumber);
    // print(email);
    // print(address);
    print(jsonEncode(province));
    // print(jsonEncode(listProvince));

    notifyListeners();
  }
}
