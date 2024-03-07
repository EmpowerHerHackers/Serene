import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:serene/food_layout/Core/Routes/routes_name.dart';
import 'package:serene/onboarding/onboarding_one.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is used to center the Column
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centers the children vertically.
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centers the children horizontally.
          children: [
            const Text(
              "Welcome to",
              style: TextStyle(
                fontSize: 32,
                color: Colors.grey,
              ),
              textAlign: TextAlign
                  .center, // Centers the text within itself if wider than the screen.
            ),
            const SizedBox(
                height: 8), // Provides a fixed space after "Welcome to"
            const Text(
              "Serene",
              style: TextStyle(
                fontSize: 52,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16), // Provides space after "Serene"
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Let's help you set up your profile so Serene can help you in the best way possible",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
                height: 32), // Provides space before the "Continue" button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                // Assuming FilledButton is a custom styled ElevatedButton.
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(RoutesName.main);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity,
                      36), // Sets the button width to max and height to 36.
                ),
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
