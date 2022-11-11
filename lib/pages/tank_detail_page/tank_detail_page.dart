import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:io_fish/pages/add_sensor_page/add_sensor_page.dart';
import 'package:io_fish/services/sensor/sensor_bloc.dart';
import 'package:io_fish/pages/tank_detail_page/sensor_list.dart';

class TankDetailPage extends StatelessWidget {
  final String tankId;
  const TankDetailPage({super.key, required this.tankId});

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
          BlocConsumer<SensorBloc, SensorState>(
            listener: (context, state) {
              if (state is SensorInitialState) {
              } else if (state is GetSensorListState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cargando...")),
                );
              } else {
                ScaffoldMessenger.of(context).clearSnackBars();
              }
            },
            builder: (context, state) {
              if (state is GetSensorListSuccessState) {
                return SensorList(sensorList: state.sensorList);
              } else if (state is NoSensorListFoundState) {
                return const Center(
                    child: Text(
                        "No se encontraron peceras, intenta agregando una pecera"));
              }
              return const Center(child: Text("Eale..."));
            },
          )
        ],
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddSensorPage()));
          },
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          child: const Icon(Icons.add),
        ),
      )
    ]);
  }
}
