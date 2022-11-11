import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:io_fish/models/Sensor.dart';
import 'package:io_fish/pages/sensor_graph_page/sensor_graph_page.dart';

class SensorItem extends StatelessWidget {
  final Sensor sensor;
  SensorItem({super.key, required this.sensor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        /*onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SensorGraphPage()));
        },*/
        child: ListTile(
          title: Text(sensor.sensorType!),
          subtitle: Text("Actualizado el ${sensor.lastUpdated}"),
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
