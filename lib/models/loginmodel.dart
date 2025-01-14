// class Loguser {
//   final String username;
//   final String password;

//   Loguser({
//     required this.username,
//     required this.password,
//   });

//   // Convert Loguser instance to JSON
//   Map<String, dynamic> toJson() {
//     print('Converting Loguser to JSON:');
//     print('Username: $username');
//     print('Password: $password');
//     return {
//       'email': username,
//       'password': password,
//     };
//   }

//   // Create Loguser instance from JSON
//   factory Loguser.fromJson(Map<String, dynamic> json) {
//     print('Creating Loguser from JSON:');
//     print('Email: ${json['email']}');
//     print('Password: ${json['password']}');
//     return Loguser(
//       username: json['email'],
//       password: json['password'],
//     );
//   }

//   @override
//   String toString() {
//     return 'Loguser(email: $username, password: $password)';
//   }
// }
