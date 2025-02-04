import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';

class SumbitButton extends StatelessWidget {
  final Function()? onTap;
  final String titleText;

  const SumbitButton({super.key, required this.onTap, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 34),
        height: 52,
        decoration: BoxDecoration(
            color: kButtonColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(titleText,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
