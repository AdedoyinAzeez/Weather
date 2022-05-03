import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather/screens/home/home_screen.dart';
import 'package:weather/widgets/location_card.dart';
import 'package:weather/widgets/search_text_field.dart';
import '../../../services/networking.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';
import '../../../widgets/staging_location_card.dart';
import '../../home/components/home_body.dart';

// const apiKey = '06e4ba7c8e368b632bd78a

dynamic stagingWeatherData;
dynamic stagingLocationWeatherData;
late String stagingTodaysDate;
late String stagingTime;
late String stagingCity;
late String stagingCountry;
late String stagingWeatherIcon;
late String stagingWeatherSummary;
late double stagingtempC;
late double stagingtempCMax;
late double stagingtempCMin;
late double stagingtempK;
late double stagingtempF;
late List<dynamic> stagingHourly;
late List<dynamic> stagingDaily;
late double stagingLatitude;
late double stagingLongitude;
late LocationCard stagingLocationCard;

class SearchBody extends StatefulWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  void initState() {
    super.initState();
    getStagingLocationData();
    updateStagingUI(stagingWeatherData, stagingLocationWeatherData);
    updateStagingLocationCard(stagingWeatherData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //top: false,
      child: SingleChildScrollView(
        child: Expanded(
          child: Container(
            //height: SizeConfig.screenHeight * 0.7,
            color: Colors.blue,
            child: Center(
              //heightFactor: 1.0,
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  const SearchTextField(),
                  const SizedBox(height: 20),
                  LocationCard(
                    location: stagingCity,
                    time: stagingTime,
                    temp: stagingtempC.toString(),
                    summary: stagingWeatherSummary,
                    high: stagingtempCMax.toString(),
                    low: stagingtempCMin.toString(),
                  ),
                  buildCities(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCities(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.screenHeight * 0.01),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cities.length,
        itemBuilder: (context, index) {
          index = index;
          return Dismissible(
            key: Key(cities[index].location.toString()),
            onDismissed: (direction) {
              setState(() {
                cities.removeAt(index);
                if (true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.blue,
                      content: Text('Location weather dismissed!'),
                    ),
                  );
                }
              });
            },
            direction: DismissDirection.endToStart,
            background: Container(
              width: SizeConfig.screenWidth * 0.9,
              height: SizeConfig.screenHeight * 0.15,
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg",
                      color: Colors.white),
                ],
              ),
            ),
            child: Hero(
              tag: stagingLocationCard.location,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LocationCard(
                    location: cities[index].location,
                    time: cities[index].time,
                    temp: cities[index].temp,
                    summary: cities[index].summary,
                    high: cities[index].high,
                    low: cities[index].low,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const StagingLocationCard(),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

void getStagingLocationData() async {
  NetworkHelper locationNetworkHelper = NetworkHelper(
      'api.openweathermap.org/data/2.5/weather?q=${stagingLocationCard.location}&appid=$apiKey');
  stagingLocationWeatherData = await locationNetworkHelper.getData();
  stagingLatitude = stagingLocationWeatherData['coord']['lat'];
  stagingLongitude = stagingLocationWeatherData['coord']['lon'];

  if (stagingLatitude > 0 || stagingLongitude > 0) {
    NetworkHelper networkHelper = NetworkHelper(
        'api.openweathermap.org/data/2.5/onecall?lat={$stagingLatitude}&lon={$stagingLongitude}&appid={$apiKey}');
    stagingWeatherData = await networkHelper.getData();
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return buildStagingLocationCard(context, stagingLocationCard);
    // }));
  }
}

void updateStagingUI(
    dynamic stagingWeatherData, dynamic stagingLocationWeatherData) {
  var timestamp = stagingWeatherData['current']['dt'];
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var dateFormat =
      DateFormat('dd-MMM-yyyy HH:mm:ss').format(date).split(' ')[0];
  todaysDate = '${dateFormat[0]}, ${dateFormat[1]}, ${dateFormat[2]}';
  var timeFormat =
      DateFormat('dd-MMM-yyyy HH:mm:ss').format(date).split(' ')[1];
  stagingTime = '${timeFormat[0]}:${timeFormat[1]}';
  var timezone = stagingWeatherData['timezone'].toString().split('/');
  stagingCity = timezone[1];
  stagingCountry = timezone[0];
  stagingWeatherIcon = stagingWeatherData['weather']['icon'];
  stagingWeatherSummary = stagingWeatherData['weather']['main'];

  stagingtempK = stagingWeatherData['current']['temp'];
  stagingtempC = stagingtempK - 273.15;

  stagingtempF = (stagingtempC * 1.8) + 32;

  stagingHourly = stagingWeatherData['hourly'];
  stagingDaily = stagingWeatherData['daily'];

  stagingLatitude = stagingLocationWeatherData['coord']['lat'];
  stagingLongitude = stagingLocationWeatherData['coord']['lon'];
  stagingtempCMax = stagingLocationWeatherData['main']['temp_max'];
  stagingtempCMin = stagingLocationWeatherData['main']['temp_min'];
}

void updateStagingLocationCard(dynamic stagingWeatherData) {
  stagingLocationCard.summary = stagingWeatherSummary;
  stagingLocationCard.location = stagingCity;
  stagingLocationCard.temp = stagingtempC.toString();
  var dateFormat = DateFormat('dd-MMM-yyyy HH-mm-ss')
      .format(DateTime.fromMillisecondsSinceEpoch(
          stagingWeatherData['current']['dt'] * 1000))
      .split(' ')[1]
      .split('-');
  stagingLocationCard.time = '${dateFormat[0]}:${dateFormat[1]}';
  stagingLocationCard.high = stagingtempCMax.toString();
  stagingLocationCard.low = stagingtempCMin.toString();
}
