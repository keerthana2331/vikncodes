// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthProvider with ChangeNotifier {
//   String? _user;
//   String? _userId;
//   String? _authToken;
//   bool _isAuthenticated = false;

//   String? get user => _user;
//   bool get isAuthenticated => _isAuthenticated;

//   final String _loginUrl = 'https://api.accounts.vikncodes.com/api/v1/users/login';

//   AuthProvider() {
//     loadUserData();
//   }

//   // Load user data from SharedPreferences
//   Future<void> loadUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     _authToken = prefs.getString('authToken');
//     _userId = prefs.getString('userId');

//     if (_authToken != null && _userId != null) {
//       _isAuthenticated = true;
//       print('User is authenticated');
//     }
//     notifyListeners();
//   }

//   // Validate the user input
//   bool validateInput(String username, String password) {
//     if (username.isEmpty || password.isEmpty) {
//       print('Username or password cannot be empty');
//       return false;
//     }

//     // Add any further validation for username and password if necessary (e.g., format)
//     return true;
//   }

//   // Login functionality
//   Future<bool> login(String username, String password) async {
//     if (!validateInput(username, password)) {
//       return false; // Input validation failed
//     }

//     try {
//       final response = await http.post(
//         Uri.parse(_loginUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'username': username,
//           'password': password,
//           'is_mobile': true,
//         }),
//       ).timeout(Duration(seconds: 20));

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final Map<String, dynamic> responseData = jsonDecode(response.body);

//         // Ensure keys are 'accessToken' and 'userID'
//         if (responseData.containsKey('accessToken') && responseData.containsKey('userID')) {
//           final String accessToken = responseData['accessToken'];
//           final String userId = responseData['userID'];

//           // Save the token and userId in SharedPreferences
//           final prefs = await SharedPreferences.getInstance();
//           await prefs.setString('authToken', accessToken);
//           await prefs.setString('userId', userId);

//           _authToken = accessToken;
//           _userId = userId;
//           _user = username; // Store username as the logged-in user
//           _isAuthenticated = true;

//           notifyListeners(); // Notify listeners to update the UI

//           return true; // Login successful
//         }
//       }
//       return false; // Login failed
//     } catch (e) {
//       print('Error during login: $e');
//       return false; // Error during login
//     }
//   }

//   // Logout functionality
//   void logout() async {
//     _user = null;
//     _authToken = null;
//     _userId = null;
//     _isAuthenticated = false;

//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear(); // Clear stored preferences

//     print('Logged out successfully');
//     notifyListeners();
//   }
// }
