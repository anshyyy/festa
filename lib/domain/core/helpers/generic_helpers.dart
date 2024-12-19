import 'package:flutter/material.dart';

import '../../../infrastructure/artist/dtos/artist/artist_dto.dart';
import '../../../infrastructure/event/dtos/artist/artist_dto.dart';
import '../constants/string_constants.dart';

class GenericHelpers {
  bool isValidMobile(String phone) {
    final phoneRegExp = RegExp('[0-9]+\$');
    return phoneRegExp.hasMatch(phone);
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  String getDynamicLink(String category, String id) {
    return AppConstants.dynamicUrl
        .replaceAll('<category>', category)
        .replaceAll('<id>', id);
  }

  String formatEventShareMessage({
    required String eventName,
    required DateTime eventDateTime,
    required List<ArtistProfileDto> artists,
    required String eventLocation,
    required String eventCategory,
    required String eventId,
  }) {
    String eventLink = getDynamicLink(eventCategory, eventId);
    
    String formattedDate = _formatEventDateTime(eventDateTime);
    
    String artistNames = artists.map((artist) => artist.fullName).join(', ');
    
    return AppConstants.eventShareMessage
        .replaceAll('{eventName}', eventName)
        .replaceAll('{eventDate}', formattedDate)
        .replaceAll('{eventLocation}', eventLocation)
        .replaceAll('{eventLink}', eventLink)
        .replaceAll('{artists}', artistNames);
  }

  String _formatEventDateTime(DateTime dateTime) {
    final List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    
    String day = weekdays[dateTime.weekday - 1];
    String time = _formatTime(dateTime);
    String date = '${dateTime.day} ${months[dateTime.month - 1]}';
    
    return '$day, $date @$time';
  }

  String _formatTime(DateTime dateTime) {
    int hour = dateTime.hour;
    String period = 'am';
    
    if (hour >= 12) {
      period = 'pm';
      if (hour > 12) hour -= 12;
    }
    
    return '$hour$period';
  }

  DateTime getDatetimeFromString(String date) {
    final List<String> splitDate = date.split('-');
    return DateTime(
      int.parse(splitDate.first),
      int.parse(splitDate[1]),
      int.parse(splitDate.last),
    );
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
