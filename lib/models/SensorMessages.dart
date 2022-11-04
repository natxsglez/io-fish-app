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


/** This is an auto generated class representing the SensorMessages type in your schema. */
@immutable
class SensorMessages extends Model {
  static const classType = const _SensorMessagesModelType();
  final String id;
  final double? _fotoresistor;
  final double? _temperature;
  final double? _phIndex;
  final String? _tankID;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  double? get fotoresistor {
    return _fotoresistor;
  }
  
  double? get temperature {
    return _temperature;
  }
  
  double? get phIndex {
    return _phIndex;
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
  
  const SensorMessages._internal({required this.id, fotoresistor, temperature, phIndex, tankID, createdAt, updatedAt}): _fotoresistor = fotoresistor, _temperature = temperature, _phIndex = phIndex, _tankID = tankID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SensorMessages({String? id, double? fotoresistor, double? temperature, double? phIndex, String? tankID}) {
    return SensorMessages._internal(
      id: id == null ? UUID.getUUID() : id,
      fotoresistor: fotoresistor,
      temperature: temperature,
      phIndex: phIndex,
      tankID: tankID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SensorMessages &&
      id == other.id &&
      _fotoresistor == other._fotoresistor &&
      _temperature == other._temperature &&
      _phIndex == other._phIndex &&
      _tankID == other._tankID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SensorMessages {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("fotoresistor=" + (_fotoresistor != null ? _fotoresistor!.toString() : "null") + ", ");
    buffer.write("temperature=" + (_temperature != null ? _temperature!.toString() : "null") + ", ");
    buffer.write("phIndex=" + (_phIndex != null ? _phIndex!.toString() : "null") + ", ");
    buffer.write("tankID=" + "$_tankID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SensorMessages copyWith({String? id, double? fotoresistor, double? temperature, double? phIndex, String? tankID}) {
    return SensorMessages._internal(
      id: id ?? this.id,
      fotoresistor: fotoresistor ?? this.fotoresistor,
      temperature: temperature ?? this.temperature,
      phIndex: phIndex ?? this.phIndex,
      tankID: tankID ?? this.tankID);
  }
  
  SensorMessages.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _fotoresistor = (json['fotoresistor'] as num?)?.toDouble(),
      _temperature = (json['temperature'] as num?)?.toDouble(),
      _phIndex = (json['phIndex'] as num?)?.toDouble(),
      _tankID = json['tankID'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'fotoresistor': _fotoresistor, 'temperature': _temperature, 'phIndex': _phIndex, 'tankID': _tankID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'fotoresistor': _fotoresistor, 'temperature': _temperature, 'phIndex': _phIndex, 'tankID': _tankID, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField FOTORESISTOR = QueryField(fieldName: "fotoresistor");
  static final QueryField TEMPERATURE = QueryField(fieldName: "temperature");
  static final QueryField PHINDEX = QueryField(fieldName: "phIndex");
  static final QueryField TANKID = QueryField(fieldName: "tankID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SensorMessages";
    modelSchemaDefinition.pluralName = "SensorMessages";
    
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
      key: SensorMessages.FOTORESISTOR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SensorMessages.TEMPERATURE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SensorMessages.PHINDEX,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SensorMessages.TANKID,
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

class _SensorMessagesModelType extends ModelType<SensorMessages> {
  const _SensorMessagesModelType();
  
  @override
  SensorMessages fromJson(Map<String, dynamic> jsonData) {
    return SensorMessages.fromJson(jsonData);
  }
}