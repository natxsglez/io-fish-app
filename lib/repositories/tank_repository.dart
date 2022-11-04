import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:io_fish/models/ModelProvider.dart';
import 'package:io_fish/repositories/id_repository.dart';

class TankRepository {
  final _idRepository = IdRepository();
  Future<dynamic> createTank(
      String tankName, String fishType, List<String> sensors) async {
    final authState = await Amplify.Auth.fetchAuthSession(
            options: CognitoSessionOptions(getAWSCredentials: true))
        as CognitoAuthSession;
    final claims = _idRepository.parseJwt(authState.userPoolTokens!.idToken);
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
    final claims = _idRepository.parseJwt(authState.userPoolTokens!.idToken);
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
}
