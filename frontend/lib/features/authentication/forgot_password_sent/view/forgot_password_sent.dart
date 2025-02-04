import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/features/authentication/forgot_password/forgot_password_page.dart';

class ForgotPasswordSent extends StatelessWidget {
  ForgotPasswordSent({super.key});

  void backToForgotPassword(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ForgotPassword();
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
                    onPressed: () => backToForgotPassword(context),
                    icon: SvgPicture.asset(
                      'assets/svg/backBtn.svg',
                    ),
                  )),
            ),

            const SizedBox(
              height: 120,
            ),

            //lock icon
            SvgPicture.asset('assets/svg/letterLogo.svg'),

            const SizedBox(
              height: 26,
            ),

            Text("We have sent a password recover",
                style: Theme.of(context).textTheme.headlineMedium),

            Text("intructions to your email",
                style: Theme.of(context).textTheme.headlineMedium),

            const SizedBox(
              height: 10,
            ),

            Text("Did not recive the email?",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: kSecondaryTextColor, fontSize: 16.0)),

            Text("Check you spam filter or resend",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: kSecondaryTextColor, fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
