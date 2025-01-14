import 'package:flutter/material.dart';
import 'package:machine_test/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/avatar.png'), // Replace with your avatar image
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'David Arnold',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'david012@cabzing',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoCard('4.3 ★', '2,211 rides', Icons.star),
                _infoCard('KYC', 'Verified', Icons.verified),
              ],
            ),
            SizedBox(height: 20),
           ElevatedButton.icon(
  onPressed: () {
    // Navigate to the login screen and remove the current ProfilePage from the stack
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  },
  icon: Icon(Icons.logout, color: Colors.red),
  label: Text('Logout', style: TextStyle(color: Colors.red)),
  style: ElevatedButton.styleFrom(
    iconColor: Colors.black,
    disabledBackgroundColor: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    side: BorderSide(color: Colors.red),
  ),
),

            Divider(color: Colors.grey, thickness: 1, height: 30),
            _menuOption('Help', Icons.help_outline),
            _menuOption('FAQ', Icons.question_answer),
            _menuOption('Invite Friends', Icons.group_add),
            _menuOption('Terms of service', Icons.article),
            _menuOption('Privacy Policy', Icons.privacy_tip),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String subtitle, IconData icon) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.lightBlue, size: 30),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _menuOption(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: () {},
    );
  }
}
