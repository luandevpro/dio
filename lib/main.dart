import 'package:flutter/material.dart';
import 'package:flutter_json/constants/app_constant.dart';
import 'package:flutter_json/routers/routers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePath.Home,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
