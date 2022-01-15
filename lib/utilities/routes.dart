import 'package:flutter/material.dart';
import 'package:weather/screens/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen()
};
