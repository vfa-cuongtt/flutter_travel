import 'package:flutter/material.dart';
import 'package:travel_app/data/models/hotel_model.dart';
import 'package:travel_app/representation/screens/checkout_screen.dart';
import 'package:travel_app/representation/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:travel_app/representation/screens/hotel_detail_screen.dart';
import 'package:travel_app/representation/screens/hotels_screen.dart';
import 'package:travel_app/representation/screens/intro_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/screens/select_room_screen.dart';
import 'package:travel_app/representation/screens/splash_screen.dart';

import 'data/models/room_model.dart';

// * Define generate route
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelsScreen.routeName: (context) => const HotelsScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomBookingWidget.routeName: (context) =>
      const GuestAndRoomBookingWidget(),
  SelectRoomScreen.routeName: (context) => const SelectRoomScreen(),
};

// * Define generate route and add a model for the routes
MaterialPageRoute<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      // * Add Hotel model for the HotelDetailScreen
      return MaterialPageRoute(
        builder: (context) {
          final HotelModel hotelModel = (settings.arguments as HotelModel);
          return HotelDetailScreen(
            hotelModel: hotelModel,
          );
        },
      );

    case CheckoutScreen.routeName:
      // * Add Room model for the CheckOutScreen
      return MaterialPageRoute(
        builder: (context) {
          final RoomModel roomModel = (settings.arguments as RoomModel);
          return CheckoutScreen(
            roomModel: roomModel,
          );
        },
      );

    case HotelBookingScreen.routeName:
      // * Add destination for the HotelBookingScreen
      return MaterialPageRoute(
        builder: (context) {
          final String? nameDestination = (settings.arguments as String?);
          return HotelBookingScreen(
            nameDestination: nameDestination,
          );
        },
      );
    default:
      break;
  }
}
