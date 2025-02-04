import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/features/about_etc/about/about_page.dart';
import 'package:frontend/features/about_etc/about_the_app/view/about_the_app_page_screen.dart';
import 'package:frontend/features/about_etc/feedback/view/feedback_page_screen.dart';
import 'package:frontend/features/about_etc/settings/view/settings_page_screen.dart';
import 'package:frontend/features/about_etc/widgets/date_picker.dart';
import 'package:frontend/features/about_etc/about_the_app/about_the_app_page.dart';
import 'package:frontend/features/about_etc/widgets/dropdown_menu.dart';
import 'package:frontend/utils/constants.dart';
import '../../../authentication/widgets/widgets.dart';
import '../../../about_etc/widgets/widgets.dart';

class Profile extends StatefulWidget {
  
  Profile({super.key});
  

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  

  @override
  Widget build(BuildContext context) {

    

  
    return Scaffold(
      
      backgroundColor: const Color(0xFFE9F7FF),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height:110,
            ),
            

            //button back to login page
            

            
            MaterialButton(onPressed: (){},
            color: kThirdColor,
            child: Icon(
              Icons.camera_alt,
              size: 80,
            ),
            padding: EdgeInsets.all(36),
            shape: CircleBorder(),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)

                    ),
                    
                    child: Column(                      
                      children: [
                        const SizedBox(
                          height: 7,
                            ),
                        ListTile(
                          leading: SvgPicture.asset('assets/svg/aboutIcon.svg',),
                          title: Text("About",style: Theme.of(context).textTheme.headlineMedium,),
                          trailing: IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return About();
                              }));
                            },
                            icon: Icon(Icons.arrow_forward_ios)),
                        ),
                        Divider(color: kThirdColor,thickness: 0.2,indent: 10,endIndent: 10,),
                        ListTile(
                          leading: SvgPicture.asset('assets/svg/feedbackIcon.svg',),
                          title: Text("Feedback",style: Theme.of(context).textTheme.headlineMedium,),
                          trailing: IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return FeedBack();
                              }));
                            },icon: Icon(Icons.arrow_forward_ios)),
                        ),
                        Divider(color: kThirdColor,thickness: 0.2,indent: 10,endIndent: 10,),
                        ListTile(
                          leading: SvgPicture.asset('assets/svg/aboutAppIcon.svg',),
                          title: Text("About the app",style: Theme.of(context).textTheme.headlineMedium,),
                          trailing: IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return AboutTheApp();
                              }));
                            },
                            icon: Icon(Icons.arrow_forward_ios)),
                        ),
                        Divider(color: kThirdColor,thickness: 0.2,indent: 10,endIndent: 10,),
                        ListTile(
                          leading: SvgPicture.asset('assets/svg/settingsIcon.svg',),
                          title: Text("Settings",style: Theme.of(context).textTheme.headlineMedium,),
                          trailing: IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Settings();
                              }));
                            },
                            icon: Icon(Icons.arrow_forward_ios)),
                        ),
                        const SizedBox(
                          height: 7,
                            )

                      ],
                    ),
                  
                    
                    ),
                  ),
            ),
            
                        
            

            //lock icon
            

          ],
          
        ),
      ),
      
      
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item)=>DropdownMenuItem(
    value: item,
    child: Text(
      item,
    ),

  );
}
