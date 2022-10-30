import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:io_fish/components/bottom_navigation_bar_fish.dart';
import 'package:io_fish/mqtt/bloc/mqtt_bloc.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            "Alimentar peces",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 8.0),
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<MqttBloc>(context).add(SendMessageMqttEvent());
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Theme.of(context).colorScheme.tertiary),
            child: const Text(
              "ALIMENTAR AHORA",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 8.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xff1CC19F)),
            child: const Text(
              "CONFIGURAR",
              style: TextStyle(fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
