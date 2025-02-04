import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/utils/constants.dart';

class MyDropdownMenu extends StatefulWidget {
  
  final Function(String?)? onChanged;
  final String? value;
  
  final List<DropdownMenuItem<String>>? items;
  
  final String? hideImgPath;
  final String? showImgPath;
  final Widget? hint;

  const MyDropdownMenu(
      {super.key,
      
      required this.onChanged,
      required this.hint,
      required this.value,
      required this.items,
      
      this.hideImgPath,
      this.showImgPath});

  @override
  State<MyDropdownMenu> createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  late bool _obscureText;

  

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Container(

              
              
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kThirdColor),
                color: Colors.white,
                ),
              child: DropdownButtonHideUnderline(
                
                child: DropdownButton<String>(

                
              isExpanded: true,
              iconSize: 36,
              hint: widget.hint,
              icon: Icon(Icons.keyboard_arrow_down,color: kThirdColor,),
              value: widget.value,
              items: widget.items, 
              onChanged: widget.onChanged,),)

            ),
      
    );
  }
}
