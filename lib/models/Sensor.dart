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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Sensor type in your schema. */
@immutable
class Sensor extends Model {
  static const classType = const _SensorModelType();
  final String id;
  final String? _sensorType;
  final double? _max;
  final double? _min;
  final String? _tankID;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get sensorType {
    return _sensorType;
  }
  
  double? get max {
    return _max;
  }
  
  double? get min {
    return _min;
  }
  
  String? get tankID {
    return _tankID;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Sensor._internal({required this.id, sensorType, max, min, tankID, createdAt, updatedAt}): _sensorType = sensorType, _max = max, _min = min, _tankID = tankID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Sensor({String? id, String? sensorType, double? max, double? min, String? tankID}) {
    return Sensor._internal(
      id: id == null ? UUID.getUUID() : id,
      sensorType: sensorType,
      max: max,
      min: min,
      tankID: tankID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Sensor &&
      id == other.id &&
      _sensorType == other._sensorType &&
      _max == other._max &&
      _min == other._min &&
      _tankID == other._tankID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Sensor {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("sensorType=" + "$_sensorType" + ", ");
    buffer.write("max=" + (_max != null ? _max!.toString() : "null") + ", ");
    buffer.write("min=" + (_min != null ? _min!.toString() : "null") + ", ");
    buffer.write("tankID=" + "$_tankID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Sensor copyWith({String? id, String? sensorType, double? max, double? min, String? tankID}) {
    return Sensor._internal(
      id: id ?? this.id,
      sensorType: sensorType ?? this.sensorType,
      max: max ?? this.max,
      min: min ?? this.min,
      tankID: tankID ?? this.tankID);
  }
  
  Sensor.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _sensorType = json['sensorType'],
      _max = (json['max'] as num?)?.toDouble(),
      _min = (json['min'] as num?)?.toDouble(),
      _tankID = json['tankID'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'sensorType': _sensorType, 'max': _max, 'min': _min, 'tankID': _tankID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'sensorType': _sensorType, 'max': _max, 'min': _min, 'tankID': _tankID, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField SENSORTYPE = QueryField(fieldName: "sensorType");
  static final QueryField MAX = QueryField(fieldName: "max");
  static final QueryField MIN = QueryField(fieldName: "min");
  static final QueryField TANKID = QueryField(fieldName: "tankID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Sensor";
    modelSchemaDefinition.pluralName = "Sensors";
    
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
      key: Sensor.SENSORTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Sensor.MAX,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Sensor.MIN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Sensor.TANKID,
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

class _SensorModelType extends ModelType<Sensor> {
  const _SensorModelType();
  
  @override
  Sensor fromJson(Map<String, dynamic> jsonData) {
    return Sensor.fromJson(jsonData);
  }
}