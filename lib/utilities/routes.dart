import 'package:flutter/material.dart';
import 'package:weather/screens/home/home_screen.dart';
import 'package:weather/screens/search/search_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  SearchScreen.routeName: (context) => const SearchScreen()
};
