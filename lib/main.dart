import 'package:courierway_deliveryboy/constant/constant.dart';
import 'package:courierway_deliveryboy/functions/change_language.dart';
import 'package:courierway_deliveryboy/functions/localizations.dart';
import 'package:courierway_deliveryboy/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      MyApp(
        appLanguage: appLanguage,
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;

  MyApp({this.appLanguage});
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'CourierWay Delivery Boy App',
    //   theme: ThemeData(
    //     primarySwatch: Colors.red,
    //     primaryColor: primaryColor,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   debugShowCheckedModeBanner: false,
    //   home: SplashScreen(),
    // );

    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          title: 'CourierWay Delivery Boy App',
          theme: ThemeData(
            primarySwatch: Colors.red,
            primaryColor: primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          locale: model.appLocal,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('hi', ''),
            Locale('ar', ''),
            Locale('zh', ''),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      }),
    );
  }
}
