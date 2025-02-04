import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/features/about_etc/settings/view/settings_page_screen.dart';
import 'package:frontend/features/about_etc/widgets/date_picker.dart';
import 'package:frontend/features/about_etc/widgets/dropdown_menu.dart';
import 'package:frontend/utils/constants.dart';
import '../../../authentication/widgets/widgets.dart';
import '../../../about_etc/widgets/widgets.dart';

class ChPassword extends StatefulWidget {
  
  ChPassword({super.key});
  

  @override
  State<ChPassword> createState() => _ChPasswordState();
}

class _ChPasswordState extends State<ChPassword> {
  final oldpassController = TextEditingController();
  final newpassController = TextEditingController();

  
  
  
  



  void changePassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("Logged in"),
      ),
    );
  }
  
  
  

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
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Settings();
                              }));
                            },
                    icon: SvgPicture.asset(
                      'assets/svg/backBtn.svg',
                    ),
                  )),
            ),
            const SizedBox(
              height: 49,

            ),
            MyTextField(
              controller: oldpassController, 
              hintText: 'Old password', 
              titleText: 'Write your old password', 
              obscureText: false),
            const SizedBox(
                height: 9,
              ),



            MyTextField(
              controller: oldpassController, 
              hintText: 'New password', 
              titleText: 'Write your new password', 
              obscureText: false),

            const SizedBox(
                height: 47,
              ),
            SumbitButton(
              onTap: () => changePassword(context),
              titleText: "Change",
            ),
            

            //button back to login page
            

            
            
            
            
                        
            

            //lock icon
            

          ],
          
        ),
      ),
      
      
      
      
    );
  }
  
}
