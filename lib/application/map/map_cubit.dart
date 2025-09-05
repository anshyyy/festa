import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../../domain/core/configs/app_config.dart';
import '../../domain/core/services/storage_service/location_storage_service.dart';
import '../../domain/event/event_repository.dart';
import '../../infrastructure/auth/dtos/user_dto.dart';
import '../../infrastructure/core/dtos/location/location_dto.dart';
import '../../infrastructure/event/dtos/event_cordinates/event_cordinates.dart';
import '../../infrastructure/event/i_event_repository.dart';
import '../../presentation/map/widgets/marker.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(super.initialState);
  void init() async {
    try {
      emit(state.copyWith(isLoading: true));
      //fetch
      var events = await state.eventRepository.getAllEventsCoordinate();
      var location = await state.locationStorageService.getLocation();
      log("$location");
      if (location != null) {
        emit(state.copyWith(savedLocation: location));
      }

      List<Marker> markers = [];
      for (var event in events) {
        markers.add(Marker(
            point: LatLng(event.address.lat, event.address.lng),
            child: MarkerEvent(
              distance: 59,
                title: event.fullName,
                eventId: event.id,
                picture: event.coverImagerUrl)));
      }
      print(markers);
      emit(state.copyWith(
          isLoading: false, events: events, eventMarkers: markers));
    } catch (e) {
      emit(state.copyWith(isLoading: false, isFailed: true));
      log("$e");
    }
  }

  void animatedMapMove(
      LatLng destLocation, double destZoom, AnimationController controller) {
    try {
      // Check if the map is already at the destination
      final currentCenter = state.mapController.camera.center;
      if (currentCenter.latitude == destLocation.latitude &&
          currentCenter.longitude == destLocation.longitude) {
        print('Map is already at the destination location.');
        return; // Skip the animation if the location is already the destination
      }

      controller.reset();
      final latTween = Tween<double>(
          begin: state.mapController.camera.center.latitude,
          end: destLocation.latitude);
      final lngTween = Tween<double>(
          begin: state.mapController.camera.center.longitude,
          end: destLocation.longitude);
      final zoomTween =
          Tween<double>(begin: state.mapController.camera.zoom, end: destZoom);

      final Animation<double> animation =
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

      controller.addListener(() {
        state.mapController.move(
            LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
            zoomTween.evaluate(animation));
      });
      controller.forward();
    } catch (e) {
      print(e);
    }
  }
}
