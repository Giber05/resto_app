import 'package:flutter/material.dart';
import 'package:resto_app/modules/authenticated/data/models/restaurant_model.dart';
import 'package:resto_app/modules/authenticated/presentation/features/restaurant_list/restaurant_list_screen.dart';
import 'package:resto_app/modules/guest/presentation/features/splash/splash_screen.dart';
import 'modules/authenticated/presentation/features/restaurant_detail/restaurant_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resto App',
      theme: ThemeData(
        fontFamily: "SF-Pro-Rounded",
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        RestaurantListScreen.routeName: (context) => RestaurantListScreen(),
        RestaurantDetail.routeName: (context) => RestaurantDetail(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as RestaurantModel),
      },
    );
  }
}
