import 'package:flutter/material.dart';
    import 'splash_screen.dart';

    void main() {
      runApp(ActiveSixApp());
    }

    class ActiveSixApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'ActiveSix',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
        );
      }
    }
