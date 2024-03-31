import 'package:flutter/material.dart';

import 'core/route/app_route.dart';
import 'core/route/app_route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CinéTix",
      themeMode: ThemeMode.light,
      theme: ThemeData(fontFamily: 'Montserrat_3'),
      initialRoute: AppRouteName.home,
      onGenerateRoute: AppRoute.generate,
    );
  }
}
