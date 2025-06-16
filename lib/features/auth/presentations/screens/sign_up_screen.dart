import 'package:flimsa01mvp/features/auth/controllers/auth_controller.dart';
import 'package:flimsa01mvp/features/auth/presentations/screens/User_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * .10),
                    Container(
                      height: size.height * 0.07,
                      width: size.width * 0.9,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/azlologo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Create Your Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Name field
                    _buildTextField(controller: nameController, hint: 'Name'),
                    const SizedBox(height: 25),

                    // Email field
                    _buildTextField(controller: emailController, hint: 'Email'),
                    const SizedBox(height: 25),

                    // Password field
                    _buildTextField(
                      controller: passwordController,
                      hint: 'Password',
                      obscure: true,
                    ),
                    const SizedBox(height: 25),

                    // Confirm password field
                    _buildTextField(
                      controller: confirmPasswordController,
                      hint: 'Confirm Password',
                      obscure: true,
                    ),
                    const SizedBox(height: 25),

                    // Sign Up Button
                    SizedBox(
                      height: size.height * 0.07,
                      width: size.width * 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          String name = nameController.text.trim();
                          String email = emailController.text.trim();
                          String password = passwordController.text;
                          String confirmPassword =
                              confirmPasswordController.text;

                          if (name.isEmpty ||
                              !RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(name)) {
                            _showMessage(
                              context,
                              'Invalid name: symbols are not allowed.',
                            );
                            return;
                          }

                          if (email.isEmpty ||
                              !RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                              ).hasMatch(email)) {
                            _showMessage(
                              context,
                              'Please enter a valid email.',
                            );
                            return;
                          }

                          if (password.isEmpty) {
                            _showMessage(context, 'Please enter a password.');
                            return;
                          }

                          if (password != confirmPassword) {
                            _showMessage(context, 'Passwords do not match.');
                            return;
                          }

                          // Success
                          _showMessage(context, 'Signing up...');
                          authController.register(
                            name,
                            email,
                            password,
                            confirmPassword,
                          );
                        },

                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            Colors.black,
                          ),
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          shadowColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(82),
                              side: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.white70),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Helper to show snack message
  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Reusable input field
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.black,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
