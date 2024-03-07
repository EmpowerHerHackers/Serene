import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:serene/onboarding/onboarding_two.dart';

class OnboardingOne extends StatefulWidget {
  const OnboardingOne({super.key});

  @override
  State<OnboardingOne> createState() => _OnboardingOneState();
}

class _OnboardingOneState extends State<OnboardingOne> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedPronoun = 'Select Pronoun';
  final List<String> _pronouns = [
    'Select Pronoun',
    'He/Him',
    'She/Her',
    'They/Them'
  ];
  String getFirst(String name) {
    return _nameController.text.split(" ")[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's get to know you better",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            const Text(
              "Full Name",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: TextField(
                controller: _nameController,
                onChanged: (String? text) {},
                decoration: InputDecoration(
                  hintText: 'John Doe',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const Gap(32),
            const Text(
              "Preferred Pronouns",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: DropdownButton<String>(
                value: _selectedPronoun,
                hint: const Text(
                  'Select your pronouns',
                ),
                onChanged: (String? newValue) {
                  setState(
                    () {
                      _selectedPronoun = newValue!;
                    },
                  );
                },
                items: _pronouns.map<DropdownMenuItem<String>>(
                  (String pronoun) {
                    return DropdownMenuItem<String>(
                      value: pronoun,
                      child: Text(pronoun),
                    );
                  },
                ).toList(),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingTwo(
                          first: getFirst(_nameController.text),
                        ),
                      ),
                    );
                  },
                  child: const Text("Continue"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
