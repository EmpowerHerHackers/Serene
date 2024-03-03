import 'package:serene/food_layout/Core/app_colors.dart';
import 'package:serene/food_layout/Core/response_conf.dart';
import 'package:serene/food_layout/Core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DefaultField extends StatefulWidget {
  const DefaultField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.isPasswordField});
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool? isPasswordField;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  @override
  State<DefaultField> createState() => _DefaultFieldState();
}

class _DefaultFieldState extends State<DefaultField> {
  bool isHideCaracter = true;
  @override
  Widget build(BuildContext context) {
    setState(() {
      isHideCaracter = widget.isPasswordField ?? false;
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText != null
            ? Text(
                "${widget.labelText}",
                style: TextStyles.bodyMediumMedium.copyWith(
                    color: Pallete.neutral100, fontSize: getFontSize(14)),
              )
            : const SizedBox(),
        const Gap(8),
        TextFormField(
          obscureText: isHideCaracter,
          obscuringCharacter: "*",
          style: TextStyles.bodyMediumMedium
              .copyWith(color: Pallete.neutral100, fontSize: getFontSize(14)),
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyles.bodyMediumMedium.copyWith(
                  color: Pallete.neutral60, fontSize: getFontSize(14)),
              contentPadding: EdgeInsets.all(getSize(16)),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: Pallete.neutral40),
                borderRadius: BorderRadius.circular(getSize(8)),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: Pallete.neutral40),
                  borderRadius: BorderRadius.circular(getSize(8))),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: Pallete.neutral40),
                  borderRadius: BorderRadius.circular(getSize(8))),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      size: getSize(20),
                      color: const Color(0xFF878787),
                    )
                  : null,
              suffixIcon: widget.isPasswordField == true
                  ? InkWell(
                      onTap: () => setState(() {
                        isHideCaracter = !isHideCaracter;
                      }),
                      child: Icon(
                        isHideCaracter == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: getSize(20),
                        color: Pallete.neutral100,
                      ),
                    )
                  : widget.suffixIcon != null
                      ? Icon(
                          widget.suffixIcon,
                          size: getSize(20),
                          color: const Color(0xFF878787),
                        )
                      : null),
        ),
      ],
    );
  }
}
