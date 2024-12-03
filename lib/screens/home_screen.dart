import 'package:flutter/material.dart';
import 'package:weather_app/services/auth_service.dart';
import 'package:weather_app/screens/login_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/widgets/button.dart';
import '../widgets/chatPage.dart';
import 'channelPage.dart';
import 'profilePage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService auth = AuthService();
  int currentIndex = 0;

  final List<Widget> pages = [
    WeatherScreen(),
    ChatPage(),
    ChannelPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300), // Animation for switching pages
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: "Weather",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chats",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label: "Channels",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          ),
        ],
      ),
      floatingActionButton: (currentIndex == 3)
          ? FloatingActionButton(
        onPressed: () async {
          await auth.signout();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child: const Icon(Icons.logout),
        backgroundColor: Colors.red,
      )
          : null,
    );
  }
}
