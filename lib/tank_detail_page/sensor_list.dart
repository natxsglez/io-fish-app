import 'package:flutter/material.dart';
import 'package:io_fish/tank_detail_page/sensor_item.dart';

class SensorList extends StatelessWidget {
  final List<dynamic> sensorList = [
    {"sensorName": "pH", "lastUpdate": "11-08-21"},
    {"sensorName": "Temperatura", "lastUpdate": "11-08-21"},
    {"sensorName": "Sólidos disueltos", "lastUpdate": "11-08-21"}
  ];
  SensorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: sensorList.length,
          itemBuilder: (BuildContext context, int index) {
            return SensorItem(
              sensorName: sensorList[index]["sensorName"],
              lastUpdate: sensorList[index]["lastUpdate"],
            );
          }),
    );
  }
}
