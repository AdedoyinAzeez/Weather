import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/utilities/size_config.dart';
import 'package:weather/utilities/theme.dart';
import 'package:weather/widgets/home_page_app_bar.dart';
import 'package:weather/widgets/hourly_weather_display.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
        color: Colors.black,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(defaultPadding * 1.5),
              child: HomePageAppBar(),
            ),
            const SizedBox(height: 30),
            Stack(
              children: [
                Container(
                  height: 300,
                  width: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/worldmap-darkmode.jpg"),
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
                      "Thunder",
                      style: theme().textTheme.headline1?.copyWith(
                            color: darkModePrimaryColor,
                            fontSize: getProportionateScreenWidth(20),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "13",
                          style: theme().textTheme.headline1?.copyWith(
                                color: darkModePrimaryColor,
                                fontSize: getProportionateScreenWidth(100),
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: defaultPadding * 0.5),
                          child: Text(
                            "o",
                            style: theme().textTheme.subtitle1?.copyWith(
                                  color: Colors.yellow,
                                  fontSize: getProportionateScreenWidth(40),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      ...List.generate(
                        hourly.length,
                        (index) => HourlyWeatherDisplay(
                          image: hourly[index].image,
                          time: hourly[index].time,
                          tempC: hourly[index].tempC,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
