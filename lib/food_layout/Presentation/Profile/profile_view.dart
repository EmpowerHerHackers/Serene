import 'package:serene/food_layout/Core/Routes/routes_name.dart';
import 'package:serene/food_layout/Core/app_colors.dart';
import 'package:serene/food_layout/Core/assets_constantes.dart';
import 'package:serene/food_layout/Core/font_size.dart';
import 'package:serene/food_layout/Core/response_conf.dart';
import 'package:serene/food_layout/Core/text_styles.dart';
import 'package:serene/Auth/screens/default_button.dart';
import 'package:serene/food_layout/Presentation/Base/base.dart';
import 'package:serene/food_layout/Presentation/Profile/screens/profile_info_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          buildContext: context,
          screenTitle: "Profile Settings",
          isBackup: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(24),
              Stack(
                children: [
                  CircleAvatar(
                    radius: getSize(50),
                    child: const Icon(Icons.person),
                  ),
                  Positioned(
                    left: getSize(72),
                    bottom: getSize(8),
                    child: Container(
                      width: getSize(32),
                      height: getSize(32),
                      padding: EdgeInsets.all(getSize(6)),
                      decoration: const BoxDecoration(
                          color: Color(0xFFF5F5FF), shape: BoxShape.circle),
                      child: Icon(
                        CupertinoIcons.camera_fill,
                        color: Pallete.orangePrimary,
                        size: getSize(20),
                      ),
                    ),
                  )
                ],
              ),
              const Gap(16),
              Text(
                "Serene fount",
                style: TextStyles.bodyLargeSemiBold.copyWith(
                    color: Pallete.neutral100,
                    fontSize: getFontSize(FontSizes.large)),
              ),
              const Gap(4),
              Text(
                "Serenefount@gmail.com",
                style: TextStyles.bodyMediumRegular.copyWith(
                  color: const Color(0xFF878787),
                  fontSize: getFontSize(FontSizes.medium),
                ),
              ),
              const Gap(28),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(getSize(8)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(getSize(8)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Orders",
                          style: TextStyles.bodyLargeSemiBold.copyWith(
                              color: Pallete.neutral100,
                              fontSize: getFontSize(FontSizes.large)),
                        ),
                        Text(
                          "See All",
                          style: TextStyles.bodyMediumSemiBold.copyWith(
                            color: Pallete.orangePrimary,
                            fontSize: getFontSize(FontSizes.medium),
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order ID",
                              style: TextStyles.bodySmallSemiBold.copyWith(
                                color: const Color(0xFF878787),
                                fontSize: getFontSize(FontSizes.small),
                              ),
                            ),
                            const Gap(4),
                            Text(
                              "888333777",
                              style: TextStyles.bodySmallSemiBold.copyWith(
                                color: Pallete.neutral100,
                                fontSize: getFontSize(FontSizes.small),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: getWidth(67),
                          height: getHeight(24),
                          padding: EdgeInsets.symmetric(
                              horizontal: getWidth(8), vertical: getHeight(4)),
                          decoration: ShapeDecoration(
                            color: Pallete.orangePrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                getSize(30),
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'In Delivery',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: getFontSize(FontSizes.superSmall),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Gap(12),
                    Container(
                      width: double.infinity,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFEDEDED),
                          ),
                        ),
                      ),
                    ),
                    const Gap(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: getHeight(54),
                              width: getWidth(52),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(getSize(8)),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          AssetsConstants.ordinaryBurger),
                                      fit: BoxFit.fill)),
                            ),
                            const Gap(14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Burger With Meat",
                                  style: TextStyles.bodyMediumSemiBold.copyWith(
                                    color: Pallete.neutral100,
                                    fontSize: getFontSize(FontSizes.medium),
                                  ),
                                ),
                                const Gap(8),
                                Text(
                                  "\$ 12,230",
                                  style: TextStyles.bodyMediumBold.copyWith(
                                    color: Pallete.orangePrimary,
                                    fontSize: getFontSize(FontSizes.medium),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "14 items",
                          style: TextStyles.bodySmallMedium.copyWith(
                            color: Pallete.neutral100,
                            fontSize: getFontSize(FontSizes.small),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Gap(24),
              Container(
                width: double.infinity,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFEDEDED),
                    ),
                  ),
                ),
              ),
              const Gap(24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profile",
                    style: TextStyles.bodySmallMedium.copyWith(
                        color: const Color(0xFF878787),
                        fontSize: getFontSize(FontSizes.small)),
                  ),
                  ProfileInfoTile(
                      function: () => Navigator.pushNamed(
                          context, RoutesName.personnalData),
                      prefixIcon: Icons.person,
                      title: "Personal Data"),
                  ProfileInfoTile(
                      function: () =>
                          Navigator.pushNamed(context, RoutesName.settings),
                      prefixIcon: Icons.settings,
                      title: "Settings"),
                  ProfileInfoTile(
                      function: () =>
                          Navigator.pushNamed(context, RoutesName.extraCard),
                      prefixIcon: Icons.credit_card,
                      title: "Extra Card"),
                ],
              ),
              const Gap(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Support",
                    style: TextStyles.bodySmallMedium.copyWith(
                        color: const Color(0xFF878787),
                        fontSize: getFontSize(FontSizes.small)),
                  ),
                  const ProfileInfoTile(
                      prefixIcon: Icons.info_outline, title: "Help Center"),
                  const ProfileInfoTile(
                      prefixIcon: Icons.delete,
                      title: "Request Account Deletion"),
                  const ProfileInfoTile(
                      prefixIcon: Icons.person_add,
                      title: "Add another account"),
                ],
              ),
              const Gap(16),
              const DefaultButton(
                btnContent: "Sign Out",
                btnIcon: Icons.login_outlined,
                contentColor: Pallete.pureError,
                iconColor: Pallete.pureError,
                bgColor: Colors.white,
                borderColor: Pallete.neutral40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
