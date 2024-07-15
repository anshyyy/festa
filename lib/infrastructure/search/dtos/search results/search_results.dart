import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/dtos/user_dto.dart';
import '../../../event/dtos/artist/artist_dto.dart';
import '../../../event/dtos/event/event_dto.dart';
import '../../../event/dtos/pub/pub_dto.dart';

part 'search_results.freezed.dart';
part 'search_results.g.dart';

@Freezed()
class SearchResults with _$SearchResults {
  const factory SearchResults({
    required List<PubDto> pubs,
    required List<EventDto> events,
    required List<ArtistDto> artists,
    required List<UserDto> users,
  }) = _SearchResults;

  factory SearchResults.fromJson(Map<String, dynamic> json) => _$SearchResultsFromJson(json);
}
