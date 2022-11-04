import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:io_fish/models/ModelProvider.dart';

class SensorRepository {
  Future<dynamic> getSensorsList(String tankId) async {
    try {
      final sensorsList = await Amplify.DataStore.query(Sensor.classType,
          where: Sensor.TANKID.eq(tankId));
      return sensorsList;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> createNewSensor(String tankId, String sensorType) async {
    final newSensor =
        Sensor(sensorType: sensorType, tankID: tankId, max: 16, min: 16);
    try {
      await Amplify.DataStore.save(newSensor);
    } catch (error) {
      throw error;
    }
  }

  Map<String, dynamic> _parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
