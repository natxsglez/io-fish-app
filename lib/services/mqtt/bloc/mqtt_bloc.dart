import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:typed_data/typed_buffers.dart';
import 'package:io_fish/utils/constants/constants.dart' as constants;

part 'mqtt_event.dart';
part 'mqtt_state.dart';

class MqttBloc extends Bloc<MqttEvent, MqttState> {
  final MqttServerClient client =
      MqttServerClient(constants.clientIdentifier, "");

  MqttBloc() : super(MqttInitialState()) {
    on<ConnectMqttEvent>(_connectMqtt);
    on<SendMessageMqttEvent>(_sendMqttMessage);
  }

  FutureOr<void> _connectMqtt(event, emit) async {
    emit(MqttConnectingState());
    ByteData rootCA = await rootBundle.load("lib/utils/certs/root_ca.pem");
    ByteData deviceCert =
        await rootBundle.load("lib/utils/certs/device_certificate.crt");
    ByteData privateKey = await rootBundle.load("lib/utils/certs/private.key");

    SecurityContext secContext = SecurityContext.defaultContext;
    secContext
      ..setClientAuthoritiesBytes(rootCA.buffer.asUint8List())
      ..useCertificateChainBytes(deviceCert.buffer.asUint8List())
      ..usePrivateKeyBytes(privateKey.buffer.asUint8List());

    client.securityContext = secContext;
    client.logging(on: true);
    client.port = constants.port;
    client.autoReconnect = true;
    client.secure = true;
    client.onConnected = _onConnected;
    client.onDisconnected = _onDisconnected;
    client.pongCallback = _pong;

    final MqttConnectMessage connectedMessage = MqttConnectMessage()
        .withClientIdentifier(constants.uniqueIdentifier)
        .startClean();

    try {
      await client.connect();
      if (client.connectionStatus!.state == MqttConnectionState.connected) {
        emit(MqttConnectedState());
        print("Conectado a AWS c:");
      } else {
        throw "No se pudo conectar a AWS :c";
      }
    } catch (error) {
      print(error);
      emit(MqttErrorState());
    }
  }

  FutureOr<void> _sendMqttMessage(event, emit) async {
    Uint8List data = Uint8List.fromList("FEED FISH NOW".codeUnits);
    Uint8Buffer dataBuffer = Uint8Buffer();
    dataBuffer.addAll(data);
    try {
      client.publishMessage(
          constants.topicName, MqttQos.atMostOnce, dataBuffer);
    } catch (error) {
      print(error);
    }
  }

  void _onConnected() {
    emit(MqttConnectedState());
  }

  void _onDisconnected() {
    emit(MqttDisconnectedState());
  }

  void _pong() {
    print("Haciendo ping-pong xd");
  }
}
