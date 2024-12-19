import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/dtos/user_dto.dart';
import '../../../event/dtos/artist/artist_dto.dart';
import '../../../event/dtos/event/event_dto.dart';
import '../../../event/dtos/pub/pub_dto.dart';

part 'blocked_users.freezed.dart';
part 'blocked_users.g.dart';

@freezed
class BlockedUsers with _$BlockedUsers {
  const factory BlockedUsers({
    required List<PubDto> pubs,
    required List<EventDto> events,
    required List<ArtistDto> artists,
    required List<UserDto> users,
  }) = _BlockedUsers;

  factory BlockedUsers.fromJson(Map<String, dynamic> json) =>
      _$BlockedUsersFromJson(json);
}

