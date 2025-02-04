import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/features/about_etc/profile/view/profile_page_screen.dart';
import 'package:frontend/features/about_etc/widgets/date_picker.dart';
import 'package:frontend/features/about_etc/widgets/dropdown_menu.dart';
import 'package:frontend/utils/constants.dart';
import '../../../authentication/widgets/widgets.dart';
import '../../../about_etc/widgets/widgets.dart';
import 'package:intl/intl.dart';

class AboutTheApp extends StatefulWidget {
  
  AboutTheApp({super.key});
  

  @override
  State<AboutTheApp> createState() => _AboutTheAppState();
}

class _AboutTheAppState extends State<AboutTheApp> {


  @override
  Widget build(BuildContext context) {

    

  
    return Scaffold(
      
      backgroundColor: const Color(0xFFE9F7FF),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 53,
            ),

            //button back to login page
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Profile();
                              }));
                            },
                    icon: SvgPicture.asset(
                      'assets/svg/backBtn.svg',
                    ),
                  )),
            ),
            const SizedBox(
              height: 8,

            ),
            Text('About the app'),
            ]),
      )
      
      
    );
  }
  
}

