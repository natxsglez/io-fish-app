import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:io_fish/feed_page/feed_page.dart';
import 'package:io_fish/health_page/health_page.dart';
import 'package:io_fish/models/Sensor.dart';
import 'package:io_fish/sensor_graph_page/sensor_graph_page.dart';
import 'package:io_fish/services/sensor/sensor_bloc.dart';
import 'package:io_fish/tank_detail_page/tank_detail_page.dart';

class BottomNavigationBarFish extends StatefulWidget {
  final String tankId;
  BottomNavigationBarFish({super.key, required this.tankId});

  @override
  State<BottomNavigationBarFish> createState() =>
      _BottomNavigationBarFishState(tankId);
}

class _BottomNavigationBarFishState extends State<BottomNavigationBarFish> {
  final String tankId;
  int index = 1;

  _BottomNavigationBarFishState(this.tankId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pecera 1'),
      ),
      body: IndexedStack(
        index: index,
        children: [
          HealthPage(),
          TankDetailPage(
            tankId: tankId,
          ),
          SensorGraphPage(),
          FeedPage()
        ],
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
              icon: Icon(FontAwesomeIcons.microchip), label: "Sensores"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.chartLine), label: "Gráfica"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.cookieBite), label: "Alimentar"),
        ],
      ),
    );
  }
}
