import '../controllers/auth_controller.dart';
import '../shared/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../widgets/widget_form.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  AuthController loginController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String email = "";
  String password = "";

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login '),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: LottieBuilder.network(
              'https://assets5.lottiefiles.com/packages/lf20_XpVCMJTSQt.json',
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Error Loading Animation');
              },
            ),
          ),
          20.height,
          const Text(
            'Login Screen',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          16.height,
          formInput(
            formName: 'Email: ',
            controller: emailController,
            hint: 'Email@example.com',
          ),
          formInput(
            formName: 'Password: ',
            controller: passwordController,
            obsecureText: true,
            hint: 'Enter your password',
          ),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                if (emailController.text.isNotEmpty ||
                    passwordController.text.isNotEmpty) {
                  loginController.login(
                    emailController.text,
                    passwordController.text,
                  );
                } else {
                  Get.snackbar(
                    'Error',
                    'Email atau Password tidak boleh kosong',
                  );
                }
              },
            ),
          ),
          10.height,
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
              child: const Text('Register'),
              onPressed: () {
                Get.to(() => RegisterScreen());
              },
            ),
          ),
        ],
      ),
      // body: Center(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 24.0),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         const Text(
      //           'Login Screen',
      //           style: TextStyle(
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         spaceHeight(),
      //         formInput(
      //           formName: 'Email: ',
      //           controller: emailController,
      //           hint: 'Email@example.com',
      //         ),
      //         formInput(
      //           formName: 'Password: ',
      //           controller: passwordController,
      //           obsecureText: true,
      //           hint: 'Enter your password',
      //         ),
      //         SizedBox(
      //           width: Get.width,
      //           child: ElevatedButton(
      //             child: const Text('Login'),
      //             onPressed: () {
      //               loginController.login(
      //                 emailController.text,
      //                 passwordController.text,
      //               );
      //             },
      //           ),
      //         ),
      //         spaceHeight(height: 10.0),
      //         SizedBox(
      //           width: Get.width,
      //           child: ElevatedButton(
      //             child: const Text('Register'),
      //             onPressed: () {
      //               Get.to(() => RegisterScreen());
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
