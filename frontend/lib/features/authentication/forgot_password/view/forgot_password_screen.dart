import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/features/authentication/forgot_password_sent/forgot_password_page.dart';
import 'package:frontend/features/authentication/login/login_page.dart';
import 'package:frontend/utils/constants.dart';
import '../../widgets/widgets.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  //text editing controllers
  final emailController = TextEditingController();

  //send password recover information to email method
  void sendRecoverInformation(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ForgotPasswordSent();
                              }));
  }

  //back to login page method
  void backToLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
                                return LoginPage();
                              }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F7FF),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),

            //button back to login page
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => backToLogin(context),
                    icon: SvgPicture.asset(
                      'assets/svg/backBtn.svg',
                    ),
                  )),
            ),

            const SizedBox(
              height: 33,
            ),

            //lock icon
            SvgPicture.asset('assets/svg/lockLogo.svg'),

            const SizedBox(
              height: 46,
            ),

            Text(
              "Forgot Password",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(
              height: 5,
            ),

            Text("Enter your registered email below to receive",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: kSecondaryTextColor, fontSize: 14.0)),

            Text("password reset instruction",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: kSecondaryTextColor, fontSize: 14.0)),

            const SizedBox(
              height: 46,
            ),

            //Email input
            MyTextField(
                controller: emailController,
                hintText: "Input email adress",
                titleText: "Email adress",
                obscureText: false),

            const SizedBox(
              height: 24,
            ),

            //Login button
            SumbitButton(
              onTap: () => sendRecoverInformation(context),
              titleText: "Send",
            ),
          ],
        ),
      ),
    );
  }
}
