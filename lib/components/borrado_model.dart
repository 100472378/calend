import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'borrado_widget.dart' show BorradoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BorradoModel extends FlutterFlowModel<BorradoWidget> {
  ///  Local state fields for this component.

  List<String> medicamentos = [];
  void addToMedicamentos(String item) => medicamentos.add(item);
  void removeFromMedicamentos(String item) => medicamentos.remove(item);
  void removeAtIndexFromMedicamentos(int index) => medicamentos.removeAt(index);
  void insertAtIndexInMedicamentos(int index, String item) =>
      medicamentos.insert(index, item);
  void updateMedicamentosAtIndex(int index, Function(String) updateFn) =>
      medicamentos[index] = updateFn(medicamentos[index]);

  bool enableBoton = false;

  int loopCounter = 0;

  int loopCounterBor = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in borrado widget.
  List<MedicamentoRecord>? queryResult;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MedicamentoRecord? medBorra;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<FechasRecord>? fechasBorra;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
