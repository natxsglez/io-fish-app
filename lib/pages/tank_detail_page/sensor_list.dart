import 'package:flutter/material.dart';
import 'package:io_fish/models/ModelProvider.dart';
import 'package:io_fish/tank_detail_page/sensor_item.dart';

class SensorList extends StatelessWidget {
  final List<dynamic> sensorList;
  SensorList({super.key, required this.sensorList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: sensorList.length,
          itemBuilder: (BuildContext context, int index) {
            return SensorItem(
              sensor: sensorList[index],
            );
          }),
    );
  }
}
