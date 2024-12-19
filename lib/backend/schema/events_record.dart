import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "expireAt" field.
  DateTime? _expireAt;
  DateTime? get expireAt => _expireAt;
  bool hasExpireAt() => _expireAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _color = getSchemaColor(snapshotData['color']);
    _type = snapshotData['type'] as String?;
    _expireAt = snapshotData['expireAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('events')
          : FirebaseFirestore.instance.collectionGroup('events');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('events').doc();

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? title,
  DateTime? startTime,
  DateTime? endTime,
  String? description,
  Color? color,
  String? type,
  DateTime? expireAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
      'color': color,
      'type': type,
      'expireAt': expireAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.description == e2?.description &&
        e1?.color == e2?.color &&
        e1?.type == e2?.type &&
        e1?.expireAt == e2?.expireAt;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.startTime,
        e?.endTime,
        e?.description,
        e?.color,
        e?.type,
        e?.expireAt
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
