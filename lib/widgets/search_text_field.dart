import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/utilities/size_config.dart';
import 'package:weather/widgets/staging_location_card.dart';

List<String> searchResults = ['Lagos', 'Abuja', 'Sagamu', 'Ibadan', 'Akure'];

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var focused = false;
    //final themeProvider = Provider.of<ThemeProvider>(context);
    var fieldText = TextEditingController();
    //var searchRequestBody = fieldText.text;

    void clearText() {
      fieldText.clear();
    }

    return Container(
      width: SizeConfig.screenWidth * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff1F1F21),
      ),
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.search),
          const SizedBox(width: 10),
          Center(
            child: SizedBox(
              width: SizeConfig.screenWidth * 0.7,
              child: TextField(
                onTap: () => showSearch(
                    context: context, delegate: CitySearchDelegate()),
                autocorrect: true,
                maxLines: 1,
                //autofocus: focused,
                decoration: const InputDecoration(
                  hintText: "Search for a city",
                  border: InputBorder.none,
                  //focusedBorder: InputBorder.none,
                ),
                controller: fieldText,
              ),
            ),
          ),
          const SizedBox(width: 10),
          if (!focused)
            GestureDetector(
              onTap: () => clearText(),
              child: const Icon(
                Icons.cancel,
                size: 15,
              ),
            ),
        ],
      ),
    );
  }
}

class CitySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(
            Icons.cancel,
            size: 15,
          ),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResults) {
      final result = searchResults.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //close(context, const StagingLocationCard());
    return const StagingLocationCard();
  }
}
