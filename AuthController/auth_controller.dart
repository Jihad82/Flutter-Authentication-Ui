import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uniconnect/utils/colors.dart';
import 'dart:io';
import '../models/user_model.dart';

class AuthController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullNameController = TextEditingController();
  var studentIdController = TextEditingController();
  var departmentNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var errorMessage = ''.obs;
  final box = GetStorage();
  var imageUrl = ''.obs;
  var isLoading = false.obs;
  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(FirebaseAuth.instance.authStateChanges());
  }

  void checkAuthStatus() {
    if (FirebaseAuth.instance.currentUser != null) {
      Get.offAllNamed('/home');
    } else if (box.read('email') != null && box.read('password') != null) {
      emailController.text = box.read('email');
      passwordController.text = box.read('password');
      login();
    } else {
      Get.offAllNamed('/login');
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(), // Corrected passwordController instead of emailController
      );

      if (!userCredential.user!.emailVerified) {
        await FirebaseAuth.instance.signOut();
        _showSnackbar('Error', 'Please verify your email before logging in.');
      } else {
        box.write('email', emailController.text.trim());
        box.write('password', passwordController.text.trim()); // Corrected passwordController instead of emailController

        _showSnackbar('Success', 'Login successful');
        Get.offAllNamed('/home');
      }
    } catch (e) {
      errorMessage.value = e.toString();
      _showSnackbar('Error', 'Login failed. Please try again');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp() async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      UserModel newUser = UserModel(
        fullName: fullNameController.text.trim(),
        studentId: studentIdController.text.trim(),
        departmentName: departmentNameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        gender: '',
        dateOfBirth: '',
        profilePictureUrl: '',
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set(newUser.toMap());

      await sendEmailVerification();

      Get.offAllNamed('/verify-email');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showSnackbar('Error', 'The email address is already in use.');
      } else {
        _showSnackbar('Error', 'Sign up failed. Please try again.');
        print(e);
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
      _showSnackbar('Success', 'Verification email sent. Please check your email.');
    } catch (e) {
      _showSnackbar('Error', 'Failed to send verification email.');
    }
  }

  Future<void> uploadProfilePicture(List<File> files) async {
    try {
      isLoading.value = true;
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      List<String> downloadUrls = [];

      for (var file in files) {
        String fileName = '$userId/${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}';
        Reference storageRef = FirebaseStorage.instance.ref().child('profile_pictures/$fileName');
        UploadTask uploadTask = storageRef.putFile(file);
        TaskSnapshot taskSnapshot = await uploadTask;
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        downloadUrls.add(downloadUrl);
      }

      imageUrl.value = downloadUrls.last;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'profilePictureUrl': imageUrl.value});

      _showSnackbar('Success', 'Profile pictures uploaded successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      box.erase();
      _showSnackbar('Success', 'Sign out successfully');
      Get.offAllNamed('/login');
    } catch (e) {
      _showSnackbar('Error', 'Sign out failed. Please try again.');
    }
  }

  Future<void> resetPassword() async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      _showSnackbar('Success', 'Password reset email sent. Check your inbox.');
    } on FirebaseAuthException catch (e) {
      _showSnackbar('Error','Enter your email to reset your password');
    } finally {
      isLoading.value = false;
    }
  }

  void _showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      animationDuration: const Duration(milliseconds: 300),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
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
}
