import 'package:flutter/material.dart';
import 'package:homer/books_list.dart';
import 'package:homer/bottom_nav_bar.dart';

void main() {
  runApp(const Homer());
}

class Homer extends StatelessWidget {
  const Homer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: BooksList(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: BottomNavBar(),
      ),
    );
  }
}
