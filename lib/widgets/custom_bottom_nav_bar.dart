import 'package:flutter/material.dart';
import 'package:weather/screens/home/home_screen.dart';
import 'package:weather/screens/search/search_screen.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/utilities/enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.location_pin,
                color: MenuState.map == selectedMenu
                    ? darkModePrimaryColor
                    : darkModeSecondaryColor,
                size: MenuState.home == selectedMenu ? 25 : 20,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, HomeScreen.routeName),
            ),
            IconButton(
              icon: Icon(
                Icons.home,
                color: MenuState.home == selectedMenu
                    ? darkModePrimaryColor
                    : darkModeSecondaryColor,
                size: MenuState.home == selectedMenu ? 25 : 20,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, HomeScreen.routeName),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: MenuState.search == selectedMenu
                    ? darkModePrimaryColor
                    : darkModeSecondaryColor,
                size: MenuState.home == selectedMenu ? 25 : 20,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, SearchScreen.routeName),
            ),
          ],
        ));
  }
}
