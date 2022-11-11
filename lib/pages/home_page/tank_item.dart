import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:io_fish/components/bottom_navigation_bar_fish.dart';
import 'package:io_fish/models/Tank.dart';
import 'package:intl/intl.dart';
import 'package:io_fish/services/sensor/sensor_bloc.dart';

class TankItem extends StatelessWidget {
  final Tank tank;
  TankItem({super.key, required this.tank});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<SensorBloc>(context)
              .add(GetSensorListEvent(tankId: tank.id));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNavigationBarFish(
                        tankId: tank.id,
                      )));
        },
        child: ListTile(
          title: Text(tank.tankName!),
          subtitle: Text(
              "Agregada en ${DateFormat("dd-MMM-yyyy").format(DateTime.parse(tank.addedOn.toString()))}"),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.fish,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
