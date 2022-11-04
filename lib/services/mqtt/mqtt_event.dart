part of 'mqtt_bloc.dart';

abstract class MqttEvent {}

class ConnectMqttEvent extends MqttEvent {}

class ReconnectMqttEvent extends MqttEvent {}

class SendMessageMqttEvent extends MqttEvent {}
