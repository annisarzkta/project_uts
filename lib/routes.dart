import 'package:flutter/material.dart';
import 'package:uts_aplikasibergerak/screens/jobdescription_screen/jobdescription_screen.dart';
import 'package:uts_aplikasibergerak/screens/login_screen/login_screen.dart';
import 'package:uts_aplikasibergerak/screens/logout_screen/logout_screen.dart';
import 'package:uts_aplikasibergerak/screens/my_profile/my_profile.dart';
import 'package:uts_aplikasibergerak/screens/search_screen/search_screen.dart';
import 'package:uts_aplikasibergerak/screens/splash_screen/splash_screen.dart';
import 'package:uts_aplikasibergerak/screens/event_screen/event_screen.dart';
import 'package:uts_aplikasibergerak/screens/timeline_screen/timeline_screen.dart';
import 'screens/home_screen/home_screen.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  LogoutScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  MyProfileScreen.routeName: (context) => const MyProfileScreen(),
  JobDescriptionScreen.routeName: (context) => const JobDescriptionScreen(),
  TimelineScreen.routeName: (context) => const TimelineScreen(),
  EventScreen.routeName: (context) => const EventScreen(),
  SearchScreen.routeName: (context) => const SearchScreen(),
};
