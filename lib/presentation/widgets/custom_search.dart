import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/core/constants/asset_constants.dart';

class CustomSearch extends SearchDelegate {
  List<String> allData = ['Banglore', 'Mumbai'];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.brightness == Brightness.dark ? Colors.grey[900] : colorScheme.primaryContainer,
        titleTextStyle: theme.textTheme.bodyMedium,
        toolbarTextStyle: theme.textTheme.bodyMedium,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [SvgPicture.asset(AssetConstants.closeIcon)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return SvgPicture.asset(AssetConstants.searchIcon);
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matches = allData
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        String current = matches[index];
        return ListTile(
          title: Text(current),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matches = allData
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        String current = matches[index];
        return ListTile(
          title: Text(current, style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.white,
          ),),
        );
      },
    );
  }
}
