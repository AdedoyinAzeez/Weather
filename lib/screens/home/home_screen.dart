import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/screens/home/components/home_body.dart';
import 'package:weather/screens/search/search_screen.dart';
import 'package:weather/theme/theme_provider.dart';
import 'package:weather/utilities/size_config.dart';
import '../../services/location.dart';
import '../../services/networking.dart';

const apiKey = '06e6d9b9d4ba7c8e368b632bd78afa29';
dynamic weatherData;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double latitude;
  late double longitude;
  late IconData icon;
  int currentIndex = 1;
  //weatherData = widget.weatherData;
  // final screens = [
  //   const HomeBody(),
  //   const HomeBody(),
  //   const SearchScreen(),
  // ];
  //static List<City> cities = List<City>();
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // ignore: prefer_typing_uninitialized_variables
    Location location = Location();
    await location.getCurrentLocation();
    setState(() {
      latitude = location.latitude;
      longitude = location.longitude;
    });

    if (latitude > 0 || longitude > 0) {
      NetworkHelper networkHelper = NetworkHelper(
          'api.openweathermap.org/data/2.5/onecall?lat={$latitude}&lon={$longitude}&appid={$apiKey}');

      var data = await networkHelper.getData();
      setState(() {
        weatherData = data;
      });
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return IndexedStack(
      //     index: currentIndex,
      //     children: const [
      //       HomeBody(),
      //       HomeBody(),
      //       SearchScreen(),
      //     ],
      //   );
      // }));
    }
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    //_themeManager.removeListener(themeListener);
    super.dispose();
  }

  // @override
  // void initState() {
  //   //_themeManager.addListener(themeListener);
  //   super.initState();
  // }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //bool status = false;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      //body: const HomeBody(),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeBody(),
          HomeBody(),
          SearchScreen(),
        ],
      ),
      //body: const Body(),
      // bottomNavigationBar: NavigationBarTheme(
      //   data: NavigationBarThemeData(
      //     indicatorColor: Colors.grey,
      //   ),
      //   child: NavigationBar(
      //     destinations: const [
      //       NavigationDestination(
      //         icon: Icon(Icons.search),
      //         label: "Search",
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.search),
      //         label: "Search",
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.search),
      //         label: "Search",
      //       )
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            label: "Location",
            icon: const Icon(Icons.location_pin),
            backgroundColor:
                themeProvider.isDarkMode ? Colors.black : Colors.white,
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: const Icon(Icons.home),
            backgroundColor:
                themeProvider.isDarkMode ? Colors.black : Colors.white,
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: const Icon(Icons.search),
            backgroundColor:
                themeProvider.isDarkMode ? Colors.black : Colors.white,
          ),
        ],
      ),
      //const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
