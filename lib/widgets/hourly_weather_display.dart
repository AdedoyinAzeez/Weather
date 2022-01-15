import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/utilities/size_config.dart';
import 'package:weather/utilities/theme.dart';

class HourlyWeatherDisplay extends StatelessWidget {
  const HourlyWeatherDisplay({
    Key? key,
    required this.image,
    required this.time,
    required this.tempC,
  }) : super(key: key);
  final String image;
  final String time;
  final String tempC;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Image.asset(
            image,
            scale: 6,
          ),
          const SizedBox(height: 10),
          Text(
            time,
            style: theme().textTheme.bodyText1?.copyWith(
                  color: darkModeSecondaryColor,
                  fontSize: getProportionateScreenWidth(15),
                ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tempC,
                style: theme().textTheme.headline1?.copyWith(
                      color: darkModePrimaryColor,
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: defaultPadding * 0.5),
                child: Text(
                  "o",
                  style: theme().textTheme.subtitle1?.copyWith(
                        color: darkModePrimaryColor,
                        fontSize: getProportionateScreenWidth(10),
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

List<HourlyWeatherDisplay> hourly = [
  const HourlyWeatherDisplay(
      image: "assets/images/thunder.png", time: "01:00 pm", tempC: "11"),
  const HourlyWeatherDisplay(
      image: "assets/images/thunder.png", time: "04:00 pm", tempC: "10"),
  const HourlyWeatherDisplay(
      image: "assets/images/thunder.png", time: "07:00 pm", tempC: "8"),
  const HourlyWeatherDisplay(
      image: "assets/images/thunder.png", time: "01:00 pm", tempC: "11"),
  const HourlyWeatherDisplay(
      image: "assets/images/thunder.png", time: "04:00 pm", tempC: "10"),
  const HourlyWeatherDisplay(
      image: "assets/images/thunder.png", time: "07:00 pm", tempC: "8"),
];
