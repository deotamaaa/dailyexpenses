import 'package:dailyexpenses/src/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../shared/extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ReactiveForm(
        formGroup: authController.authForm,
        child: ListView(
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
            ReactiveTextField(
              formControlName: 'email',
              validationMessages: {
                'required': (error) => 'Field wajib diisi',
                'email': (error) => 'Email tidak valid',
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            16.height,
            ReactiveTextField(
              formControlName: 'password',
              validationMessages: {
                'required': (error) => 'Field wajib diisi',
                'minLength': (error) => 'Password minimal 6 karakter',
                'maxLength': (error) => 'Password maksimal 20 karakter',
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            20.height,
            SizedBox(
              width: Get.width,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Get.to(() => RegisterScreen());
                },
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
