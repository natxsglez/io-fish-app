import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:io_fish/services/sensor/sensor_bloc.dart';

class SensorDetailPage extends StatelessWidget {
  const SensorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modificar valor del sensor"),
      ),
      body: BlocConsumer<SensorBloc, SensorState>(
        builder: (context, state) {
          if (state is GetSensorSuccessState) {
            return Column(
              children: [],
            );
          }
          return Text("Cargando...");
        },
        listener: (context, state) {},
      ),
    );
  }
}
