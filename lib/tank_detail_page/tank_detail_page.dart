import 'package:flutter/material.dart';
import 'package:io_fish/add_sensor_page/add_sensor_page.dart';
import 'package:io_fish/tank_detail_page/sensor_list.dart';

class TankDetailPage extends StatelessWidget {
  const TankDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Mis sensores",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SensorList()
        ],
      ),
      Container(
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddSensorPage()));
          },
          backgroundColor: Color(0xffFF7F11),
          child: const Icon(Icons.add),
        ),
      )
    ]);
  }
}
