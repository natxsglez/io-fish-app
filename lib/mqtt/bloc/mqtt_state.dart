part of 'mqtt_bloc.dart';

abstract class MqttState extends Equatable {
  const MqttState();

  @override
  List<Object> get props => [];
}

class MqttInitialState extends MqttState {}

class MqttConnectingState extends MqttState {}

class MqttConnectedState extends MqttState {}

class MqttDisconnectedState extends MqttState {}

class MqttErrorState extends MqttState {}
