import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../search_tabs/search_tab_screen.dart';

class CustomSearchDelegate extends SearchDelegate {
  // Example data
  final List<String> searchTerms = [
    'Apple',
    'Banana',
    'Pear',
    'Watermelon',
    'Orange',
    'Strawberry',
    'Blueberry',
    'Raspberry',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for the app bar, like a clear button
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.white,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0XFF171717),
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
       focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 2.0,
            ),
          ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        //   borderSide: const BorderSide(
        //     color: Colors.white,
        //     width: 2.0,
        //   ),
        // ),
        constraints: BoxConstraints(maxHeight: 40.px,minHeight: 40.px,minWidth: 307.px)
        
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the app bar
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show some custom results based on the search query
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 80, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              'Try searching events, clubs, users, artists or keywords',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    } else {
      return SearchesTabs();
      // List<String> matchQuery = [];
      // for (var fruit in searchTerms) {
      //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
      //     matchQuery.add(fruit);
      //   }
      // }
      // return ListView.builder(
      //   itemCount: matchQuery.length,
      //   itemBuilder: (context, index) {
      //     var suggestion = matchQuery[index];
      //     return ListTile(
      //       title: Text(suggestion),
      //       onTap: () {
      //         query = suggestion;
      //         showResults(context);
      //       },
      //     );
      //   },
      // );
    }
  }
}
