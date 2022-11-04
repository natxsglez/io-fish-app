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
}
