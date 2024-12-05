import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FechasRecord extends FirestoreRecord {
  FechasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "fechaSinMH" field.
  DateTime? _fechaSinMH;
  DateTime? get fechaSinMH => _fechaSinMH;
  bool hasFechaSinMH() => _fechaSinMH != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _color = snapshotData['color'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _fechaSinMH = snapshotData['fechaSinMH'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fechas');

  static Stream<FechasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FechasRecord.fromSnapshot(s));

  static Future<FechasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FechasRecord.fromSnapshot(s));

  static FechasRecord fromSnapshot(DocumentSnapshot snapshot) => FechasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FechasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FechasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FechasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FechasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFechasRecordData({
  String? nombre,
  String? tipo,
  String? color,
  DateTime? fecha,
  DateTime? fechaSinMH,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'tipo': tipo,
      'color': color,
      'fecha': fecha,
      'fechaSinMH': fechaSinMH,
    }.withoutNulls,
  );

  return firestoreData;
}

class FechasRecordDocumentEquality implements Equality<FechasRecord> {
  const FechasRecordDocumentEquality();

  @override
  bool equals(FechasRecord? e1, FechasRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.tipo == e2?.tipo &&
        e1?.color == e2?.color &&
        e1?.fecha == e2?.fecha &&
        e1?.fechaSinMH == e2?.fechaSinMH;
  }

  @override
  int hash(FechasRecord? e) => const ListEquality()
      .hash([e?.nombre, e?.tipo, e?.color, e?.fecha, e?.fechaSinMH]);

  @override
  bool isValidKey(Object? o) => o is FechasRecord;
}
