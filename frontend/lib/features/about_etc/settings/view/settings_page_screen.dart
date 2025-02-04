import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/features/about_etc/change_login/view/change_login_page_screen.dart';
import 'package:frontend/features/about_etc/change_password/view/change_password_page_screen.dart';
import 'package:frontend/features/about_etc/profile/view/profile_page_screen.dart';
import 'package:frontend/features/about_etc/widgets/date_picker.dart';
import 'package:frontend/features/about_etc/widgets/dropdown_menu.dart';
import 'package:frontend/main.dart';
import 'package:frontend/utils/constants.dart';
import '../../../authentication/widgets/widgets.dart';
import '../../../about_etc/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/secure_storage.dart';
import 'package:frontend/features/authentication/login/login_page.dart';

class Settings extends StatefulWidget {
  
  Settings({super.key});
  

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final weightController = TextEditingController();
  final _dateController = TextEditingController();
  int _selectedIndex=0;
  bool switchValue = true;
  
  
  // void _chooseitem(String? newvalue){
  //   _value=newvalue;
  // }
  Future<void> _logout(BuildContext context) async {
    await SecureStorage.clearAllData();
    Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()),
    // (route) => false, 
  // );
  }
  

  void _navigationBottomBar(int index){
    setState((){
      _selectedIndex=index;

    });

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
              height: 45,
            ),

            Padding(padding: const EdgeInsets.only(left: 25),
              child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                
                children: [
                  Text("Dark mode",style: Theme.of(context).textTheme.headlineMedium,),
                  SizedBox(width: 180),
                  CupertinoSwitch(
                  activeColor: CupertinoColors.activeBlue,
                  trackColor: CupertinoColors.inactiveGray,
                  thumbColor: CupertinoColors.white,
                  value: switchValue, 
                  onChanged: (value) {
                     setState(() {
                        switchValue = value ?? false;
                    });
                  },
                ),
            
                ],
              ),
            ),
            
            ),

            const SizedBox(
              height: 10,
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
                          
                          title: Text("Change password",style: Theme.of(context).textTheme.headlineMedium,),
                          trailing: IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ChPassword();
                              }));
                            },icon: Icon(Icons.arrow_forward_ios)),
                        ),
                        Divider(color: kThirdColor,thickness: 0.2,indent: 10,endIndent: 10,),
                        ListTile(
                          
                          title: Text("Change login",style: Theme.of(context).textTheme.headlineMedium,),
                          trailing: IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ChLogin();
                              }));
                            },icon: Icon(Icons.arrow_forward_ios)),
                        ),
                        
                        const SizedBox(
                          height: 7,
                            )

                      ],
                      
                    ),
                    
                  
                    
                    ),
                  ),
            ),

            const SizedBox(
              height: 40,
            ),
            ClickableText(
                  onTap: () => _logout(context),
                  text: "Log out"),

          ],
          
        ),
      )
    );
  }
}
