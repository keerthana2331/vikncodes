import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart'; // Ensure DashboardScreen is correctly implemented
import 'signup_screen.dart'; // Ensure SignUpScreen is correctly implemented

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  // API Service to Authenticate User
  Future<void> authenticateUser(String username, String password) async {
    final url = Uri.parse('https://api.accounts.vikncodes.com/api/v1/users/login');
    final payload = {
      'username': username,
      'password': password,
      'is_mobile': true,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(payload),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['data']['access'];
        final userID = data['data']['user_id'];
        final username = data['data']['username'];

        // Save Token and User Details Securely
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setInt('userID', userID);
        await prefs.setString('username', username);

        print('Token and User ID successfully saved in secure storage.');
        
        // Optionally: Print user details as confirmation
        print('User ID: $userID');
        print('Username: $username');
        print('Token: $token');

        // Navigate to Dashboard after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      } else {
        final errorData = json.decode(response.body);
        print('Login failed: $errorData');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    } catch (e) {
      print('Error during API call: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0F172A),
                Color(0xFF1E293B),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Login to your vikn account',
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: _usernameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: const TextStyle(color: Colors.white60),
                        prefixIcon: const Icon(Icons.person_outline, color: Colors.white60),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.white60),
                        prefixIcon: const Icon(Icons.lock_outline, color: Colors.white60),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white60,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => _isLoading = true);
                          // Call the authenticateUser method
                          await authenticateUser(
                            _usernameController.text.trim(),
                            _passwordController.text.trim(),
                          );
                          setState(() => _isLoading = false);
                        }
                      },
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Sign in'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
