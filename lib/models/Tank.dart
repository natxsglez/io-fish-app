/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Tank type in your schema. */
@immutable
class Tank extends Model {
  static const classType = const _TankModelType();
  final String id;
  final String? _tankName;
  final String? _fishType;
  final List<String>? _sensors;
  final TemporalDateTime? _addedOn;
  final String? _userID;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get tankName {
    return _tankName;
  }
  
  String? get fishType {
    return _fishType;
  }
  
  List<String>? get sensors {
    return _sensors;
  }
  
  TemporalDateTime? get addedOn {
    return _addedOn;
  }
  
  String? get userID {
    return _userID;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Tank._internal({required this.id, tankName, fishType, sensors, addedOn, userID, createdAt, updatedAt}): _tankName = tankName, _fishType = fishType, _sensors = sensors, _addedOn = addedOn, _userID = userID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Tank({String? id, String? tankName, String? fishType, List<String>? sensors, TemporalDateTime? addedOn, String? userID}) {
    return Tank._internal(
      id: id == null ? UUID.getUUID() : id,
      tankName: tankName,
      fishType: fishType,
      sensors: sensors != null ? List<String>.unmodifiable(sensors) : sensors,
      addedOn: addedOn,
      userID: userID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Tank &&
      id == other.id &&
      _tankName == other._tankName &&
      _fishType == other._fishType &&
      DeepCollectionEquality().equals(_sensors, other._sensors) &&
      _addedOn == other._addedOn &&
      _userID == other._userID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Tank {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("tankName=" + "$_tankName" + ", ");
    buffer.write("fishType=" + "$_fishType" + ", ");
    buffer.write("sensors=" + (_sensors != null ? _sensors!.toString() : "null") + ", ");
    buffer.write("addedOn=" + (_addedOn != null ? _addedOn!.format() : "null") + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Tank copyWith({String? id, String? tankName, String? fishType, List<String>? sensors, TemporalDateTime? addedOn, String? userID}) {
    return Tank._internal(
      id: id ?? this.id,
      tankName: tankName ?? this.tankName,
      fishType: fishType ?? this.fishType,
      sensors: sensors ?? this.sensors,
      addedOn: addedOn ?? this.addedOn,
      userID: userID ?? this.userID);
  }
  
  Tank.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _tankName = json['tankName'],
      _fishType = json['fishType'],
      _sensors = json['sensors']?.cast<String>(),
      _addedOn = json['addedOn'] != null ? TemporalDateTime.fromString(json['addedOn']) : null,
      _userID = json['userID'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'tankName': _tankName, 'fishType': _fishType, 'sensors': _sensors, 'addedOn': _addedOn?.format(), 'userID': _userID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'tankName': _tankName, 'fishType': _fishType, 'sensors': _sensors, 'addedOn': _addedOn, 'userID': _userID, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TANKNAME = QueryField(fieldName: "tankName");
  static final QueryField FISHTYPE = QueryField(fieldName: "fishType");
  static final QueryField SENSORS = QueryField(fieldName: "sensors");
  static final QueryField ADDEDON = QueryField(fieldName: "addedOn");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Tank";
    modelSchemaDefinition.pluralName = "Tanks";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tank.TANKNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tank.FISHTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tank.SENSORS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tank.ADDEDON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tank.USERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _TankModelType extends ModelType<Tank> {
  const _TankModelType();
  
  @override
  Tank fromJson(Map<String, dynamic> jsonData) {
    return Tank.fromJson(jsonData);
  }
}