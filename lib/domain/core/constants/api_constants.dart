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
  static const TICKET = '$EVENTS/ticket';
  static const EVENTS_ALL = '$EVENTS/all';
  
}

class SearchApiConstants{
  static const SEARCH ='/search';
}

class BookingApiConstants {
  static const BOOKING = '/booking';
  static const BOOKING_CREATE = '$BOOKING/event';
  static const BOOKING_STATUS = '$BOOKING/payment/status';
  static const COVER_CHARGE = '$BOOKING/cover';
  static const COUPON = '/coupon';
}

class UserApiConstants {
  static const USERS = '/users';
  static const GET_USER_DETAILS = '$USERS/details';
  static const FRIENDS = 'friends';
  static const FOLLOWERS = 'followers';
  static const DETAILS = 'details';
  static const PERSONALIZE = '/personalize';
  static const PERSONALIZE_LIST = '$PERSONALIZE/list';
  static const GET_USER_TICKETS = '/booking/user';
  static const DELETE_REASON = '/feedback/delete/user';
  static const REPORT = '/feedback/report';
  static const REVIEW = '/feedback/event';
  static const BLOCK = '/block';
  static const BLOCKED_USERS = '$BLOCK/blocked';
}

class AuthApiConstants {
  static const USERS = '/users';
  static const ADD_OR_REMOVE_FCM_TOKEN = '$USERS/firebase/token';
  static const DELETE_REASON = '/feedback/delete$USERS';
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
  static const LOCATION_BY_COORDINATES = '$GOOGLE_MAPS_API/geocode/json';
}
