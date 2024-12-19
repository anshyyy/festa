import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  void setUserId(String userId) async {
    await _analytics.setUserId(
        id: userId,
        callOptions: AnalyticsCallOptions(
          global: true,
        ));
  }

  void setUserProperties({
    required String name,
    required String val,
  }) async {
    await _analytics.setUserProperty(
      name: name,
      value: val,
      callOptions: AnalyticsCallOptions(
        global: true,
      ),
    );
  }

  Future<void> logEvent({
    required String eventName,
    required Map<String, dynamic> paras,
  }) async {
    await _analytics.logEvent(
      name: eventName,
      parameters: paras.cast<String, Object>(),
    );
  }
}
