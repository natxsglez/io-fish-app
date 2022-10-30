import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:io_fish/feed_page/feed_page.dart';
import 'package:io_fish/home_page/home_page.dart';
import 'package:io_fish/mqtt/bloc/mqtt_bloc.dart';

void main() {
  runApp(
    //const MyApp()
    MultiBlocProvider(
      providers: [
        BlocProvider<MqttBloc>(create: (BuildContext context) => MqttBloc())
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
    return MaterialApp(
        title: 'Material App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff1F7A8C),
              primary: const Color(0xff1F7A8C),
              secondary: const Color(0xff77D353),
              tertiary: const Color(0xffFF7F11)),
        ),
        home: const HomePage());
  }
}
