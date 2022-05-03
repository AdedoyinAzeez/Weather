import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/theme/theme_constants.dart';
import 'package:weather/theme/theme_provider.dart';
import 'screens/home/home_screen.dart';
import 'utilities/routes.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Weather',
          themeMode: themeProvider.themeMode,
          theme: ThemeConstants.lightTheme,
          darkTheme: ThemeConstants.darkTheme,
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.routeName,
          routes: routes,
        );
      },
    );
  }
}
