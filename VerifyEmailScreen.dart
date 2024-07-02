import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/colors.dart';
import 'AuthController/auth_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  final AuthController authController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/open-email.png', height: 150),
              const SizedBox(height: 20),
              const Text(
                'Verify your email address!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: AppColors.PrimaryColors),
              ),
              const SizedBox(height: 10),
              Text(
                FirebaseAuth.instance.currentUser?.email ?? '',
                style: const TextStyle(fontSize: 14,
                color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const Text(
                'Congratulations! Your account is ready. Verify your email to begin your Uniconnect experience.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.PrimaryColors,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 50),
                  textStyle: const TextStyle(fontSize: 18, color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.currentUser?.reload();
                  if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
                    Get.offAllNamed('/home');
                  } else {
                    Get.snackbar('Error', 'Please verify your email before continuing.',
                      snackPosition: SnackPosition.TOP,
                      duration: const Duration(seconds: 5),
                      backgroundGradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.greenAccent,
                          AppColors.PrimaryColors,
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Continue',style: TextStyle(
                  color: Colors.white
                ),),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => authController.sendEmailVerification(),
                child: const Text('Resend Email',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.PrimaryColors
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
