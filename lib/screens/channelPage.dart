import 'package:flutter/material.dart';
import '../widgets/chatPage.dart'; // Import your ChatPage
import 'profilePage.dart'; // Import your ProfilePage

class ChannelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Channels"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Profile picture tapped");
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/bbc.jpg'),
                      radius: 30,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BBC News",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "A channel for Fake News",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to ChatPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatPage()),
                      );
                    },
                    child: Column(
                      children: [
                        Icon(Icons.chat, color: Colors.blue),
                        SizedBox(height: 8),
                        Text("Chat", style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () => print("Long press on Share"),
                    child: Column(
                      children: [
                        Icon(Icons.share, color: Colors.green),
                        SizedBox(height: 8),
                        Text("Share", style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onDoubleTap: () {
                      // Navigate to ProfilePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    child: Column(
                      children: [
                        Icon(Icons.info, color: Colors.red),
                        SizedBox(height: 8),
                        Text("Info", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              Text(
                "Trending Topics",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () => print("Tapped on Trending Topic chip"),
                    child: Chip(
                      label: Text("Politics"),
                      backgroundColor: Colors.blue[100],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("Tapped on Politics chip"),
                    child: Chip(
                      label: Text("Sports"),
                      backgroundColor: Colors.red[100],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("Tapped on Sports chip"),
                    child: Chip(
                      label: Text("Technology"),
                      backgroundColor: Colors.green[100],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("Tapped on technology chip"),
                    child: Chip(
                      label: Text("Entertainment"),
                      backgroundColor: Colors.purple[100],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              Text(
                "Haqeeqat tv Articles",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () => print("Tap on it $index"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/htv.jpg'),
                            radius: 25,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Article ${index + 1}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Haqeeqat tv article ${index + 1}",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
