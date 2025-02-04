import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';

class ClickableText extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const ClickableText({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: kButtonColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
