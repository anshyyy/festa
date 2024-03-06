class EventApiConstants {
  static const EVENTS = '/events';
  static const USERS = '/users';
  static const GET_FILTERS = '$EVENTS/filters';
  static const GET_USER_DETAILS = '$USERS/details';
}

class AuthApiConstants {
  static const USERS = '/users';
  static const ADD_OR_REMOVE_FCM_TOKEN = '$USERS/firebase/token';
}

class PubApiConstants {
  static const PUBS = '/pubs';
}

class NotificationConstants {
  static const notification = '/notifications';
  static const getNotification = '/notifications/user';
}
