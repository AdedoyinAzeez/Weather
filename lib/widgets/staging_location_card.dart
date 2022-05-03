import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather/widgets/location_card.dart';
import '../screens/home/components/home_body.dart';
import '../screens/home/home_screen.dart';
import '../screens/search/components/search_body.dart';
import '../services/networking.dart';
import '../utilities/constants.dart';
import 'daily_weather_display.dart';
import 'hourly_weather_display.dart';

class StagingLocationCard extends StatefulWidget {
  const StagingLocationCard({Key? key}) : super(key: key);

  @override
  _StagingLocationCardState createState() => _StagingLocationCardState();
}

class _StagingLocationCardState extends State<StagingLocationCard> {
  @override
  void initState() {
    super.initState();
    getLocationData();
    updateStagingUI(stagingWeatherData, stagingLocationWeatherData);
  }

  void getLocationData() async {
    NetworkHelper locationNetworkHelper = NetworkHelper(
        'api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey');
    stagingLocationWeatherData = await locationNetworkHelper.getData();
    stagingLatitude = stagingLocationWeatherData['coord']['lat'];
    stagingLongitude = stagingLocationWeatherData['coord']['lon'];

    if (stagingLatitude > 0 || stagingLongitude > 0) {
      NetworkHelper networkHelper = NetworkHelper(
          'api.openweathermap.org/data/2.5/onecall?lat={$stagingLatitude}&lon={$stagingLongitude}&appid={$apiKey}');
      stagingWeatherData = await networkHelper.getData();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return buildStagingLocationCard(context, stagingLocationCard);
      }));
    }
  }

  // void updateUI(
  //     dynamic stagingWeatherData, dynamic stagingLocationWeatherData) {
  //   var timestamp = stagingWeatherData['current']['dt'];
  //   var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  //   var dateFormat = DateFormat('dd-MMM-yyyy').format(date).split('-');
  //   stagingTodaysDate = '${dateFormat[0]}, ${dateFormat[1]}, ${dateFormat[2]}';

  //   var timezone = stagingWeatherData['timezone'].toString().split('/');
  //   stagingCity = timezone[1];
  //   stagingCountry = timezone[0];
  //   stagingWeatherIcon = stagingWeatherData['weather']['icon'];
  //   stagingWeatherSummary = stagingWeatherData['weather']['main'];

  //   stagingtempK = stagingWeatherData['current']['temp'];
  //   stagingtempC = stagingtempK - 273.15;
  //   stagingtempF = (stagingtempC * 1.8) + 32;

  //   stagingHourly = stagingWeatherData['hourly'];
  //   stagingDaily = stagingWeatherData['daily'];

  //   stagingLatitude = stagingLocationWeatherData['coord']['lat'];
  //   stagingLongitude = stagingLocationWeatherData['coord']['lon'];
  //   stagingtempCMax = stagingWeatherData['main']['temp_max'];
  //   stagingtempCMin = stagingWeatherData['main']['temp_min'];
  // }

  @override
  Widget build(BuildContext context) {
    return buildStagingLocationCard(context, stagingLocationCard);
  }

  Widget buildStagingLocationCard(
      BuildContext context, LocationCard locationCard) {
    return Hero(
      tag: locationCard.location,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          cities.add(locationCard);
                          Navigator.pop(context);
                        });
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
                          //scale: 5,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          stagingWeatherSummary,
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
                              stagingHourly.length,
                              (index) => HourlyWeatherDisplay(
                                icon: stagingHourly[index]['weather']['icon'],
                                time: DateFormat("h:mma").format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    stagingHourly[index]['dt'] * 1000,
                                  ),
                                ),
                                tempC: stagingHourly[index]['temp'] - 273.15,
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
                              stagingDaily.length,
                              (index) => DailyWeatherDisplay(
                                icon: stagingDaily[index]['weather']['icon'],
                                day: DateFormat(DateFormat.ABBR_WEEKDAY).format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    stagingDaily[index]['dt'] * 1000,
                                  ),
                                ),
                                tempC: stagingDaily[index]['temp'] - 273.15,
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
