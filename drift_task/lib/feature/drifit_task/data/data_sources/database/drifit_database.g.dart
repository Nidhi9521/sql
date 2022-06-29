// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drifit_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Audit extends DataClass implements Insertable<Audit> {
  final int? AuditEntityId;
  final int? AuditId;
  final String? AuditEntityName;
  final int? AuditEntityTypeId;
  final int? AuditParentEntityId;
  final int? SequenceNo;
  final String? EntityEndDate;
  final bool? IsLeafNode;
  final String? BarcodeNFC;
  final int? EntityLevel;
  final bool? EntityException;
  final String? ScheduleOccurrenceIds;
  Audit(
      {this.AuditEntityId,
      this.AuditId,
      this.AuditEntityName,
      this.AuditEntityTypeId,
      this.AuditParentEntityId,
      this.SequenceNo,
      this.EntityEndDate,
      this.IsLeafNode,
      this.BarcodeNFC,
      this.EntityLevel,
      this.EntityException,
      this.ScheduleOccurrenceIds});
  factory Audit.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Audit(
      AuditEntityId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}audit_entity_id']),
      AuditId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}audit_id']),
      AuditEntityName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}audit_entity_name']),
      AuditEntityTypeId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}audit_entity_type_id']),
      AuditParentEntityId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}audit_parent_entity_id']),
      SequenceNo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sequence_no']),
      EntityEndDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}entity_end_date']),
      IsLeafNode: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_leaf_node']),
      BarcodeNFC: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}barcode_n_f_c']),
      EntityLevel: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}entity_level']),
      EntityException: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}entity_exception']),
      ScheduleOccurrenceIds: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}schedule_occurrence_ids']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || AuditEntityId != null) {
      map['audit_entity_id'] = Variable<int?>(AuditEntityId);
    }
    if (!nullToAbsent || AuditId != null) {
      map['audit_id'] = Variable<int?>(AuditId);
    }
    if (!nullToAbsent || AuditEntityName != null) {
      map['audit_entity_name'] = Variable<String?>(AuditEntityName);
    }
    if (!nullToAbsent || AuditEntityTypeId != null) {
      map['audit_entity_type_id'] = Variable<int?>(AuditEntityTypeId);
    }
    if (!nullToAbsent || AuditParentEntityId != null) {
      map['audit_parent_entity_id'] = Variable<int?>(AuditParentEntityId);
    }
    if (!nullToAbsent || SequenceNo != null) {
      map['sequence_no'] = Variable<int?>(SequenceNo);
    }
    if (!nullToAbsent || EntityEndDate != null) {
      map['entity_end_date'] = Variable<String?>(EntityEndDate);
    }
    if (!nullToAbsent || IsLeafNode != null) {
      map['is_leaf_node'] = Variable<bool?>(IsLeafNode);
    }
    if (!nullToAbsent || BarcodeNFC != null) {
      map['barcode_n_f_c'] = Variable<String?>(BarcodeNFC);
    }
    if (!nullToAbsent || EntityLevel != null) {
      map['entity_level'] = Variable<int?>(EntityLevel);
    }
    if (!nullToAbsent || EntityException != null) {
      map['entity_exception'] = Variable<bool?>(EntityException);
    }
    if (!nullToAbsent || ScheduleOccurrenceIds != null) {
      map['schedule_occurrence_ids'] = Variable<String?>(ScheduleOccurrenceIds);
    }
    return map;
  }

  AuditTableCompanion toCompanion(bool nullToAbsent) {
    return AuditTableCompanion(
      AuditEntityId: AuditEntityId == null && nullToAbsent
          ? const Value.absent()
          : Value(AuditEntityId),
      AuditId: AuditId == null && nullToAbsent
          ? const Value.absent()
          : Value(AuditId),
      AuditEntityName: AuditEntityName == null && nullToAbsent
          ? const Value.absent()
          : Value(AuditEntityName),
      AuditEntityTypeId: AuditEntityTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(AuditEntityTypeId),
      AuditParentEntityId: AuditParentEntityId == null && nullToAbsent
          ? const Value.absent()
          : Value(AuditParentEntityId),
      SequenceNo: SequenceNo == null && nullToAbsent
          ? const Value.absent()
          : Value(SequenceNo),
      EntityEndDate: EntityEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(EntityEndDate),
      IsLeafNode: IsLeafNode == null && nullToAbsent
          ? const Value.absent()
          : Value(IsLeafNode),
      BarcodeNFC: BarcodeNFC == null && nullToAbsent
          ? const Value.absent()
          : Value(BarcodeNFC),
      EntityLevel: EntityLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(EntityLevel),
      EntityException: EntityException == null && nullToAbsent
          ? const Value.absent()
          : Value(EntityException),
      ScheduleOccurrenceIds: ScheduleOccurrenceIds == null && nullToAbsent
          ? const Value.absent()
          : Value(ScheduleOccurrenceIds),
    );
  }

  factory Audit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Audit(
      AuditEntityId: serializer.fromJson<int?>(json['AuditEntityId']),
      AuditId: serializer.fromJson<int?>(json['AuditId']),
      AuditEntityName: serializer.fromJson<String?>(json['AuditEntityName']),
      AuditEntityTypeId: serializer.fromJson<int?>(json['AuditEntityTypeId']),
      AuditParentEntityId:
          serializer.fromJson<int?>(json['AuditParentEntityId']),
      SequenceNo: serializer.fromJson<int?>(json['SequenceNo']),
      EntityEndDate: serializer.fromJson<String?>(json['EntityEndDate']),
      IsLeafNode: serializer.fromJson<bool?>(json['IsLeafNode']),
      BarcodeNFC: serializer.fromJson<String?>(json['BarcodeNFC']),
      EntityLevel: serializer.fromJson<int?>(json['EntityLevel']),
      EntityException: serializer.fromJson<bool?>(json['EntityException']),
      ScheduleOccurrenceIds:
          serializer.fromJson<String?>(json['ScheduleOccurrenceIds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'AuditEntityId': serializer.toJson<int?>(AuditEntityId),
      'AuditId': serializer.toJson<int?>(AuditId),
      'AuditEntityName': serializer.toJson<String?>(AuditEntityName),
      'AuditEntityTypeId': serializer.toJson<int?>(AuditEntityTypeId),
      'AuditParentEntityId': serializer.toJson<int?>(AuditParentEntityId),
      'SequenceNo': serializer.toJson<int?>(SequenceNo),
      'EntityEndDate': serializer.toJson<String?>(EntityEndDate),
      'IsLeafNode': serializer.toJson<bool?>(IsLeafNode),
      'BarcodeNFC': serializer.toJson<String?>(BarcodeNFC),
      'EntityLevel': serializer.toJson<int?>(EntityLevel),
      'EntityException': serializer.toJson<bool?>(EntityException),
      'ScheduleOccurrenceIds':
          serializer.toJson<String?>(ScheduleOccurrenceIds),
    };
  }

  Audit copyWith(
          {int? AuditEntityId,
          int? AuditId,
          String? AuditEntityName,
          int? AuditEntityTypeId,
          int? AuditParentEntityId,
          int? SequenceNo,
          String? EntityEndDate,
          bool? IsLeafNode,
          String? BarcodeNFC,
          int? EntityLevel,
          bool? EntityException,
          String? ScheduleOccurrenceIds}) =>
      Audit(
        AuditEntityId: AuditEntityId ?? this.AuditEntityId,
        AuditId: AuditId ?? this.AuditId,
        AuditEntityName: AuditEntityName ?? this.AuditEntityName,
        AuditEntityTypeId: AuditEntityTypeId ?? this.AuditEntityTypeId,
        AuditParentEntityId: AuditParentEntityId ?? this.AuditParentEntityId,
        SequenceNo: SequenceNo ?? this.SequenceNo,
        EntityEndDate: EntityEndDate ?? this.EntityEndDate,
        IsLeafNode: IsLeafNode ?? this.IsLeafNode,
        BarcodeNFC: BarcodeNFC ?? this.BarcodeNFC,
        EntityLevel: EntityLevel ?? this.EntityLevel,
        EntityException: EntityException ?? this.EntityException,
        ScheduleOccurrenceIds:
            ScheduleOccurrenceIds ?? this.ScheduleOccurrenceIds,
      );
  @override
  String toString() {
    return (StringBuffer('Audit(')
          ..write('AuditEntityId: $AuditEntityId, ')
          ..write('AuditId: $AuditId, ')
          ..write('AuditEntityName: $AuditEntityName, ')
          ..write('AuditEntityTypeId: $AuditEntityTypeId, ')
          ..write('AuditParentEntityId: $AuditParentEntityId, ')
          ..write('SequenceNo: $SequenceNo, ')
          ..write('EntityEndDate: $EntityEndDate, ')
          ..write('IsLeafNode: $IsLeafNode, ')
          ..write('BarcodeNFC: $BarcodeNFC, ')
          ..write('EntityLevel: $EntityLevel, ')
          ..write('EntityException: $EntityException, ')
          ..write('ScheduleOccurrenceIds: $ScheduleOccurrenceIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      AuditEntityId,
      AuditId,
      AuditEntityName,
      AuditEntityTypeId,
      AuditParentEntityId,
      SequenceNo,
      EntityEndDate,
      IsLeafNode,
      BarcodeNFC,
      EntityLevel,
      EntityException,
      ScheduleOccurrenceIds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Audit &&
          other.AuditEntityId == this.AuditEntityId &&
          other.AuditId == this.AuditId &&
          other.AuditEntityName == this.AuditEntityName &&
          other.AuditEntityTypeId == this.AuditEntityTypeId &&
          other.AuditParentEntityId == this.AuditParentEntityId &&
          other.SequenceNo == this.SequenceNo &&
          other.EntityEndDate == this.EntityEndDate &&
          other.IsLeafNode == this.IsLeafNode &&
          other.BarcodeNFC == this.BarcodeNFC &&
          other.EntityLevel == this.EntityLevel &&
          other.EntityException == this.EntityException &&
          other.ScheduleOccurrenceIds == this.ScheduleOccurrenceIds);
}

class AuditTableCompanion extends UpdateCompanion<Audit> {
  final Value<int?> AuditEntityId;
  final Value<int?> AuditId;
  final Value<String?> AuditEntityName;
  final Value<int?> AuditEntityTypeId;
  final Value<int?> AuditParentEntityId;
  final Value<int?> SequenceNo;
  final Value<String?> EntityEndDate;
  final Value<bool?> IsLeafNode;
  final Value<String?> BarcodeNFC;
  final Value<int?> EntityLevel;
  final Value<bool?> EntityException;
  final Value<String?> ScheduleOccurrenceIds;
  const AuditTableCompanion({
    this.AuditEntityId = const Value.absent(),
    this.AuditId = const Value.absent(),
    this.AuditEntityName = const Value.absent(),
    this.AuditEntityTypeId = const Value.absent(),
    this.AuditParentEntityId = const Value.absent(),
    this.SequenceNo = const Value.absent(),
    this.EntityEndDate = const Value.absent(),
    this.IsLeafNode = const Value.absent(),
    this.BarcodeNFC = const Value.absent(),
    this.EntityLevel = const Value.absent(),
    this.EntityException = const Value.absent(),
    this.ScheduleOccurrenceIds = const Value.absent(),
  });
  AuditTableCompanion.insert({
    this.AuditEntityId = const Value.absent(),
    this.AuditId = const Value.absent(),
    this.AuditEntityName = const Value.absent(),
    this.AuditEntityTypeId = const Value.absent(),
    this.AuditParentEntityId = const Value.absent(),
    this.SequenceNo = const Value.absent(),
    this.EntityEndDate = const Value.absent(),
    this.IsLeafNode = const Value.absent(),
    this.BarcodeNFC = const Value.absent(),
    this.EntityLevel = const Value.absent(),
    this.EntityException = const Value.absent(),
    this.ScheduleOccurrenceIds = const Value.absent(),
  });
  static Insertable<Audit> custom({
    Expression<int?>? AuditEntityId,
    Expression<int?>? AuditId,
    Expression<String?>? AuditEntityName,
    Expression<int?>? AuditEntityTypeId,
    Expression<int?>? AuditParentEntityId,
    Expression<int?>? SequenceNo,
    Expression<String?>? EntityEndDate,
    Expression<bool?>? IsLeafNode,
    Expression<String?>? BarcodeNFC,
    Expression<int?>? EntityLevel,
    Expression<bool?>? EntityException,
    Expression<String?>? ScheduleOccurrenceIds,
  }) {
    return RawValuesInsertable({
      if (AuditEntityId != null) 'audit_entity_id': AuditEntityId,
      if (AuditId != null) 'audit_id': AuditId,
      if (AuditEntityName != null) 'audit_entity_name': AuditEntityName,
      if (AuditEntityTypeId != null) 'audit_entity_type_id': AuditEntityTypeId,
      if (AuditParentEntityId != null)
        'audit_parent_entity_id': AuditParentEntityId,
      if (SequenceNo != null) 'sequence_no': SequenceNo,
      if (EntityEndDate != null) 'entity_end_date': EntityEndDate,
      if (IsLeafNode != null) 'is_leaf_node': IsLeafNode,
      if (BarcodeNFC != null) 'barcode_n_f_c': BarcodeNFC,
      if (EntityLevel != null) 'entity_level': EntityLevel,
      if (EntityException != null) 'entity_exception': EntityException,
      if (ScheduleOccurrenceIds != null)
        'schedule_occurrence_ids': ScheduleOccurrenceIds,
    });
  }

  AuditTableCompanion copyWith(
      {Value<int?>? AuditEntityId,
      Value<int?>? AuditId,
      Value<String?>? AuditEntityName,
      Value<int?>? AuditEntityTypeId,
      Value<int?>? AuditParentEntityId,
      Value<int?>? SequenceNo,
      Value<String?>? EntityEndDate,
      Value<bool?>? IsLeafNode,
      Value<String?>? BarcodeNFC,
      Value<int?>? EntityLevel,
      Value<bool?>? EntityException,
      Value<String?>? ScheduleOccurrenceIds}) {
    return AuditTableCompanion(
      AuditEntityId: AuditEntityId ?? this.AuditEntityId,
      AuditId: AuditId ?? this.AuditId,
      AuditEntityName: AuditEntityName ?? this.AuditEntityName,
      AuditEntityTypeId: AuditEntityTypeId ?? this.AuditEntityTypeId,
      AuditParentEntityId: AuditParentEntityId ?? this.AuditParentEntityId,
      SequenceNo: SequenceNo ?? this.SequenceNo,
      EntityEndDate: EntityEndDate ?? this.EntityEndDate,
      IsLeafNode: IsLeafNode ?? this.IsLeafNode,
      BarcodeNFC: BarcodeNFC ?? this.BarcodeNFC,
      EntityLevel: EntityLevel ?? this.EntityLevel,
      EntityException: EntityException ?? this.EntityException,
      ScheduleOccurrenceIds:
          ScheduleOccurrenceIds ?? this.ScheduleOccurrenceIds,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (AuditEntityId.present) {
      map['audit_entity_id'] = Variable<int?>(AuditEntityId.value);
    }
    if (AuditId.present) {
      map['audit_id'] = Variable<int?>(AuditId.value);
    }
    if (AuditEntityName.present) {
      map['audit_entity_name'] = Variable<String?>(AuditEntityName.value);
    }
    if (AuditEntityTypeId.present) {
      map['audit_entity_type_id'] = Variable<int?>(AuditEntityTypeId.value);
    }
    if (AuditParentEntityId.present) {
      map['audit_parent_entity_id'] = Variable<int?>(AuditParentEntityId.value);
    }
    if (SequenceNo.present) {
      map['sequence_no'] = Variable<int?>(SequenceNo.value);
    }
    if (EntityEndDate.present) {
      map['entity_end_date'] = Variable<String?>(EntityEndDate.value);
    }
    if (IsLeafNode.present) {
      map['is_leaf_node'] = Variable<bool?>(IsLeafNode.value);
    }
    if (BarcodeNFC.present) {
      map['barcode_n_f_c'] = Variable<String?>(BarcodeNFC.value);
    }
    if (EntityLevel.present) {
      map['entity_level'] = Variable<int?>(EntityLevel.value);
    }
    if (EntityException.present) {
      map['entity_exception'] = Variable<bool?>(EntityException.value);
    }
    if (ScheduleOccurrenceIds.present) {
      map['schedule_occurrence_ids'] =
          Variable<String?>(ScheduleOccurrenceIds.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditTableCompanion(')
          ..write('AuditEntityId: $AuditEntityId, ')
          ..write('AuditId: $AuditId, ')
          ..write('AuditEntityName: $AuditEntityName, ')
          ..write('AuditEntityTypeId: $AuditEntityTypeId, ')
          ..write('AuditParentEntityId: $AuditParentEntityId, ')
          ..write('SequenceNo: $SequenceNo, ')
          ..write('EntityEndDate: $EntityEndDate, ')
          ..write('IsLeafNode: $IsLeafNode, ')
          ..write('BarcodeNFC: $BarcodeNFC, ')
          ..write('EntityLevel: $EntityLevel, ')
          ..write('EntityException: $EntityException, ')
          ..write('ScheduleOccurrenceIds: $ScheduleOccurrenceIds')
          ..write(')'))
        .toString();
  }
}

class $AuditTableTable extends AuditTable
    with TableInfo<$AuditTableTable, Audit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _AuditEntityIdMeta =
      const VerificationMeta('AuditEntityId');
  @override
  late final GeneratedColumn<int?> AuditEntityId = GeneratedColumn<int?>(
      'audit_entity_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _AuditIdMeta = const VerificationMeta('AuditId');
  @override
  late final GeneratedColumn<int?> AuditId = GeneratedColumn<int?>(
      'audit_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _AuditEntityNameMeta =
      const VerificationMeta('AuditEntityName');
  @override
  late final GeneratedColumn<String?> AuditEntityName =
      GeneratedColumn<String?>('audit_entity_name', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _AuditEntityTypeIdMeta =
      const VerificationMeta('AuditEntityTypeId');
  @override
  late final GeneratedColumn<int?> AuditEntityTypeId = GeneratedColumn<int?>(
      'audit_entity_type_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _AuditParentEntityIdMeta =
      const VerificationMeta('AuditParentEntityId');
  @override
  late final GeneratedColumn<int?> AuditParentEntityId = GeneratedColumn<int?>(
      'audit_parent_entity_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _SequenceNoMeta = const VerificationMeta('SequenceNo');
  @override
  late final GeneratedColumn<int?> SequenceNo = GeneratedColumn<int?>(
      'sequence_no', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _EntityEndDateMeta =
      const VerificationMeta('EntityEndDate');
  @override
  late final GeneratedColumn<String?> EntityEndDate = GeneratedColumn<String?>(
      'entity_end_date', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _IsLeafNodeMeta = const VerificationMeta('IsLeafNode');
  @override
  late final GeneratedColumn<bool?> IsLeafNode = GeneratedColumn<bool?>(
      'is_leaf_node', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_leaf_node IN (0, 1))');
  final VerificationMeta _BarcodeNFCMeta = const VerificationMeta('BarcodeNFC');
  @override
  late final GeneratedColumn<String?> BarcodeNFC = GeneratedColumn<String?>(
      'barcode_n_f_c', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _EntityLevelMeta =
      const VerificationMeta('EntityLevel');
  @override
  late final GeneratedColumn<int?> EntityLevel = GeneratedColumn<int?>(
      'entity_level', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _EntityExceptionMeta =
      const VerificationMeta('EntityException');
  @override
  late final GeneratedColumn<bool?> EntityException = GeneratedColumn<bool?>(
      'entity_exception', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (entity_exception IN (0, 1))');
  final VerificationMeta _ScheduleOccurrenceIdsMeta =
      const VerificationMeta('ScheduleOccurrenceIds');
  @override
  late final GeneratedColumn<String?> ScheduleOccurrenceIds =
      GeneratedColumn<String?>('schedule_occurrence_ids', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        AuditEntityId,
        AuditId,
        AuditEntityName,
        AuditEntityTypeId,
        AuditParentEntityId,
        SequenceNo,
        EntityEndDate,
        IsLeafNode,
        BarcodeNFC,
        EntityLevel,
        EntityException,
        ScheduleOccurrenceIds
      ];
  @override
  String get aliasedName => _alias ?? 'audit_table';
  @override
  String get actualTableName => 'audit_table';
  @override
  VerificationContext validateIntegrity(Insertable<Audit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('audit_entity_id')) {
      context.handle(
          _AuditEntityIdMeta,
          AuditEntityId.isAcceptableOrUnknown(
              data['audit_entity_id']!, _AuditEntityIdMeta));
    }
    if (data.containsKey('audit_id')) {
      context.handle(_AuditIdMeta,
          AuditId.isAcceptableOrUnknown(data['audit_id']!, _AuditIdMeta));
    }
    if (data.containsKey('audit_entity_name')) {
      context.handle(
          _AuditEntityNameMeta,
          AuditEntityName.isAcceptableOrUnknown(
              data['audit_entity_name']!, _AuditEntityNameMeta));
    }
    if (data.containsKey('audit_entity_type_id')) {
      context.handle(
          _AuditEntityTypeIdMeta,
          AuditEntityTypeId.isAcceptableOrUnknown(
              data['audit_entity_type_id']!, _AuditEntityTypeIdMeta));
    }
    if (data.containsKey('audit_parent_entity_id')) {
      context.handle(
          _AuditParentEntityIdMeta,
          AuditParentEntityId.isAcceptableOrUnknown(
              data['audit_parent_entity_id']!, _AuditParentEntityIdMeta));
    }
    if (data.containsKey('sequence_no')) {
      context.handle(
          _SequenceNoMeta,
          SequenceNo.isAcceptableOrUnknown(
              data['sequence_no']!, _SequenceNoMeta));
    }
    if (data.containsKey('entity_end_date')) {
      context.handle(
          _EntityEndDateMeta,
          EntityEndDate.isAcceptableOrUnknown(
              data['entity_end_date']!, _EntityEndDateMeta));
    }
    if (data.containsKey('is_leaf_node')) {
      context.handle(
          _IsLeafNodeMeta,
          IsLeafNode.isAcceptableOrUnknown(
              data['is_leaf_node']!, _IsLeafNodeMeta));
    }
    if (data.containsKey('barcode_n_f_c')) {
      context.handle(
          _BarcodeNFCMeta,
          BarcodeNFC.isAcceptableOrUnknown(
              data['barcode_n_f_c']!, _BarcodeNFCMeta));
    }
    if (data.containsKey('entity_level')) {
      context.handle(
          _EntityLevelMeta,
          EntityLevel.isAcceptableOrUnknown(
              data['entity_level']!, _EntityLevelMeta));
    }
    if (data.containsKey('entity_exception')) {
      context.handle(
          _EntityExceptionMeta,
          EntityException.isAcceptableOrUnknown(
              data['entity_exception']!, _EntityExceptionMeta));
    }
    if (data.containsKey('schedule_occurrence_ids')) {
      context.handle(
          _ScheduleOccurrenceIdsMeta,
          ScheduleOccurrenceIds.isAcceptableOrUnknown(
              data['schedule_occurrence_ids']!, _ScheduleOccurrenceIdsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {AuditEntityId};
  @override
  Audit map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Audit.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AuditTableTable createAlias(String alias) {
    return $AuditTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AuditTableTable auditTable = $AuditTableTable(this);
  late final AuditDao auditDao = AuditDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [auditTable];
}
