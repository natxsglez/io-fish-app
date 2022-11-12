import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:io_fish/pages/home_page/home_page.dart';
import 'package:io_fish/services/amplify/amplify_bloc.dart';
import 'package:io_fish/services/mqtt/mqtt_bloc.dart';
import 'package:io_fish/services/sensor/sensor_bloc.dart';
import 'package:io_fish/services/tank/tank_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MqttBloc>(create: (BuildContext context) => MqttBloc()),
        BlocProvider<AmplifyBloc>(
            create: (BuildContext context) => AmplifyBloc()),
        BlocProvider<TankBloc>(create: (BuildContext context) => TankBloc()),
        BlocProvider<SensorBloc>(create: (BuildContext context) => SensorBloc())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MqttBloc>(context).add(ConnectMqttEvent());
    BlocProvider.of<AmplifyBloc>(context).add(ConfigureAmplifyEvent());
    return Authenticator(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: Authenticator.builder(),
          supportedLocales: const [
            Locale('es'), // Spanish
          ],
          title: 'IO Fish',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xff1F7A8C),
                primary: const Color(0xff1F7A8C),
                secondary: const Color(0xff77D353),
                tertiary: const Color(0xffFF7F11)),
          ),
          home: const HomePage()),
    );
  }
}
