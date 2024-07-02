import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uniconnect/AuthService/signup_screen.dart';
import 'package:uniconnect/utils/colors.dart';
import 'AuthController/auth_controller.dart';
import 'ForgotPasswordScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.put(AuthController());
  bool _isObscure = true; // State variable to toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return authController.isLoading.value
            ? const Center(child: CircularProgressIndicator(
          color: AppColors.PrimaryColors,
        ))
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                // Image
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Uniconnect_Logo-removebg-preview.png', // Add your image asset here
                          height: 120,
                        ),
                        const SizedBox(height: 0), // Ensure no extra space
                        const Text(
                          'UNI CONNECT',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: AppColors.PrimaryColors),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Greeting Text
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hey there,',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 5),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Email TextField
                TextField(
                  controller: authController.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.PrimaryColors),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Password TextField
                TextField(
                  controller: authController.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.PrimaryColors),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: _isObscure, // Toggle password visibility
                ),
                const SizedBox(height: 10),
                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => ForgetPasswordScreen()); // Navigate to ForgetPasswordScreen
                    },
                    child: const Text(
                      'Forgot your password?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    authController.login();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.PrimaryColors,
                    padding:
                    const EdgeInsets.symmetric(vertical: 15), // Adjust vertical padding
                    minimumSize: const Size(double.infinity, 50),
                    textStyle: const TextStyle(
                        fontSize: 18, color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Adjust the radius as per your requirement
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                // Logo and Register
                Column(
                  children: [
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Get.to(SignUpScreen());
                      },
                      child: const Text(
                        "Don't have an account yet? Register",
                        style: TextStyle(
                          color: AppColors.PrimaryColors,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      }),
    );
  }
}
