import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:io_fish/pages/add_tank_page/add_tank_page.dart';
import 'package:io_fish/pages/home_page/tank_list.dart';
import 'package:io_fish/services/amplify/amplify_bloc.dart';
import 'package:io_fish/services/tank/tank_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IO Fish'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<AmplifyBloc>(context)
                    .add(UserSingoutAmplifyEvent());
              },
              icon: const FaIcon(FontAwesomeIcons.powerOff))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Mis peceras",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          BlocConsumer<AmplifyBloc, AmplifyState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is AmplifySettingSuccessState) {
                return BlocConsumer<TankBloc, TankState>(
                    builder: ((context, state) {
                  if (state is GetTankListSuccessState) {
                    return TankList(tankList: state.tankList);
                  } else if (state is NoTankListFoundState) {
                    return const Center(
                        child: Text(
                            "No se encontraron peceras, intenta agregando una pecera"));
                  }
                  BlocProvider.of<TankBloc>(context).add(GetTankListEvent());
                  return const Center(child: Text("Eale..."));
                }), listener: (context, state) {
                  if (state is GetTankListState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Cargando...")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                  }
                });
              }
              return const Center(child: Text("Cargando..."));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTankPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
