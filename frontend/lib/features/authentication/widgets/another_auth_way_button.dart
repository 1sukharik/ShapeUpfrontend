import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnotherAuthButton extends StatelessWidget {
  final Function()? onTap;
  final String titleText;
  final String imgPath;
  final Color buttonColor;
  final Color textColor;

  const AnotherAuthButton(
      {super.key,
      required this.onTap,
      required this.titleText,
      required this.imgPath,
      required this.buttonColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 34),
        height: 52,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imgPath,
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                titleText,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: textColor, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
