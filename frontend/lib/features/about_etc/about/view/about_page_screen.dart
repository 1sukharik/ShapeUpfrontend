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

class About extends StatefulWidget {
  
  About({super.key});
  

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  DateTime? dateTime = null;
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final _dateController = TextEditingController();
  int _selectedIndex=0;
  
  String? value;
  
  final items=['Male','Female'];
  
  
  // void _chooseitem(String? newvalue){
  //   _value=newvalue;
  // }
  

  void _navigationBottomBar(int index){
    setState((){
      _selectedIndex=index;

    });
    

  }
  String getText(){
    if (dateTime==null){
      return 'Choose';
    }else{
      return DateFormat('MM.dd.yyyy').format(dateTime!);
    }
  }


  onTapFunction({required BuildContext context}) async {
   Widget buildDatePicker()=>CupertinoDatePicker(
    onDateTimeChanged: (dateTime)=>setState(() {
        this.dateTime=dateTime;
      }),
    
    mode: CupertinoDatePickerMode.date,
      initialDateTime: dateTime,
      minimumYear: 1900,
      maximumYear:  DateTime.now().year,
      
  );
  
}



  // onTapFunction({required BuildContext context}) async{
  
  //   final newDate=await CupertinoDatePicker(
  //     mode: CupertinoDatePickerMode.date,
  //     initialDateTime: dateTime,
  //     minimumYear: 1900,
  //     maximumYear:  DateTime.now().year,
  //     onDateTimeChanged: (dateTime)=>setState(() {
  //       this.dateTime=dateTime;
  //     })
  //   );

  //   // if (newDate==null) return;
  //   // setState(() {
  //   //   date=newDate;
  //   // });

  // }


  void _changeSelection(String? value){
    setState(() {
      this.value=value;
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
              height: 8,

            ),

            
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
              height: 33,

            ),
            
            MyTextField(
              controller: nameController, 
              hintText: 'Write your name', 
              titleText: 'Name', 
              obscureText: false),
              const SizedBox(
                height: 9,
              ),
            
              Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Sex',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: smallBodyTextSize),
              )),),
          const SizedBox(
            height: 3,
          ),
            MyDropdownMenu(
              
              hint: Text('Choose'),
              onChanged: _changeSelection, 
              value: value, 
              items: items.map(buildMenuItem).toList()),
              const SizedBox(
                height: 9,
              ),
            MyTextField(
              controller: heightController, 
              hintText: 'Write your height', 
              titleText: 'Height', 
              obscureText: false),
              const SizedBox(
                height: 9,
              ),
            MyTextField(
              controller: heightController, 
              hintText: 'Write your weight', 
              titleText: 'Weight', 
              obscureText: false),
              const SizedBox(
                height: 9,
              ),
            MyDatePicker(
              
              
              onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return Container(
                  color: Colors.white,
                  child:SizedBox(
                  height: 300,
                  child: Column(children: [
                    
                    Expanded(child: CupertinoDatePicker(
                
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: dateTime,
                    onDateTimeChanged: (DateTime addSelectedDate) {
                      setState(() {
                        dateTime = addSelectedDate;
                        if (dateTime != null) {
      
                         _dateController
                        ..text = DateFormat('MM.dd.yyyy').format(dateTime!);

    }
                      });
                    },
                  
                )),
                GestureDetector(
                  onTap: (){Navigator.pop(context);},
                  child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 150),
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white, 
                      border: Border.all(color: kButtonColor,width: 2),
                      borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text('Submit',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                  ?.copyWith(color: kButtonColor, fontWeight: FontWeight.w600)),
        ),
      ),
    ),

                      const SizedBox(height: 10),

                  ],)));
              },
            );
            
          },
              controller: _dateController, 
              hintText: 'Choose', 
              titleText: 'Date of birth', 
              obscureText: false)
            

            
                        
            

            //lock icon
            

          ],
          
        ),
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

