import 'package:serene/food_layout/Core/Routes/routes_name.dart';
import 'package:serene/food_layout/Core/app_colors.dart';
import 'package:serene/food_layout/Core/response_conf.dart';
import 'package:serene/food_layout/Core/text_styles.dart';
import 'package:flutter/material.dart';

class AccountStatus extends StatelessWidget {
  const AccountStatus(
      {super.key, required this.action, required this.question});
  final String question;
  final String action;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(RoutesName.login);
      },
      child: Align(
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: question,
                  style: TextStyles.bodyMediumMedium.copyWith(
                      color: Pallete.neutral100, fontSize: getFontSize(14))),
              TextSpan(
                  text: ' ',
                  style: TextStyles.bodyMediumSemiBold
                      .copyWith(fontSize: getFontSize(14))),
              TextSpan(
                  text: action,
                  style: TextStyles.bodyMediumSemiBold.copyWith(
                      color: Pallete.purplePrimary, fontSize: getFontSize(14))),
            ],
          ),
        ),
      ),
    );
  }
}
