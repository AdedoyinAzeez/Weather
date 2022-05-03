import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/utilities/size_config.dart';

List<LocationCard> cities = [];

// ignore: must_be_immutable
class LocationCard extends StatelessWidget {
  LocationCard({
    Key? key,
    required this.location,
    required this.time,
    required this.summary,
    required this.temp,
    required this.high,
    required this.low,
  }) : super(key: key);
  String location;
  String time;
  String summary;
  String temp;
  String high;
  String low;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.9,
      height: SizeConfig.screenHeight * 0.15,
      padding: const EdgeInsets.all(defaultPadding * 1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff1F1F21),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(location),
                  SizedBox(height: SizeConfig.screenHeight * 0.005),
                  Text(time),
                ],
              ),
              SizedBox(width: SizeConfig.screenWidth * 0.5),
              Text(
                "$temp°",
                style: TextStyle(
                    fontSize: SizeConfig.screenHeight * 0.04,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //SizedBox(height: SizeConfig.screenHeight * 0.06),
              Text(
                summary,
                //style: theme().primaryTextTheme.bodyText2!.copyWith(
                //    fontSize: 20,
                //),
                //style: MyThemes.getCurrentTheme().primaryTextTheme.bodyText2
              ),
              Text("H:$high° L:$low°"),
            ],
          ),
        ],
      ),
    );
  }
}
