import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // imports Firebase configuration for the current platform.
import 'package:serene/food_layout/Core/Routes/routes.dart';
import 'package:serene/food_layout/Core/Routes/routes_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ensures that Flutter engine is initialized for background processes.
  await Firebase.initializeApp( // asynchronously initializes Firebase with platform-specific settings.
    options: DefaultFirebaseOptions.currentPlatform, // selects Firebase configuration based on the running platform (iOS, Android, web).
  );
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
