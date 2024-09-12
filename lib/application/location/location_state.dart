part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    required LocationRepository locationRepository,
    required bool showPermissionDialog,
    required bool isSuccess,
    required bool isLocationSearchChanged,
    required LocationDto location,
    required bool showLocationDialog,
    required List<SuggestionDto> suggestions,
    required List<Map<String, dynamic>> locationSuggestions,
    UserDto? user,
  }) = _LocationState;

  factory LocationState.initial(
          {required AppStateNotifier appStateNotifier,
          required String serverUrl,
          required String mapsApiKey}) =>
      LocationState(
          locationRepository: ILocationRepository(
            mapsApiKey: mapsApiKey,
          ),
          user: appStateNotifier.user,
          showPermissionDialog: false,
          showLocationDialog: false,
          isLocationSearchChanged:false,
          suggestions: [],
          locationSuggestions: [
            {
              'name': 'Mumbai',
              'image':
                  'https://images.unsplash.com/photo-1529253355930-ddbe423a2ac7?q=80&w=2665&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            },
            {
              'name': 'Delhi',
              'image':
                  'https://images.unsplash.com/photo-1587474260584-136574528ed5?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            },
            {
              'name': 'Bangalore',
              'image':
                  'https://images.unsplash.com/photo-1637540485660-93031d90b97b?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            },
            {
              'name': 'Japan',
              'image':
                  'https://images.unsplash.com/photo-1544808208-727498b3df07?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            },
            {
              'name': 'Up',
              'image':
                  'https://images.unsplash.com/photo-1701749740828-c068fa546d3e?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            },
          ],
          isSuccess: false,
          location: OtherConstants.defaultLocation);
}
