import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:slackclone/login_page.dart';
import 'package:slackclone/create_workspace.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A154B), // Slack's primary color
        title: SizedBox(
          height: AppBar().preferredSize.height,
          child: Image.asset(
            'assets/logo2.png',
            width: 250,
            height: 0,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateWorkspacePage()));
              },
              child: Text('+ Workspace'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF4A154B), // Slack's primary color
                onPrimary: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('channels').snapshots(),
              builder: (ctx, AsyncSnapshot<QuerySnapshot> channelsSnapshot) {
                if (channelsSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final channelsDocs = channelsSnapshot.data!.docs;
                if (channelsDocs.isEmpty) {
                  return Center(
                    child: Text("You're not currently a member of any workspace"),
                  );
                }
                return ListView.builder(
                  itemCount: channelsDocs.length,
                  itemBuilder: (ctx, index) {
                    // Build the list of channels here
                    return ListTile(
                      title: Text(channelsDocs[index]['name']),
                      // Add onTap action to navigate to channel page
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4A154B), // Slack's primary color
              ),
              child: Image.asset(
                'assets/logo2.png',
                width: 250,
                height: 1,
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to profile page
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to settings page
              },
            ),
          ],
        ),
      ),
    );
  }
}
