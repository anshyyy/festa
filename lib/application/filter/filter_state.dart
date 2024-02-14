part of 'filter_cubit.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    required List<Map<String, dynamic>> filtersList,
    required String currentFilter,
    required List<Map<String, dynamic>> filterOptions,
  }) = _FilterState;

  factory FilterState.initial() => const FilterState(
      filtersList: [
        {
          "displayName": "Sort",
          "name": "sort",
          "values": [
            {"name": "featured", "displayName": "Featured"},
            {"name": "distance", "displayName": "Distance", "value": "ASC"},
            {
              "name": "price_range_start",
              "displayName": "Cost:Low to High",
              "value": "ASC"
            },
            {
              "name": "price_range_start",
              "displayName": "Cost:High to Low",
              "value": "DESC"
            },
            {"name": "rating", "displayName": "Rating", "value": "DESC"}
          ]
        },
        {
          "displayName": "Location",
          "name": "range",
          "values": [
            {"name": "range", "displayName": "Within 1km", "value": 1000},
            {"name": "range", "displayName": "< 3km", "value": 3000},
            {"name": "range", "displayName": "< 5km", "value": 5000},
            {"name": "range", "displayName": "Anywhere", "value": 20000}
          ]
        },
        {
          "displayName": "Dancefloor",
          "name": "events.dance_floor",
          "values": [
            {
              "name": "events.dance_floor",
              "displayName": "Yes",
              "rule": "eq",
              "value": true
            },
            {
              "name": "events.dance_floor",
              "displayName": "No",
              "rule": "eq",
              "value": false
            },
            {"name": "events.dance_floor", "displayName": "Doesn't matter"}
          ]
        },
        {
          "displayName": "Capacity",
          "name": "events.capacity",
          "values": [
            {
              "name": "events.capacity",
              "displayName": "50",
              "rule": "lte",
              "value": 50
            },
            {
              "name": "events.capacity",
              "displayName": "100",
              "rule": "lte",
              "value": 100
            },
            {
              "name": "events.capacity",
              "displayName": "200",
              "rule": "lte",
              "value": 200
            },
            {
              "name": "events.capacity",
              "displayName": "500",
              "rule": "lte",
              "value": 500
            },
            {
              "name": "events.capacity",
              "displayName": "1000",
              "rule": "lte",
              "value": 1000
            },
            {"name": "events.capacity", "displayName": ">1000"}
          ]
        },
        {
          "displayName": "Genre/Music",
          "name": "music",
          "values": [
            {
              "displayName": "Themed Parties",
              "name": "event_category.id",
              "rule": "eq",
              "value": 1
            },
            {
              "displayName": "EDM",
              "name": "event_category.id",
              "rule": "eq",
              "value": 2
            },
            {
              "displayName": "Rave Party",
              "name": "event_category.id",
              "rule": "eq",
              "value": 3
            },
            {
              "displayName": "Live Music ",
              "name": "event_category.id",
              "rule": "eq",
              "value": 5
            },
            {
              "displayName": "Rock Music",
              "name": "event_category.id",
              "rule": "eq",
              "value": 4
            },
            {
              "displayName": "Bollywood Night",
              "name": "event_category.id",
              "rule": "eq",
              "value": 6
            },
            {
              "displayName": "DJ Sets ",
              "name": "event_category.id",
              "rule": "eq",
              "value": 7
            }
          ]
        }
      ],
      currentFilter: 'sort',
      filterOptions: []);
}
