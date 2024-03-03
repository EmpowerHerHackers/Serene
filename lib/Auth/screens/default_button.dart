import 'package:serene/food_layout/Core/app_colors.dart';
import 'package:serene/food_layout/Core/response_conf.dart';
import 'package:serene/food_layout/Core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key,
      required this.btnContent,
      this.borderColor,
      this.function,
      this.btnIcon,
      this.contentColor,
      this.iconColor,
      this.bgColor});
  final String btnContent;
  final IconData? btnIcon;
  final VoidCallback? function;
  final Color? iconColor;
  final Color? contentColor;
  final Color? bgColor;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(52),
      width: double.infinity,
      child: FilledButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  side: BorderSide(
                    color: borderColor ?? Pallete.orangePrimary,
                  ),
                  borderRadius: BorderRadius.circular(getSize(100)))),
              backgroundColor:
                  MaterialStatePropertyAll(bgColor ?? Pallete.orangePrimary)),
          onPressed: function,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btnIcon != null
                  ? Row(
                      children: [
                        Icon(
                          btnIcon,
                          color: iconColor ?? Colors.white,
                          size: getSize(20),
                        ),
                        const Gap(8)
                      ],
                    )
                  : const SizedBox(),
              Text(
                btnContent,
                style: TextStyles.bodyMediumSemiBold.copyWith(
                    color: contentColor ?? Pallete.neutral10,
                    fontSize: getFontSize(14)),
              ),
            ],
          )),
    );
  }
}
