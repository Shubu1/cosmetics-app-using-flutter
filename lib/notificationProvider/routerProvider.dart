import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// RouteProvider class to manage the current route
class RouteProvider with ChangeNotifier {
  String _currentRoute =
      "/notification"; // Set the default route to the home page

  String get currentRoute => _currentRoute;

  void changeRoute(String route) {
    _currentRoute = route;
    notifyListeners();
  }
}

final routerProvider = Provider<RouteProvider>((ref) {
  return RouteProvider();
});
