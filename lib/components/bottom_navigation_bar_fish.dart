import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:io_fish/feed_page/feed_page.dart';
import 'package:io_fish/health_page/health_page.dart';
import 'package:io_fish/tank_detail_page/tank_detail_page.dart';

class BottomNavigationBarFish extends StatefulWidget {
  const BottomNavigationBarFish({super.key});

  @override
  State<BottomNavigationBarFish> createState() =>
      _BottomNavigationBarFishState();
}

class _BottomNavigationBarFishState extends State<BottomNavigationBarFish> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pecera 1'),
      ),
      body: IndexedStack(
        index: index,
        children: const [HealthPage(), TankDetailPage(), FeedPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int newIndex) {
          setState(() {
            index = newIndex;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety), label: "Salud"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.chartLine), label: "Sensores"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.cookieBite), label: "Alimentar"),
        ],
      ),
    );
  }
}
