import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'package:frontend/features/authentication/forgot_password/forgot_password_page.dart';
import 'package:frontend/features/authentication/registration/registration_page.dart';
import 'package:frontend/logged_in_page.dart';
import 'package:frontend/secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //user forgot password method
  void forgotPassword(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ForgotPassword();
                              }));
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

  //void go to sign up page method
  void signUpRedirect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
                                return RegistrationPage();
                              }));
  }

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        // Здесь должна быть ваша логика аутентификации
        // Заглушка для примера:
        await SecureStorage.saveUserData(
          userId: '123',
          jwtToken: 'fake_jwt_token',
          refreshToken: 'fake_refresh_token',
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoggedInPage()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка входа: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F7FF),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),

              //main title
              Text("Login", style: Theme.of(context).textTheme.headlineLarge),

              const SizedBox(
                height: 80,
              ),

              //Email input
              MyTextField(
                  controller: _emailController,
                  hintText: "Input your username or email",
                  titleText: "Username/Email",
                  obscureText: false),

              const SizedBox(
                height: 9,
              ),

              //Password imput
              MyTextField(
                controller: _passwordController,
                hintText: "Input your password",
                titleText: "Password",
                obscureText: true,
                hideImgPath: 'assets/svg/obscureEyePressed.svg',
                showImgPath: 'assets/svg/obscureEye.svg',
              ),

              const SizedBox(
                height: 25,
              ),

              //Login button
              SumbitButton(
                onTap: () => _login(context),
                titleText: "Login",
              ),

              const SizedBox(
                height: 13,
              ),

              //Forgot password text button
              ClickableText(
                  onTap: () => forgotPassword(context),
                  text: "Forgot Password?"),

              const SizedBox(
                height: 71,
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
                height: 11,
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
                height: 144,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You don’t have an account?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(
                    width: 3,
                  ),
                  ClickableText(
                      onTap: () => signUpRedirect(context), text: "Sign up")
                ],
              )
            ],
          ),
        
        ),
        ),
      ),

    );
  }
}
