class CoreApiConstants {
  static const UPLOAD = '/upload';
}

class EventApiConstants {
  static const EVENTS = '/events';
  static const USERS = '/users';
  static const GET_FILTERS = '$EVENTS/filters';
  static const GET_USER_DETAILS = '$USERS/details';
  static const GET_EVENTS_BY_PUB_ID = '$EVENTS/pub';
  static const LIKE_EVENT = '$EVENTS/like';
  static const UNLIKE_EVENT = '$EVENTS/unlike';
}

class UserApiConstants {
  static const USERS = '/users';
  static const GET_USER_DETAILS = '$USERS/details';
  static const FRIENDS = 'friends';
  static const FOLLOWERS = 'followers';
  static const DETAILS = 'details';
  static const PERSONALIZE = '/personalize';
  static const PERSONALIZE_LIST = '$PERSONALIZE/list';
}

class AuthApiConstants {
  static const USERS = '/users';
  static const ADD_OR_REMOVE_FCM_TOKEN = '$USERS/firebase/token';
}

class PubApiConstants {
  static const PUBS = '/pubs';
}

class ArtistApiConstants {
  static const ARTIST = '/artist';
  static const FOLLOW_ARTIST = '$ARTIST/follow';
  static const UNFOLLOW_ARTIST = '$ARTIST/unfollow';
  static const LIKE_MUSIC = '$ARTIST/music/like';
  static const UNLIKE_MUSIC = '$ARTIST/music/unlike';
}

class NotificationConstants {
  static const notification = '/notifications';
  static const getNotification = '/notifications/user';
}

class LocationApiConstants {
  static const GOOGLE_MAPS_API = 'https://maps.googleapis.com/maps/api';
  static const PLACE_AUTOCOMPLETE = '$GOOGLE_MAPS_API/place/autocomplete/json';
  static const PLACE_DETAILS = '$GOOGLE_MAPS_API/place/details/json';
}
