import 'package:flutter/material.dart';
import 'home.dart';
import 'top_places.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  final int _selectedIndex = 0;
  
  final List<Widget> _pages = [
    const Home(),
    const TopPlaces(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
    );
  }
}