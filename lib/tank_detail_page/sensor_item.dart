import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_navigation_bar_fish.dart';

class SensorItem extends StatelessWidget {
  final sensorName;
  final lastUpdate;
  SensorItem({super.key, required this.sensorName, required this.lastUpdate});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => {}));
        },
        child: ListTile(
          title: Text(sensorName),
          subtitle: Text("Actualizado el $lastUpdate"),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(
                FontAwesomeIcons.water,
                color: Color(0xff1CC19F),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
