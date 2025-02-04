import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/features/about_etc/profile/view/profile_page_screen.dart';
import 'package:frontend/features/plan/plan_main_page/plan_main_page_page.dart';
import 'package:frontend/features/community/community_main_page/community_main_page_page.dart';
import 'package:frontend/features/dashboard/dashboard_main_page/dashboard_main_page_page.dart';
import 'package:frontend/features/progress/progress_main_page/progress_main_page_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/features/about_etc/widgets/date_picker.dart';
import 'package:frontend/features/about_etc/widgets/dropdown_menu.dart';
import 'package:frontend/utils/constants.dart';
import '../authentication/widgets/widgets.dart';
import '../about_etc/widgets/widgets.dart';

class Navbar extends StatefulWidget {
  
  Navbar({super.key});
  

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List<Widget> _windowOptions=<Widget>[
    Dashboard(),
    Plan(),
    Progress(),
    Community(),
    Profile(),

  ];

  int _selectedIndex=0;
  
  

  void _navigationBottomBar(int index){
    setState((){
      _selectedIndex=index;

    });
    

  }
  

  Color? changeIconColorDashboard (int _changeIndex){
    return _changeIndex == 0 ? kButtonColor : Colors.black;
  }

  Color? changeIconColorPlan (int _changeIndex){
    return _changeIndex == 1 ? kButtonColor : Colors.black;
  }

  Color? changeIconColorProgress (int _changeIndex){
    return _changeIndex == 2 ? kButtonColor : Colors.black;
  }

  Color? changeIconColorCommunity (int _changeIndex){
    return _changeIndex == 3 ? kButtonColor : Colors.black;
  }

  Color? changeIconColorProfile (int _changeIndex){
    return _changeIndex == 4 ? kButtonColor : Colors.black;
  }
  
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      backgroundColor: const Color(0xFFE9F7FF),
      body: Center(
        child: _windowOptions.elementAt(_selectedIndex),
      ),
      
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Theme(
        data: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          
          
          
        ),
        child: BottomNavigationBar(
        currentIndex:_selectedIndex, 
        
        onTap: _navigationBottomBar,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        selectedLabelStyle: TextStyle(color: kButtonColor,fontSize: 12,fontWeight: FontWeight.w600),
        selectedItemColor: kButtonColor,
        
        
        
        
        items:[
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/dashboardIcon.svg',color: changeIconColorDashboard(_selectedIndex),),label: 'Dashboard',),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/planIcon.svg',color: changeIconColorPlan(_selectedIndex)),label: 'Plan'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/progressIcon.svg',color: changeIconColorProgress(_selectedIndex)),label:'Progress'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/communityIcon.svg',color: changeIconColorCommunity(_selectedIndex)),label: 'Community'),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/profileIconNoColor.svg',color: changeIconColorProfile(_selectedIndex)),label: 'Profile'),
      ],),
      
      
      
    )
      )
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item)=>DropdownMenuItem(
    value: item,
    child: Text(
      item,
    ),

  );
}
