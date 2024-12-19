import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TodosRecord extends FirestoreRecord {
  TodosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "todoName" field.
  String? _todoName;
  String get todoName => _todoName ?? '';
  bool hasTodoName() => _todoName != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "timeCreated" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _todoName = snapshotData['todoName'] as String?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _description = snapshotData['description'] as String?;
    _timeCreated = snapshotData['timeCreated'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('todos')
          : FirebaseFirestore.instance.collectionGroup('todos');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('todos').doc();

  static Stream<TodosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TodosRecord.fromSnapshot(s));

  static Future<TodosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TodosRecord.fromSnapshot(s));

  static TodosRecord fromSnapshot(DocumentSnapshot snapshot) => TodosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TodosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TodosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TodosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TodosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTodosRecordData({
  String? todoName,
  bool? isCompleted,
  String? description,
  DateTime? timeCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'todoName': todoName,
      'isCompleted': isCompleted,
      'description': description,
      'timeCreated': timeCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class TodosRecordDocumentEquality implements Equality<TodosRecord> {
  const TodosRecordDocumentEquality();

  @override
  bool equals(TodosRecord? e1, TodosRecord? e2) {
    return e1?.todoName == e2?.todoName &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.description == e2?.description &&
        e1?.timeCreated == e2?.timeCreated;
  }

  @override
  int hash(TodosRecord? e) => const ListEquality()
      .hash([e?.todoName, e?.isCompleted, e?.description, e?.timeCreated]);

  @override
  bool isValidKey(Object? o) => o is TodosRecord;
}
