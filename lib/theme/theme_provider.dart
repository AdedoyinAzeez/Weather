import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  // bool get isDarkMode {
  //   if (themeMode == ThemeMode.system) {
  //     final brightness = SchedulerBinding.instance.window.platformBrightness;
  //     return brightness == Brightness.dark;
  //   } else {
  //     return themeMode == ThemeMode.dark;
  //   }
  // }
  //get themeMode => _themeMode;

  // void toggleTheme(bool isDark) {
  //   _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  //   notifyListeners();
  // }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

// ThemeData theme() {
//   return ThemeData(
//     appBarTheme: MyThemes.getCurrentTheme.appBarTheme,
//     scaffoldBackgroundColor: MyThemes.getCurrentTheme.scaffoldBackgroundColor,
//     primaryColor: MyThemes.getCurrentTheme.primaryColor,
//     primaryIconTheme: MyThemes.getCurrentTheme.primaryIconTheme,
//     iconTheme: MyThemes.getCurrentTheme.iconTheme,
//     colorScheme: MyThemes.getCurrentTheme.colorScheme,
//     fontFamily: 'DM Sans',
//     textTheme: MyThemes.getCurrentTheme.textTheme,
//     primaryTextTheme: MyThemes.getCurrentTheme.primaryTextTheme,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//   );
//   //home: SplashScreen(),
// }

