import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('ActiveSix..', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            ListTile(
              title: Text('Menu Item 1', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: Text('Menu Item 2', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Register Section with background
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background_main_screen.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Join the Championship League starting this weekend!',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Register Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: StadiumBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              
              // Match Result Section with background
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background_match_result.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black.withOpacity(0.6), // Semi-transparent overlay
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'TODAY\'S MATCH RESULT',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/blazing_falcons_logo.png', width: 50),
                        SizedBox(width: 8),
                        Text(
                          '2 - 0',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Image.asset('assets/shadow_strikers_logo.png', width: 50),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Create Team Section with background
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background_create_team.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black.withOpacity(0.6), // Semi-transparent overlay
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'CREATE YOUR TEAM',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Start your own team and invite friends to join your journey.',
                      style: TextStyle(color: Colors.white54),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Create Team'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: StadiumBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Existing Teams Section with background
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background_existing_teams.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'JOIN EXISTING TEAM',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    TeamRow(teamName: 'BLAZING FALCONS', points: 4000, wins: 11),
                    TeamRow(teamName: 'COBALT CRUSHERS', points: 2500, wins: 8),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {},
                      child: Text('View All'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Coming Match Section with background
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background_coming_match.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'COMING MATCH',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/blazing_falcons_logo.png', width: 50),
                        SizedBox(width: 8),
                        Text(
                          'Football Match | 8:00 AM',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 8),
                        Image.asset('assets/shadow_strikers_logo.png', width: 50),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Stadium Name',
                      style: TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Teams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}

class TeamRow extends StatelessWidget {
  final String teamName;
  final int points;
  final int wins;

  TeamRow({
    required this.teamName,
    required this.points,
    required this.wins,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          teamName,
          style: TextStyle(color: Colors.white),
        ),
        Row(
          children: [
            Text(
              '$points pts',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 8),
            Text(
              '$wins wins',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
