import 'dart:developer';
import 'package:intl/intl.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/pub/pub_repository.dart';
import '../../domain/user/user_repository.dart';
import '../../infrastructure/core/dtos/asset/asset_dto.dart';
import '../../infrastructure/event/dtos/pub/pub_dto.dart';
import '../../infrastructure/pub/dtos/pub_opening_hours/pub_opening_hours_dto.dart';
import '../../infrastructure/pub/i_pub_repository.dart';
import '../../infrastructure/user/i_user_repository.dart';

part 'club_profile_cubit.freezed.dart';
part 'club_profile_state.dart';

class ClubProfileCubit extends Cubit<ClubProfileState> {
  ClubProfileCubit(super.initialState) {}

  final int limit = 10;
  bool isFetching = false;

  void init() async {
    emit(state.copyWith(isLoading: true));
    final club = await state.pubRepository.getPubById(pubId: state.clubId);

    final assets = await state.pubRepository.getPubAssets(
      pubId: state.clubId,
      page: state.page,
      limit: limit,
    );
    club.fold((l) {
      emit(state.copyWith(
          isLoading: false,
          isFailed: true,
          isSuccessful: false,
          responseMsg: l,
          assets: assets));
    }, (r) {
      // if (r.coverImageUrl.isNotEmpty) {
      //   final coverImageAsset =
      //       AssetDto(type: 'image', url: r.coverImageUrl, thumbnail: '');
      //   r.assets.insert(0, coverImageAsset);
      // }
      
      if(r.highlights.isEmpty){
        r.highlights.insert(0, const AssetDto(type: 'video', url: 'https://res.cloudinary.com/dltfyyjib/video/upload/v1731394196/bqe6dodvvnarwe3pgodr.mp4', thumbnail: ''));
      }

      emit(state.copyWith(
        isLoading: false,
        isFailed: false,
        isSuccessful: true,
        highlights: r.highlights,
        assetToDisplay: r.highlights.isEmpty ? assets : r.highlights,
        pub: r,
        assets: assets,
        isBlocked: r.extraDetailsDto!.isBlocked,
        isFollowing: r.extraDetailsDto!.isFollowing,
      ));
      bool isOpenNow = isClubOpenNow(r.openingHours as PubOpeningHours);
      emit(state.copyWith(isOpenNow: isOpenNow));
    });

    mediaScrollControllerChange();

    state.dragController.addListener(() {
      emit(state.copyWith(
        isAtTop: state.dragController.size >= 1,
      ));
    });
  }

  void initializeTab(TickerProvider provider) {
    emit(state.copyWith(
        tabController: TabController(length: 3, vsync: provider)));
  }

  void toggleMute() {
    emit(state.copyWith(isMuted: !state.isMuted));
  }

  void emitFromAnywhere({
    required ClubProfileState state,
  }) {
    emit(state);
  }

  void onCarouselChange({required int index}) {
    emit(state.copyWith(currentImageIndex: index));
  }

  void mediaScrollControllerChange() {
      // state.dragController?.addListener(() {
      //     print("state.dragController!.size: ${state.dragController.size}");
      //     print("state.dragController!.pixels: ${state.dragController!.pixels}");

      // });
      state.scrollController?.addListener(() {
          if(state.scrollController!.position.pixels < 0){
           // print("state.scrollController!.pixels: ${state.scrollController!.position.pixels}");
            emit(state.copyWith(isAtTabTop: state.scrollController.position.pixels <= 0));
          }
      });
  }




  void onControllerChange(ScrollController controller) {
    emit(state.copyWith(parentController: controller));
  }

  void followUnfollowPub({required int pubId, required bool isFollowing}) {
    emit(state.copyWith(isLoading: true));
    if (isFollowing) {
      state.pubRepository.unfollowPub(pubId: pubId);
      emit(state.copyWith(isLoading: false, isFollowing: false));
    } else {
      state.pubRepository.followPub(pubId: pubId);
      emit(state.copyWith(isLoading: false, isFollowing: true));
    }
  }

  void blockOrUnblockPub({bool isBlock = true}) async {
    if (isBlock) {
      emit(state.copyWith(isBlocked: true));
      await state.userRepository.block(
        type: 'pub',
        id: state.clubId.toString(),
      );
    } else {
      //
      emit(state.copyWith(isBlocked: false));
      await state.userRepository.unBlock(
        type: 'pub',
        id: state.clubId.toString(),
      );
    }
  }

  bool isClubOpenNow(PubOpeningHours openingHours) {
    final List<String> weekdayText = openingHours.weekdayText;

    final DateTime now = DateTime.now();
    final String currentDay = DateFormat('EEEE').format(now);

    // Find the current day's schedule
    String? todaySchedule = weekdayText.firstWhere(
      (day) => day.toLowerCase().startsWith(currentDay.toLowerCase()),
      orElse: () => '',
    );


    if (todaySchedule.isEmpty) return false;

    // Extract the time range
    List<String> parts = todaySchedule.split(': ');
  
    if (parts.length != 2) return false;

    List<String> timeRange = parts[1].split('–');
  
    if (timeRange.length != 2) return false;

    String openTime = _normalizeTime(timeRange[0].trim());
    String closeTime = _normalizeTime(timeRange[1].trim());

    emit(state.copyWith(todayOpeningTime: openTime,todayClosingTime: closeTime));

    // Parse times
    DateTime openDateTime = _parseTime(openTime);
    DateTime closeDateTime = _parseTime(closeTime);

    // Adjust times to today's date for comparison
    DateTime today = DateTime(now.year, now.month, now.day);
    openDateTime = today
        .add(Duration(hours: openDateTime.hour, minutes: openDateTime.minute));
    closeDateTime = today.add(
        Duration(hours: closeDateTime.hour, minutes: closeDateTime.minute));
    // If close time is earlier than or equal to open time, it means it's on the next day
    if (closeDateTime.isBefore(openDateTime) ||
        closeDateTime.isAtSameMomentAs(openDateTime)) {
      closeDateTime = closeDateTime.add(const Duration(days: 1));
    }

    // Adjust for midnight crossing
    if (closeDateTime.isBefore(openDateTime)) {
      closeDateTime = closeDateTime.add(const Duration(days: 1));
    }

    // Compare current time
    DateTime currentDateTime =
        DateTime(now.year, now.month, now.day, now.hour, now.minute);
    return currentDateTime.isAfter(openDateTime) &&
        currentDateTime.isBefore(closeDateTime);
  }

  String _normalizeTime(String time) {
    // Remove any leading/trailing whitespace
    time = time.trim();

    // If AM/PM is not specified
    if (!time.toLowerCase().endsWith('am') &&
        !time.toLowerCase().endsWith('pm')) {
      // If it's 12:something, assume it's PM unless it's exactly 12:00
      if (time.startsWith('12:') && time != '12:00') {
        time += ' PM';
      }
      // For times after 12:00 and before 12:00, assume PM
      else if (!time.startsWith('12:00')) {
        time += ' PM';
      }
      // 12:00 is assumed to be PM, but we'll add it explicitly
      else {
        time += ' PM';
      }
    }

    // Ensure proper formatting for parsing
    return time.toUpperCase();
  }

  DateTime _parseTime(String time) {
    // First, try parsing with the expected format
    try {
      return DateFormat('h:mm a').parse(time);
    } catch (e) {
      // If that fails, try a more lenient parsing
      final RegExp timeRegex = RegExp(r'(\d{1,2}):(\d{2})\s*(AM|PM)?');
      final match = timeRegex.firstMatch(time);
      if (match != null) {
        int hour = int.parse(match.group(1)!);
        int minute = int.parse(match.group(2)!);
        String? amPm = match.group(3);

        if (amPm == null && hour < 12) {
          amPm = 'PM';
        }

        if (amPm == 'PM' && hour < 12) {
          hour += 12;
        } else if (amPm == 'AM' && hour == 12) {
          hour = 0;
        }

        return DateTime(2000, 1, 1, hour, minute);
      }
      // If all parsing attempts fail, rethrow the exception
      throw FormatException('Unable to parse time: $time');
    }
  }
}
