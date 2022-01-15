import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/utilities/size_config.dart';
import 'components/body.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _selectedIndex = 1;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,

      backgroundColor: Colors.black, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(15.0),
        //colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: false,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12,
      // Choose the nav bar style with this property.
    );
    //return const Scaffold(
    //appBar: AppBar(),
    //body: Body(),

    // bottomNavigationBar: BottomNavigationBar(
    //   backgroundColor: kBlack,
    //   items: const [
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.location_pin,
    //         color: darkModeSecondaryColor,
    //       ),
    //       label: "",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.home_sharp,
    //         color: darkModeSecondaryColor,
    //       ),
    //       label: "",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(
    //         Icons.search_outlined,
    //         color: darkModeSecondaryColor,
    //       ),
    //       label: "",
    //     ),
    //   ],
    //   currentIndex: _selectedIndex,
    //   selectedItemColor: darkModePrimaryColor,
    //   onTap: _onItemTapped,
    // ),
    //bottomNavigationBar: BottomAppBar(),
    //);
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.location_pin),
      //title: ("Home"),
      activeColorPrimary: darkModePrimaryColor,
      inactiveColorPrimary: darkModeSecondaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home_sharp),
      //title: ("Home"),
      activeColorPrimary: darkModePrimaryColor,
      inactiveColorPrimary: darkModeSecondaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search_outlined),
      //title: ("Home"),
      activeColorPrimary: darkModePrimaryColor,
      inactiveColorPrimary: darkModeSecondaryColor,
    ),
  ];
}

List<Widget> _buildScreens() {
  return [
    const Body(),
    const Body(),
    const Body(),
  ];
}
