import 'dart:developer';

import 'package:serene/food_layout/Core/Routes/routes_name.dart';
import 'package:serene/food_layout/Core/app_colors.dart';
import 'package:serene/food_layout/Core/assets_constantes.dart';
import 'package:serene/food_layout/Core/font_size.dart';
import 'package:serene/food_layout/Core/response_conf.dart';
import 'package:serene/food_layout/Core/text_styles.dart';
import 'package:serene/food_layout/Presentation/Base/food_item.dart';
import 'package:serene/food_layout/Presentation/Models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; 

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedCategoryIndex = 0;
  // initial state setting for current address display.
  String currentAddress = "Fetching location...";
  // Firebase Firestore instance for database operations.
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Firebase Auth instance for authentication operations.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getLocationUpdates(); // call to start listening for location updates.
  }

  // asynchronously requests location updates and handles permissions.
  Future<void> getLocationUpdates() async {
    // checks if location services are enabled on the device.
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => currentAddress = "Location services are disabled.");
      return;
    }
     // request location permissions from the user.
    LocationPermission permission = await Geolocator.checkPermission();
    // handle cases where location permissions are denied forever.
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        setState(() => currentAddress = "Location permissions are denied.");
        return;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      setState(() => currentAddress = "Location permissions are permanently denied.");
      return;
    }
    // listen for location updates and update the current address.
    Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        currentAddress = "${position.latitude}, ${position.longitude}";
      });
      uploadLocation(position);
    });
  }
   // uploads the given location to Firestore under the user's ID.
  Future<void> uploadLocation(Position position) async {
    String userId = _auth.currentUser?.uid ?? 'anonymous';  // get the current user's ID.
    if (userId == 'anonymous') {
      print("No signed-in user available for fetching UID");
      return;
    }
    // attempts to update the user's location in Firestore.
    try {
      await _firestore.collection('locations').doc(userId).set({
        'latitude': position.latitude,
        'longitude': position.longitude,
        'timestamp': FieldValue.serverTimestamp(), // uses server-side timestamp for consistency.
      }, SetOptions(merge: true)); // merges with existing data to avoid overwriting.
      print("Location updated in Firestore for user $userId");
    } catch (e) {
      print("Error updating location in Firestore: $e"); // log any errors that may occur.
    }
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: getHeight(250),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(24),
            ).copyWith(
              top: MediaQuery.of(context).viewPadding.top,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsConstants.homeTopBackgroundImage),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(top: getHeight(10), bottom: getHeight(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Your Location",
                                style: TextStyles.bodyMediumRegular.copyWith(
                                    color: Colors.white,
                                    fontSize: getFontSize(FontSizes.medium)),
                              ),
                              const Gap(8),
                              const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.white,
                                size: 16,
                              )
                            ],
                          ),
                          const Gap(8),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                                size: getSize(24),
                              ),
                              const Gap(8),
                              Text(
                                currentAddress,
                                style: TextStyles.bodyMediumSemiBold.copyWith(
                                    color: Colors.white,
                                    fontSize: getFontSize(FontSizes.medium)),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, RoutesName.search),
                            child: Container(
                              height: getSize(40),
                              width: getSize(40),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: getSize(24),
                              ),
                            ),
                          ),
                          const Gap(16),
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              RoutesName.notification,
                            ),
                            child: Container(
                              height: getSize(40),
                              width: getSize(40),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: Icon(
                                Icons.notifications_none_rounded,
                                color: Colors.white,
                                size: getSize(24),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const Gap(16),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Provide the best food for you",
                        style: TextStyles.headingH4SemiBold.copyWith(
                          color: Pallete.neutral10,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
            child: Column(
              children: [
                const Gap(26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Find by Category",
                      style: TextStyles.bodyLargeSemiBold.copyWith(
                          color: Pallete.neutral100,
                          fontSize: getFontSize(FontSizes.large)),
                    ),
                    Text(
                      "See All",
                      style: TextStyles.bodyMediumMedium.copyWith(
                          color: Pallete.orangePrimary,
                          fontSize: getFontSize(FontSizes.medium)),
                    )
                  ],
                ),
                const Gap(18),
                categoryList(),
                const Gap(24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FoodItem(),
                    FoodItem(),
                  ],
                ),
                const Gap(16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FoodItem(),
                    FoodItem(),
                  ],
                ),
                const Gap(16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FoodItem(),
                    FoodItem(),
                  ],
                ),
                const Gap(16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FoodItem(),
                    FoodItem(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget categoryList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories
          .asMap()
          .map((key, category) => MapEntry(
              key,
              InkWell(
                onTap: () {

                  setState(() {
                    selectedCategoryIndex = key;
                  });
                },
                child: Container(
                  width: getSize(65),
                  height: getSize(65),
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    shadows: const [
                      BoxShadow(
                        color: Color(0x0A111111),
                        blurRadius: 24,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                    color: selectedCategoryIndex == key
                        ? Pallete.orangePrimary
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(category.link),
                      const Gap(4),
                      Text(
                        category.designation.toString(),
                        style: TextStyles.bodyMediumMedium.copyWith(
                          color: selectedCategoryIndex == key
                              ? Colors.white
                              : Pallete.neutral60,
                        ),
                      )
                    ],
                  ),
                ),
              )))
          .values
          .toList(),
    );
  }
}
