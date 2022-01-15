import 'package:flutter/material.dart';
import 'package:weather/utilities/theme.dart';
import 'screens/home_screen.dart';
import 'utilities/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: theme(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      //color: kBlack,
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
