import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/widgets/change_theme_button_widget.dart';
import 'package:weather/widgets/daily_weather_display.dart';
import 'package:weather/widgets/hourly_weather_display.dart';
import 'package:intl/intl.dart';
import '../../../widgets/location_card.dart';
import '../home_screen.dart';

late LocationCard locationCard;
late String todaysDate;
late String city;
late String country;
late String weatherIcon;
late String weatherSummary;
late double tempC;
late double tempK;
late double tempF;
late List<dynamic> hourly;
late List<dynamic> daily;

void updateUI(dynamic weatherData) {
  var timestamp = weatherData['current']['dt'];
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var dateFormat = DateFormat('dd-MMM-yyyy').format(date).split('-');
  todaysDate = '${dateFormat[0]}, ${dateFormat[1]}, ${dateFormat[2]}';

  var timezone = weatherData['timezone'].toString().split('/');
  city = timezone[1];
  country = timezone[0];
  weatherIcon = weatherData['weather']['icon'];
  weatherSummary = weatherData['weather']['main'];

  tempK = weatherData['current']['temp'];
  tempC = tempK - 273.15;
  tempF = (tempC * 1.8) + 32;

  hourly = weatherData['hourly'];
  daily = weatherData['daily'];
}

void updateLocationCard(dynamic weatherData) {
  locationCard.summary = weatherData['weather']['main'];
  locationCard.location = city;
  locationCard.temp = tempC.toString();
  var dateFormat = DateFormat('dd-MMM-yyyy HH-mm-ss')
      .format(DateTime.fromMillisecondsSinceEpoch(
          weatherData['current']['dt'] * 1000))
      .split(' ')[1]
      .split('-');
  locationCard.time = '${dateFormat[0]}:${dateFormat[1]}';
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);
  //dynamic weatherData;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    updateUI(weatherData);
    updateLocationCard(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              //"15, Jan 2022",
              todaysDate,
              //style: themeProvider.themeMode.textTheme.bodyText1?.copyWith(fontSize: 15),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  //color: themeData.iconTheme.color,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  city,
                  //style: themeData.primaryTextTheme.bodyText2
                  //?.copyWith(fontSize: 16),
                ),
                Text(
                  ", $country",
                  //style:
                  //themeData.textTheme.bodyText1?.copyWith(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(defaultPadding * 1.5),
            //   child: HomePageAppBar(),
            // ),
            Column(
              children: [
                //const SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      height: 300,
                      width: 500,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/worldmap-transparent.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 40),
                        Image.asset(
                          "assets/images/thunder.png",
                          scale: 1.6,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          //"Thunder",
                          weatherSummary,
                          //style: theme().primaryTextTheme.bodyText2!.copyWith(
                          //    fontSize: 20,
                          //),
                          //style: MyThemes.getCurrentTheme().primaryTextTheme.bodyText2
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tempC.toString(),
                              // style: theme().textTheme.headline1?.copyWith(
                              //       color: darkModePrimaryColor,
                              //       fontSize:
                              //           getProportionateScreenWidth(100),
                              //       fontWeight: FontWeight.bold,
                              //     ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.only(top: defaultPadding * 0.5),
                              child: Text(
                                "o",
                                // style: theme().textTheme.subtitle1?.copyWith(
                                //       color: Colors.yellow,
                                //       fontSize:
                                //           getProportionateScreenWidth(40),
                                //       fontWeight: FontWeight.bold,
                                //     ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  //color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.access_time),
                          SizedBox(width: 5),
                          Text(
                            "HOURLY FORECAST",
                            // style: theme().textTheme.headline1?.copyWith(
                            //       color: darkModePrimaryColor,
                            //       fontSize: getProportionateScreenWidth(15),
                            //       //fontWeight: FontWeight.bold,
                            //     ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              hourly.length,
                              (index) => HourlyWeatherDisplay(
                                icon: hourly[index]['weather']['icon'],
                                time: DateFormat("h:mma").format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    hourly[index]['dt'] * 1000,
                                  ),
                                ),
                                tempC: hourly[index]['temp'] - 273.15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  //color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(FontAwesomeIcons.calendarDays),
                          SizedBox(width: 5),
                          Text(
                            "7 DAYS FORECAST",
                            // style: theme().textTheme.headline1?.copyWith(
                            //       color: darkModePrimaryColor,
                            //       fontSize: getProportionateScreenWidth(15),
                            //       //fontWeight: FontWeight.bold,
                            // ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ...List.generate(
                              10,
                              (index) => DailyWeatherDisplay(
                                icon: daily[index]['weather']['icon'],
                                day: DateFormat(DateFormat.ABBR_WEEKDAY).format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    daily[index]['dt'] * 1000,
                                  ),
                                ),
                                tempC: daily[index]['temp'] - 273.15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
