import 'package:flutter/material.dart';

import 'package:project_name/provider/provider.dart';
import 'package:project_name/screen/home_page.dart';
import 'package:provider/provider.dart';
import 'route/route_page.dart' as route;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);
  final _navKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp(
        initialRoute: '/',
        routes: route.routes,
        navigatorKey: _navKey,
        title: 'Flutter Demo',
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
