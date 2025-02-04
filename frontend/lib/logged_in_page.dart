import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:frontend/features/plan/plan_main_page/plan_main_page_page.dart';
import 'package:frontend/features/community/community_main_page/community_main_page_page.dart';
import 'package:frontend/features/dashboard/dashboard_main_page/dashboard_main_page_page.dart';
import 'package:frontend/features/progress/progress_main_page/progress_main_page_page.dart';
import 'package:frontend/features/authentication/forgot_password/forgot_password_page.dart';
import 'package:frontend/features/authentication/forgot_password_sent/view/view.dart';
import 'package:frontend/features/authentication/login/login_page.dart';
import 'package:frontend/features/authentication/registration/registration_page.dart';
import 'package:frontend/features/about_etc/about/about_page.dart';
import 'package:frontend/features/about_etc/change_login/view/change_login_page_screen.dart';
import 'package:frontend/features/about_etc/change_password/view/change_password_page_screen.dart';
import 'package:frontend/features/about_etc/profile/view/profile_page_screen.dart';
import 'package:frontend/features/about_etc/settings/view/settings_page_screen.dart';
import 'package:frontend/features/botton_navbar/b_navbar.dart';
import 'features/botton_navbar/b_navbar.dart';
import 'features/bloc/main_bloc/bloc.dart';
import 'features/bloc/main_bloc/event.dart';
import 'features/bloc/main_bloc/state.dart';

class LoggedInPage extends StatelessWidget {
  const LoggedInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => NavigationBloc(),
        child: const NavigationPage(),
      ),
    );
  }
}

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  static final List<Widget> _windowOptions=<Widget>[
    Dashboard(),
    Plan(),
    Progress(),
    Community(),
    About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navbar(),
    );
  }
}