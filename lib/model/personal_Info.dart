// To parse this JSON data, do
//
//     final personalInfo = personalInfoFromJson(jsonString);

import 'dart:convert';

PersonalInfo personalInfoFromJson(String str) => PersonalInfo.fromJson(json.decode(str));

String personalInfoToJson(PersonalInfo data) => json.encode(data.toJson());

class PersonalInfo {
    PersonalInfo({
        required this.province,
        required this.firstName,
        required this.lastName,
        required this.phoneNumber,
        required this.email,
        required this.address,
        required this.idNumber,
    });

    final String province;
    final String firstName;
    final String lastName;
    final String phoneNumber;
    final String email;
    final String address;
    final String idNumber;

    factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        province: json["province"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        address: json["address"],
        idNumber: json["idNumber"],
    );

    Map<String, dynamic> toJson() => {
        "province": province,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "address": address,
        "idNumber": idNumber,
    };
}
