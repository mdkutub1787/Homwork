import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter',
      theme: ThemeData(fontFamily: 'Raleway'),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'Flutter App',
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
        ),
        body: const Center(
          child: Text(
            'Hello Flutter',
            style: TextStyle(color: Colors.green, fontSize: 16),
          ),
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.thumb_up,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}