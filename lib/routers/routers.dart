import 'package:flutter/material.dart';
import 'package:flutter_json/constants/app_constant.dart';
import 'package:flutter_json/ui/create_post_view.dart';
import 'package:flutter_json/ui/home_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
        break;
      case RoutePath.CreatPost:
        return MaterialPageRoute(builder: (_) => CreatePostView());
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
