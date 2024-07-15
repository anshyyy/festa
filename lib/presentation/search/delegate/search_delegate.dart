import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../application/home/cubit/home_cubit.dart';
import '../search_tabs/search_tab_screen.dart';

class CustomSearchDelegate extends SearchDelegate {
  final HomeCubit homeCubit;

  CustomSearchDelegate({required this.homeCubit});
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.white,
        ),
        onPressed: () {
          query = '';
          homeCubit.clearSearch();
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
          constraints: BoxConstraints(
              maxHeight: 40.px, minHeight: 40.px, minWidth: 307.px)),
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
        homeCubit.clearSearch();
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    homeCubit.onSearch(query.trim());
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      builder: (context, state) {
        if (state.searchLoading!) {
          return const Center(child: CircularProgressIndicator());
        } else if (!state.searchLoading! &&
            state.searchResults!.pubs.isEmpty &&
            state.searchResults!.events.isEmpty &&
            state.searchResults!.artists.isEmpty &&
            state.searchResults!.users.isEmpty) {
          return const Center(
              child: Text(
            'No results found',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          ));
        } else {
          return SearchesTabs(
            clubs: state.searchResults!.pubs,
            events: state.searchResults!.events,
            users: state.searchResults!.users,
            artists: state.searchResults!.artists,
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // print(query);
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
      _debouncer.run(
        () {
          homeCubit.onSearch(query.trim());
        },
      );
      return BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        builder: (context, state) {
          if (state.searchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (!(state.searchLoading) &&
              (state.searchResults?.pubs.isEmpty ?? true) &&
              (state.searchResults?.events.isEmpty ?? true) &&
              (state.searchResults?.artists.isEmpty ?? true) &&
              (state.searchResults?.users.isEmpty ?? true)) {
            return const Center(
              child: Text(
                'No results found',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            );
          } else {
            return SearchesTabs(
              clubs: state.searchResults?.pubs ?? [],
              events: state.searchResults?.events ?? [],
              users: state.searchResults?.users ?? [],
              artists: state.searchResults?.artists ?? [],
            );
          }
        },
      );
    }
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;
  Debouncer({required this.milliseconds});
  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
