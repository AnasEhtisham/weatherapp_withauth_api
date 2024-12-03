import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      // CustomScrollView allows us to create a scrollable area that supports multiple scrollable widgets
      body: CustomScrollView(
        slivers: [
          // SliverAppBar creates a flexible app bar that can expand and contract with scrolling
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Profile Pic"), // Title shown when app bar is expanded
              background: Image.asset(
                'assets/my pic.jpg', // Background image for app bar
                fit: BoxFit.cover,
              ),
            ),
          ),

          // SliverList with Dismissible ListView items
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                // Dismissible widget allows items to be swiped away (dismissed)
                return Dismissible(
                  key: Key('item_$index'), // Unique key for each dismissible item
                  onDismissed: (direction) {
                    print("Dismissed item $index");
                  },
                  background: Container(color: Colors.red), // Background shown while swiping
                  child: ListTile(
                    title: Text("Swipe to delete $index"),
                    subtitle: Text("This item can be deleted"),
                  ),
                );
              },
              childCount: 5, // Number of items in the dismissible list
            ),
          ),

          // Draggable and DragTarget widgets that interact with each other
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Draggable widget that can be dragged and dropped onto a DragTarget
                  Draggable<String>(
                    data: "Hello",
                    feedback: Material(
                      color: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.blue[300], // Feedback color when dragging
                        child: Text(
                          "Dragging!",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.blue[200], // Default appearance of Draggable
                      child: Text("Drag Me"),
                    ),
                  ),
                  // DragTarget widget to receive dragged data
                  DragTarget<String>(
                    onAccept: (data) {
                      print("Data received: $data");
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        color: Colors.green[200], // Background color of DragTarget
                        child: Text("Drop Here"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // GridView of tiles using SliverGrid, each item responds to taps with InkWell
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              mainAxisSpacing: 10, // Space between rows
              crossAxisSpacing: 10, // Space between columns
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                // InkWell provides a ripple effect when tapped
                return InkWell(
                  onTap: () {
                    print("Tapped on grid item $index");
                  },
                  child: Container(
                    color: Colors.teal[100 * (index % 9)], // Background color of each tile
                    child: Center(
                      child: Text("Grid Item $index"),
                    ),
                  ),
                );
              },
              childCount: 6, // Number of items in the grid
            ),
          ),

          // Stack with Positioned Widgets for overlapping and positioning elements
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(20),
              height: 200,
              color: Colors.grey[300], // Background color of stack container
              child: Stack(
                children: [
                  // Positioned widget places an icon in the top-left corner
                  Positioned(
                    left: 10,
                    top: 10,
                    child: InkResponse(
                      onTap: () => print("Tapped Star Icon"),
                      child: Icon(Icons.star, size: 40, color: Colors.yellow),
                    ),
                  ),
                  // Positioned widget places a profile icon in the bottom-right corner
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: InkWell(
                      onTap: () => print("Tapped on Profile Icon"),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/my pic.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ListView of scrollable tiles using SliverList
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue[100 * (index % 9)], // Background color for avatars
                    child: Text("T$index"),
                  ),
                  title: Text("Scrollable Tile $index"),
                  subtitle: Text("Scrollable ListView item"),
                );
              },
              childCount: 10, // Number of tiles in the scrollable list
            ),
          ),
        ],
      ),
    );
  }
}
