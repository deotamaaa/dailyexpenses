import 'package:dailyexpenses/controllers/auth_controller.dart';
import 'package:dailyexpenses/utils/spacers.dart';
import 'package:dailyexpenses/views/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  AuthController loginController = Get.put(AuthController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String name = "";
  String email = "";
  String password = "";

  RegisterScreen({super.key});

  @override
  OutlineInputBorder _outlineBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 1),
    borderRadius: BorderRadius.circular(12.0),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create fin track account!",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    constraints: BoxConstraints(maxWidth: 310),
                    child: Text(
                      "Unlock all the features to manage income expenses and goals",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      enabledBorder: _outlineBorder,
                      focusedBorder: _outlineBorder,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      enabledBorder: _outlineBorder,
                      focusedBorder: _outlineBorder,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      enabledBorder: _outlineBorder,
                      focusedBorder: _outlineBorder,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffFF6600),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Or sign up with",
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logos/facebook.png',
                  height: 40.0,
                  width: 40.0,
                ),
                const SizedBox(width: 10.0),
                SvgPicture.asset(
                  'assets/logos/google.svg',
                  height: 34.0,
                  width: 34.0,
                ),
                const SizedBox(width: 10.0),
                SvgPicture.asset(
                  'assets/logos/twitter.svg',
                  height: 34.0,
                  width: 34.0,
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: "Sign In",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFF6600),
                            ),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle the click event here
                              Get.to(() => LoginScreen());
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    constraints: BoxConstraints(maxWidth: 264),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "By signing up, you agree to fin track ",
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: "Term of Service",
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFF6600),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: " & ",
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFF6600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
