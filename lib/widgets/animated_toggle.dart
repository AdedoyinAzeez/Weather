import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

class AnimatedToggle extends StatefulWidget {
  const AnimatedToggle(
      {Key? key, required this.icons, required this.onToggleCallback})
      : super(key: key);

  final List<IconData> icons;
  final ValueChanged onToggleCallback;

  @override
  State<AnimatedToggle> createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              var index = 0;
              if (!initialPosition) {
                index = 1;
              }
              widget.onToggleCallback(index);
              setState(() {});
            },
            child: Container(
              //margin: const EdgeInsets.all(defaultPadding * 0.5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(
                  color: darkModeSecondaryColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.icons.length,
                  (index) => Container(
                    padding: const EdgeInsets.all(defaultPadding * 0.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:
                          initialPosition ? Colors.yellow : Colors.transparent,
                    ),
                    child: Icon(
                      widget.icons[index],
                      size: 20,
                    ),
                  ),
                ),

                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //     color:
                //         initialPosition ? Colors.yellow : Colors.transparent,
                //   ),
                //   child: const Icon(
                //     Icons.wb_sunny,
                //     size: 20,
                //   ),
                // ),
                // Container(
                //   padding: const EdgeInsets.all(defaultPadding * 0.5),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //     color:
                //         initialPosition ? Colors.yellow : Colors.transparent,
                //   ),
                //   child: const Icon(
                //     FontAwesomeIcons.moon,
                //     size: 20,
                //   ),
                // ),
              ),
            ),
          ),
          AnimatedAlign(
            curve: Curves.decelerate,
            duration: const Duration(milliseconds: 250),
            alignment:
                initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: initialPosition ? Colors.yellow : Colors.transparent,
              ),
              child: Icon(
                initialPosition ? widget.icons[0] : widget.icons[1],
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
