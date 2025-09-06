
import 'domain/core/configs/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp();
//  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  final appConfig = AppConfig(
    appTitle: 'Festa',
    serverUrl: "https://api.festaapp.in",
    buildFlavor: 'Dev',
  
    googleMapsApiKey: '',
    razorPayApiKey: '',
    child: Container(),
  );
  appInitializer(appConfig);
}
