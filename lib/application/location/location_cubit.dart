import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/core/configs/app_config.dart';
import '../../domain/core/constants/other_constants.dart';
import '../../domain/location/location_repository.dart';
import '../../infrastructure/auth/dtos/user_dto.dart';
import '../../infrastructure/core/dtos/location/location_dto.dart';
import '../../infrastructure/location/dtos/suggestion/suggestion_dto.dart';
import '../../infrastructure/location/i_location_repository.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(super.initialState);


   void toggleLocationDialog() {
    emit(state.copyWith(showLocationDialog: !state.showLocationDialog));
  }

  void onLocationChange(
      {required String placeId, required String locationName}) async {
    Either<dynamic, Map<String, dynamic>> response =
        await state.locationRepository.getLocationDetails(placeId: placeId);
    response.fold((l) => null, (r) {
      final updatedLocation = LocationDto(
          latitude: r['lat'] as double,
          longitude: r['lng'] as double,
          area: locationName,
          city: locationName,
          state: locationName,
          country: 'India',
          icon: '');
      updateLocation(location: updatedLocation);
    });
    emit(state.copyWith(suggestions: [], isLocationSearchChanged: false));
  }



void onLocationSearchChange({required String query})async{
emit(state.copyWith(isLocationSearchChanged: query.isNotEmpty));
    final locationSuggestions =
        await state.locationRepository.getLocationSuggestions(query: query);
    emit(state.copyWith(suggestions: locationSuggestions));
}
  void updateLocation({required LocationDto location}){
     emit(state.copyWith(location: location,isSuccess: true));
  }
    void onDetectMyLocation() async {
    await Geolocator.requestPermission();
    final permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      emit(state.copyWith(showPermissionDialog: true));
      return;
    }

    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) {
      throw Error();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    Either<dynamic, LocationDto> response = await state.locationRepository
        .getLocationByCoordinates(
            lat: position.latitude, lng: position.longitude);

    response.fold((l) {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }, (r) {
        emit(state.copyWith(location: r,isSuccess:true));
    });
  }
}
