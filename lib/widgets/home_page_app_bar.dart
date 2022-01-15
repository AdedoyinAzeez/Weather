import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/utilities/theme.dart';

class HomePageAppBar extends StatefulWidget {
  const HomePageAppBar({Key? key}) : super(key: key);
  //final List<bool> _selections = List.generate(2, (_) => false);
  @override
  State<HomePageAppBar> createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  @override
  Widget build(BuildContext context) {
    List<bool> _selections = [false, true];
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "15, Jan 2022",
                style: theme().textTheme.bodyText1?.copyWith(
                      color: darkModeSecondaryColor,
                      fontSize: 15,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    color: darkModeAccentColor,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "LAGOS",
                    style: theme().textTheme.bodyText1?.copyWith(
                        color: darkModePrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  ),
                  Text(
                    ", Nigeria",
                    style: theme().textTheme.bodyText1?.copyWith(
                          color: darkModeSecondaryColor,
                          fontSize: 15,
                        ),
                    // style: theme().textTheme.bodyText1?.copyWith(
                    //       color: darkModeTextColor.withOpacity(0.8),
                    //     ),
                  ),
                ],
              )
            ],
          ),
          Container(
            //margin: const EdgeInsets.all(defaultPadding * 0.5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              border: Border.all(
                color: darkModeSecondaryColor,
                //style: BorderStyle.solid,
              ),
            ),
            child: ToggleButtons(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    //color: _selections[0] == true ? Colors.red : Colors.black,
                  ),
                  child: const Icon(
                    Icons.wb_sunny,
                    size: 20,
                  ),
                ),
                //const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    //color: _selections[1] == true ? Colors.red : Colors.black,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.moon,
                    size: 20,
                  ),
                ),
              ],
              isSelected: _selections,
              onPressed: (int index) {
                setState(() {
                  _selections[index] = !_selections[index];
                });
              },
              color: darkModeSecondaryColor,
              //fillColor: Colors.yellow,
              selectedColor: darkModeSecondaryColor,
              renderBorder: false,
              direction: Axis.horizontal,
              // borderRadius: BorderRadius.circular(30),
              // borderWidth: 5,
              // borderColor: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
