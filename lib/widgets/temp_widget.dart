import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

class Temp extends StatelessWidget {
  const Temp({
    Key? key,
    required this.temp,
    required this.size,
  }) : super(key: key);
  final String temp;
  final String size;
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.end,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temp,
          // style: theme().textTheme.headline1?.copyWith(
          //       color: darkModePrimaryColor,
          //       fontSize:
          //           getProportionateScreenWidth(100),
          //       fontWeight: FontWeight.bold,
          //     ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: defaultPadding * 0.5),
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
    );
  }
}
