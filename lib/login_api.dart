// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:machine_test/models/loginmodel.dart';

// // Define the login function
// Future<String?> loginUser(Loguser loginUser) async {
//   const String url = 'https://api.accounts.vikncodes.com/api/v1/users/login'; // Updated API URL
//   try {
//     print('Initiating login request...');
//     print('Request URL: $url');
//     print('Request body: ${jsonEncode(loginUser.toJson())}');
//     final response = await http
//         .post(
//       Uri.parse(url),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'username': loginUser.username, // Ensure username is passed
//         'password': loginUser.password, // Ensure password is passed
//         'is_mobile': true, // Pass is_mobile as true
//       }),
//     )
//         .timeout(Duration(seconds: 20), onTimeout: () {
//       throw 'The request timed out. Please try again.';
//     });
//     print('Response status code: ${response.statusCode}');
//     print('Response body: ${response.body}');
    
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final Map<String, dynamic> responseData = jsonDecode(response.body);
      
//       // Ensure keys are 'accessToken' and 'userID'
//       if (responseData.containsKey('accessToken') && responseData.containsKey('userID')) {
//         final String accessToken = responseData['accessToken'];
//         final String userID = responseData['userID'];
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('authToken', accessToken);
//         await prefs.setString('userID', userID); // Save user ID
//         print('Login successful. Token and User ID saved.');
//         return accessToken; // Return the access token
//       } else {
//         print('Login failed: Token or User ID not found in response.');
//         return null;
//       }
//     } else if (response.statusCode == 401) {
//       final Map<String, dynamic> errorResponse = jsonDecode(response.body);
//       String errorMessage = errorResponse['message'] ?? 'Invalid credentials.';
//       print('Error: $errorMessage');
//       return null;
//     } else {
//       print('Login failed: Unexpected error. Response status code: ${response.statusCode}');
//       return null;
//     }
//   } catch (e) {
//     print('Error during login: $e');
//     return null;
//   }
// }

// // Get authentication headers to make API requests
// Future<Map<String, String>> getAuthHeaders() async {
//   final prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString('authToken');
//   if (token != null && token.isNotEmpty) {
//     print('Auth token found: $token');
//     return {'Authorization': 'Bearer $token'};
//   } else {
//     print('No auth token found.');
//     return {};
//   }
// }

// // Fetch user profile using the saved auth token
// Future<void> fetchUserProfile() async {
//   try {
//     final headers = await getAuthHeaders();
//     if (headers.isNotEmpty) {
//       final response = await http
//           .get(
//         Uri.parse('https://api.accounts.vikncodes.com/api/v1/user/profile'),
//         headers: headers,
//       )
//           .timeout(Duration(seconds: 20), onTimeout: () {
//         throw 'The request timed out. Please try again.';
//       });
//       if (response.statusCode == 200) {
//         print('Profile data: ${response.body}');
//       } else {
//         print('Failed to fetch profile data: ${response.statusCode}');
//       }
//     } else {
//       print('No auth token found. Please log in.');
//     }
//   } catch (e) {
//     print('Error fetching profile: $e');
//   }
// }
