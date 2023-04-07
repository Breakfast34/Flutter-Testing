// import 'package:flutter/material.dart';
// import 'package:project_name/mockup/personal_mockup.dart';
// import 'package:project_name/model/personal_Info.dart';

// class Provider with ChangeNotifier {
//   final List<PersonalInfo> _personalInfoList = test;
//   List<PersonalInfo> get personalInfoList => _personalInfoList;
//   void addPersonalInfo(PersonalInfo personalInfo) {
//     _personalInfoList.add(personalInfo);
//     notifyListeners();
//   }
// }

import 'package:project_name/context/home_page_context.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get multiProviders {
  return [
    ChangeNotifierProvider(create: (context) => HomePageContext()),
  ];
}
