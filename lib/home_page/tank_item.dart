import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:io_fish/components/bottom_navigation_bar_fish.dart';

class TankItem extends StatelessWidget {
  final tankName;
  final addedOn;
  TankItem({super.key, required this.tankName, required this.addedOn});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavigationBarFish()));
        },
        child: ListTile(
          title: Text(tankName),
          subtitle: Text("Agregada en $addedOn"),
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
