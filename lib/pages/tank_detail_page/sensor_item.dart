import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:io_fish/models/Sensor.dart';
import 'package:io_fish/pages/sensor_detail_page/sensor_detail_page.dart';
import 'package:io_fish/pages/sensor_graph_page/sensor_graph_page.dart';
import 'package:io_fish/services/sensor/sensor_bloc.dart';

class SensorItem extends StatelessWidget {
  final Sensor sensor;
  SensorItem({super.key, required this.sensor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<SensorBloc>(context)
              .add(GetSensorByIdEvent(sensorId: sensor.id));
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SensorDetailPage()));
        },
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
