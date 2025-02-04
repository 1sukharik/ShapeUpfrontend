import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/utils/constants.dart';

class MyTextField extends StatefulWidget {
  final controller;
  final String hintText;
  final String titleText;
  final bool obscureText;
  final String? hideImgPath;
  final String? showImgPath;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.titleText,
      required this.obscureText,
      this.hideImgPath,
      this.showImgPath});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.titleText,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: smallBodyTextSize),
              )),
          const SizedBox(
            height: 3,
          ),
          TextField(
            controller: widget.controller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: kBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: kBorderColor),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kSecondaryTextColor),
              suffixIcon:
                  widget.hideImgPath != null && widget.showImgPath != null
                      ? IconButton(
                          onPressed: _toggleObscureText,
                          icon: _obscureText
                              ? SvgPicture.asset(widget.showImgPath!)
                              : SvgPicture.asset(widget.hideImgPath!),
                        )
                      : null,
            ),
          ),
        ],
      ),
    );
  }
}
