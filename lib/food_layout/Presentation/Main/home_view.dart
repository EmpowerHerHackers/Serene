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

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedCategoryIndex = 0;
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
                                "New York City",
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
