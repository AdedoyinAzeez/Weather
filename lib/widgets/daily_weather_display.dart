import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

class DailyWeatherDisplay extends StatelessWidget {
  const DailyWeatherDisplay({
    Key? key,
    required this.day,
    required this.icon,
    required this.tempC,
  }) : super(key: key);

  final String day;
  final String icon;
  final String tempC;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Divider(color: darkModeSecondaryColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: Cross,
            children: [
              Text(
                day,
                // style: theme().textTheme.headline1?.copyWith(
                //       color: darkModePrimaryColor,
                //       fontSize: getProportionateScreenWidth(20),
                //       //fontWeight: FontWeight.bold,
                //     ),
              ),
              Image.asset(
                icon,
                scale: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tempC,
                    // style: theme().textTheme.headline1?.copyWith(
                    //       color: darkModePrimaryColor,
                    //       fontSize: getProportionateScreenWidth(20),
                    //       fontWeight: FontWeight.bold,
                    //     ),
                  ),
                  const Text(
                    "o",
                    // style: theme().textTheme.subtitle1?.copyWith(
                    //       color: darkModePrimaryColor,
                    //       fontSize: getProportionateScreenWidth(10),
                    //       fontWeight: FontWeight.bold,
                    //     ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// List<DailyWeatherDisplay> daily = [
//   const DailyWeatherDisplay(
//       icon: "assets/images/thunder.png", day: "Today", tempC: "11"),
//   const DailyWeatherDisplay(
//       icon: "assets/images/thunder.png", day: "Thu", tempC: "10"),
//   const DailyWeatherDisplay(
//       icon: "assets/images/thunder.png", day: "Fri", tempC: "18"),
//   const DailyWeatherDisplay(
//       icon: "assets/images/thunder.png", day: "Sat", tempC: "11"),
//   const DailyWeatherDisplay(
//       icon: "assets/images/thunder.png", day: "Sun", tempC: "10"),
//   const DailyWeatherDisplay(
//       icon: "assets/images/thunder.png", day: "Mon", tempC: "18"),
//   const DailyWeatherDisplay(
//       icon: "assets/images/thunder.png", day: "Tue", tempC: "11"),
//   const DailyWeatherDisplay(
//       icon: "assets/images/thunder.png", day: "Wed", tempC: "10"),
//   const DailyWeatherDisplay(
//       icon: "assets/images/thunder.png", day: "Thu", tempC: "18"),
//   const DailyWeatherDisplay(
//       icon: "assets/images/thunder.png", day: "Today", tempC: "11"),
//   const DailyWeatherDisplay(
//       icon: "assets/images/thunder.png", day: "Thu", tempC: "10"),
// ];
