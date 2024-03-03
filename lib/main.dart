import 'package:flutter/material.dart';
import 'package:serene/food_layout/Core/Routes/routes.dart';
import 'package:serene/food_layout/Core/Routes/routes_name.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.main,
      onGenerateRoute: Routes.onGenerateRoute,
      theme: ThemeData(canvasColor: Colors.white),
    );
  }
}
