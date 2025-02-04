import 'dart:ffi';

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
import 'package:frontend/logged_in_page.dart';
import 'package:frontend/secure_storage.dart';
import 'package:frontend/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

// Navigator.push(context, MaterialPageRoute(builder: (context){
//                                 return Profile();
//                               }));


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthCheck(),
    );
  }
}

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SecureStorage.getJwtToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final hasToken = snapshot.data != null && snapshot.data!.isNotEmpty;
        return hasToken ? const LoggedInPage() : LoginPage();
      },
    );
  }
}

