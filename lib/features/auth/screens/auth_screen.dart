import 'package:amazon_clone_flutter/common/widgets/custom_button.dart';
import 'package:amazon_clone_flutter/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:amazon_clone_flutter/features/auth/services/auth_service.dart';
import 'package:amazon_clone_flutter/widgets/custom_text.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final signUpKey = GlobalKey<FormState>();
  final signInKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  Auth auth = Auth.signup;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signupUser() {
    authService.signupUser(
      context: context,
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  void signinUser() {
    authService.signinUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Welcome",
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
            ListTile(
              tileColor: auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const CustomText(
                text: "Create Account",
                fontWeight: FontWeight.bold,
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: auth,
                onChanged: (Auth? val) {
                  setState(() {
                    auth = val!;
                  });
                },
              ),
            ),
            if (auth == Auth.signup)
              Form(
                key: signUpKey,
                child: Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  color: GlobalVariables.backgroundColor,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        hintText: "Name",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          text: "Sign Up",
                          onTap: () {
                            if (signUpKey.currentState!.validate()) {
                              signupUser();
                            }
                          })
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const CustomText(
                text: "Sign In",
                fontWeight: FontWeight.bold,
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: auth,
                onChanged: (Auth? val) {
                  setState(() {
                    auth = val!;
                  });
                },
              ),
            ),
            if (auth == Auth.signin)
              Form(
                key: signInKey,
                child: Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  color: GlobalVariables.backgroundColor,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          text: "Sign In",
                          onTap: () {
                            if (signInKey.currentState!.validate()) {
                              signinUser();
                            }
                          })
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
