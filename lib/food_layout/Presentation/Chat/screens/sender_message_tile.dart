import 'package:serene/food_layout/Core/app_colors.dart';
import 'package:serene/food_layout/Core/font_size.dart';
import 'package:serene/food_layout/Core/response_conf.dart';
import 'package:serene/food_layout/Core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SenderMessageTile extends StatelessWidget {
  const SenderMessageTile({super.key, this.message});
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: getWidth(223),
            height: getHeight(32),
            padding: EdgeInsets.all(getSize(8)),
            decoration: ShapeDecoration(
              color: Pallete.orangePrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(getSize(8))),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(message ?? 'Okay, for what level of spiciness?',
                  style: TextStyles.bodySmallMedium.copyWith(
                      color: Pallete.whiteError,
                      fontSize: getFontSize(FontSizes.small))),
            ),
          ),
          const Gap(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "09.15",
                style: TextStyles.bodySmallMedium.copyWith(
                    color: Pallete.neutral60,
                    fontSize: getFontSize(FontSizes.small)),
              ),
              const Gap(4),
              const Icon(
                Icons.check,
                color: Pallete.orangePrimary,
              )
            ],
          )
        ],
      ),
    );
  }
}
