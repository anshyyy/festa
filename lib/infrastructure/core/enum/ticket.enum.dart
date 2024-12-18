enum TicketCategoryEnum {
   COVER,
   ENTRY_COVER,
   FREE,
}

enum CheckinStatus {
  Attended,
  PartiallyAttended,
  Pending,
  Cancelled,
}

extension CheckinStatusExtension on CheckinStatus {
  String get value {
    switch (this) {
      case CheckinStatus.Attended:
        return 'Attended';
      case CheckinStatus.PartiallyAttended:
        return 'PartiallyAttended';
      case CheckinStatus.Pending:
        return 'Pending';
      case CheckinStatus.Cancelled:
        return 'Cancelled';
    }
  }
}
