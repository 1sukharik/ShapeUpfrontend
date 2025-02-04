import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'package:frontend/features/authentication/login/login_page.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  //text editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  //sign user up method
  void signUserUp(BuildContext context) async {
    if (passwordController.text != passwordConfirmController.text) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
                  "Some error occured. Check your internet connection, or restart the app"),
        ),
      );
  }

  //google authentication method
  void googleAuth(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("Google auth52"),
      ),
    );
  }

  //apple authentication method
  void appleAuth(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("Apple auth"),
      ),
    );
  }

  //void go to login(sign in) page method
  void loginRedirect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
                                return LoginPage();
                              }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F7FF),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),

              //main title
              Text("Sign Up", style: Theme.of(context).textTheme.headlineLarge),

              const SizedBox(
                height: 40,
              ),

              //UserName input
              MyTextField(
                  controller: nameController,
                  hintText: "Input your username",
                  titleText: "Your username",
                  obscureText: false),

              const SizedBox(
                height: 9,
              ),

              //Email input
              MyTextField(
                  controller: emailController,
                  hintText: "Input your email",
                  titleText: "Email adress",
                  obscureText: false),

              const SizedBox(
                height: 9,
              ),

              //Password imput
              MyTextField(
                controller: passwordController,
                hintText: "Input your password",
                titleText: "Password",
                obscureText: true,
                hideImgPath: 'assets/svg/obscureEyePressed.svg',
                showImgPath: 'assets/svg/obscureEye.svg',
              ),

              const SizedBox(
                height: 9,
              ),

              //Password Confirm imput
              MyTextField(
                controller: passwordConfirmController,
                hintText: "Input your password",
                titleText: "Confirm your password",
                obscureText: true,
                hideImgPath: 'assets/svg/obscureEyePressed.svg',
                showImgPath: 'assets/svg/obscureEye.svg',
              ),

              const SizedBox(
                height: 25,
              ),

              //Sign Up button
              SumbitButton(
                onTap: () => signUserUp(context),
                titleText: "Sign up",
              ),

              const SizedBox(
                height: 60,
              ),

              //Google authentication way
              AnotherAuthButton(
                onTap: () => googleAuth(context),
                titleText: "Continue with Google",
                imgPath: 'assets/svg/googleLogo.svg',
                buttonColor: Colors.white,
                textColor: Colors.black,
              ),

              const SizedBox(
                height: 9,
              ),

              //Apple authentication way
              AnotherAuthButton(
                onTap: () => appleAuth(context),
                titleText: "Continue with Apple",
                imgPath: 'assets/svg/appleLogo.svg',
                buttonColor: Colors.black,
                textColor: Colors.white,
              ),

              const SizedBox(
                height: 83,
              ),

              //go to login page clickable text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(
                    width: 3,
                  ),
                  ClickableText(
                      onTap: () => loginRedirect(context), text: "Sign in")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
