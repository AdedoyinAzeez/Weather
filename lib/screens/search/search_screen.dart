import 'package:flutter/material.dart';
import 'components/search_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const routeName = "/search";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: darkModeAccentColor,
        title: const Text(
          "Search for city",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: const SearchBody(),
      // bottomNavigationBar:
      //     const CustomBottomNavBar(selectedMenu: MenuState.search),
    );
  }
}
