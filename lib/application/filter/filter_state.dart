part of 'filter_cubit.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    required List<Map<String, dynamic>> filtersList,
    required String currentFilter,
    required List<Map<String, dynamic>> filterOptions,
    required String selectedOption,
    required bool noUse,
  }) = _FilterState;

  factory FilterState.initial() => const FilterState(
    noUse: true,
      filtersList: [
        {
          'displayName': 'Sort',
          'name': 'sort',
          'values': [
            {
              'name': 'featured',
              'displayName': 'Featured',
              'id': 'sort_featured',
              'isSelected': false
            },
            {
              'name': 'distance',
              'displayName': 'Distance',
              'value': 'ASC',
              'id': 'sort_distance',
              'isSelected': false
            },
            {
              'name': 'price_range_start',
              'displayName': 'Cost:Low to High',
              'value': 'ASC',
              'id': 'sort_low_to_high',
              'isSelected': false
            },
            {
              'name': 'price_range_start',
              'displayName': 'Cost:High to Low',
              'value': 'DESC',
              'id': 'sort_high_to_low',
              'isSelected': false
            },
            {
              'name': 'rating',
              'displayName': 'Rating',
              'value': 'DESC',
              'id': 'sort_rating',
              'isSelected': false
            }
          ]
        },
        {
          'displayName': 'Location',
          'name': 'range',
          'values': [
            {
              'name': 'range',
              'displayName': 'Within 1km',
              'value': 1000,
              'id': 'location_within_1km',
              'isSelected': false
            },
            {
              'name': 'range',
              'displayName': '< 3km',
              'value': 3000,
              'id': 'location_less_than_3km',
              'isSelected': false
            },
            {
              'name': 'range',
              'displayName': '< 5km',
              'value': 5000,
              'id': 'location_less_than_5km',
              'isSelected': false
            },
            {
              'name': 'range',
              'displayName': 'Anywhere',
              'value': 20000,
              'id': 'location_anywhere',
              'isSelected': false
            }
          ]
        },
        {
          'displayName': 'Dancefloor',
          'name': 'events.dance_floor',
          'values': [
            {
              'name': 'events.dance_floor',
              'displayName': 'Yes',
              'rule': 'eq',
              'value': true,
              'id': 'dancefloor_yes',
              'isSelected': false
            },
            {
              'name': 'events.dance_floor',
              'displayName': 'No',
              'rule': 'eq',
              'value': false,
              'id': 'dancefloor_no',
              'isSelected': false
            },
            {
              'name': 'events.dance_floor',
              'displayName': "Doesn't matter",
              'id': 'dancefloor_doesnt_matter',
              'isSelected': false
            }
          ]
        },
        {
          'displayName': 'Capacity',
          'name': 'events.capacity',
          'values': [
            {
              'name': 'events.capacity',
              'displayName': '50',
              'rule': 'lte',
              'value': 50,
              'id': 'capacity_50',
              'isSelected': false
            },
            {
              'name': 'events.capacity',
              'displayName': '100',
              'rule': 'lte',
              'value': 100,
              'id': 'capacity_100',
              'isSelected': false
            },
            {
              'name': 'events.capacity',
              'displayName': '200',
              'rule': 'lte',
              'value': 200,
              'id': 'capacity_200',
              'isSelected': false
            },
            {
              'name': 'events.capacity',
              'displayName': '500',
              'rule': 'lte',
              'value': 500,
              'id': 'capacity_500',
              'isSelected': false
            },
            {
              'name': 'events.capacity',
              'displayName': '1000',
              'rule': 'lte',
              'value': 1000,
              'id': 'capacity_1000',
              'isSelected': false
            },
            {
              'name': 'events.capacity',
              'displayName': '>1000',
              'id': 'capacity_greater_than_1000',
              'isSelected': false
            }
          ]
        },
        {
          'displayName': 'Genre/Music',
          'name': 'music',
          'values': [
            {
              'displayName': 'Themed Parties',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 1,
              'id': 'music_themed_parties',
              'isSelected': false
            },
            {
              'displayName': 'EDM',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 2,
              'id': 'music_edm',
              'isSelected': false
            },
            {
              'displayName': 'Rave Party',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 3,
              'id': 'music_rave_party',
              'isSelected': false
            },
            {
              'displayName': 'Live Music ',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 5,
              'id': 'music_live_music',
              'isSelected': false
            },
            {
              'displayName': 'Rock Music',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 4,
              'id': 'music_rock_music',
              'isSelected': false
            },
            {
              'displayName': 'Bollywood Night',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 6,
              'id': 'music_bollywood_night',
              'isSelected': false
            },
            {
              'displayName': 'DJ Sets ',
              'name': 'event_category.id',
              'rule': 'eq',
              'value': 7,
              'id': 'music_dj_sets',
              'isSelected': false
            }
          ]
        }
      ],
      currentFilter: 'sort',
      filterOptions: [],
      selectedOption: '');
}
