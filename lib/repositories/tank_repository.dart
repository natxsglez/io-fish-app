import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:io_fish/models/ModelProvider.dart';

class TankRepository {
  Future<dynamic> createTank(
      String tankName, String fishType, List<String> sensors) async {
    final authState = await Amplify.Auth.fetchAuthSession(
            options: CognitoSessionOptions(getAWSCredentials: true))
        as CognitoAuthSession;
    final claims = _parseJwt(authState.userPoolTokens!.idToken);
    final email = claims['email'] as String;

    final newTank = Tank(
        tankName: tankName,
        fishType: fishType,
        sensors: sensors,
        userID: email,
        addedOn: TemporalDateTime(DateTime.now()));

    try {
      await Amplify.DataStore.save(newTank);
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> getTanksList() async {
    final authState = await Amplify.Auth.fetchAuthSession(
            options: CognitoSessionOptions(getAWSCredentials: true))
        as CognitoAuthSession;
    final claims = _parseJwt(authState.userPoolTokens!.idToken);
    final email = claims['email'] as String;
    try {
      final tanksList =
          Amplify.DataStore.query(Tank.classType, where: Tank.USERID.eq(email));
      return tanksList;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> getTankById(String tankId) async {
    try {
      final tank = await Amplify.DataStore.query(Tank.classType,
          where: Tank.ID.eq(tankId));
      return tank;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> getTankByName(String tankName) async {
    try {
      final tank = await Amplify.DataStore.query(Tank.classType,
          where: Tank.TANKNAME.eq(tankName));
      return tank;
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
