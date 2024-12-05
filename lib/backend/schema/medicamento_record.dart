import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicamentoRecord extends FirestoreRecord {
  MedicamentoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicamento');

  static Stream<MedicamentoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicamentoRecord.fromSnapshot(s));

  static Future<MedicamentoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicamentoRecord.fromSnapshot(s));

  static MedicamentoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicamentoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicamentoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicamentoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicamentoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicamentoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicamentoRecordData({
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicamentoRecordDocumentEquality implements Equality<MedicamentoRecord> {
  const MedicamentoRecordDocumentEquality();

  @override
  bool equals(MedicamentoRecord? e1, MedicamentoRecord? e2) {
    return e1?.nombre == e2?.nombre;
  }

  @override
  int hash(MedicamentoRecord? e) => const ListEquality().hash([e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is MedicamentoRecord;
}
