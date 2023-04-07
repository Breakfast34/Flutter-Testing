import 'package:flutter/material.dart';
import 'package:project_name/screen/add_information.dart';
import 'package:project_name/screen/home_page.dart';
import 'package:project_name/screen/view_info.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/homePage': (context) => HomePage(),
  '/addInfo': (context) => AddInformation(),
  '/viewInfo': (context) => ViewInfo(),
};
