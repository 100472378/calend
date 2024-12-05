import '/backend/backend.dart';
import '/components/calend_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'form_widget.dart' show FormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class FormModel extends FlutterFlowModel<FormWidget> {
  ///  Local state fields for this component.

  Color dropTipo = Color(4294924643);

  Color dropColor = Color(4294924643);

  Color dropDias = Color(4294924643);

  bool enableBoton = false;

  List<DateTime> fechas = [];
  void addToFechas(DateTime item) => fechas.add(item);
  void removeFromFechas(DateTime item) => fechas.remove(item);
  void removeAtIndexFromFechas(int index) => fechas.removeAt(index);
  void insertAtIndexInFechas(int index, DateTime item) =>
      fechas.insert(index, item);
  void updateFechasAtIndex(int index, Function(DateTime) updateFn) =>
      fechas[index] = updateFn(fechas[index]);

  int loopCounter = 0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField_name widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  String? _textFieldNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Rellene el nombre';
    }

    if (val.length < 3) {
      return 'Rellene el nombre';
    }
    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in TextField_name widget.
  bool? validoCopy;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Validate Form] action in DropDown widget.
  bool? validoCopy6;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Validate Form] action in DropDown widget.
  bool? validoCopy5;
  // State field(s) for TextField_hour widget.
  FocusNode? textFieldHourFocusNode;
  TextEditingController? textFieldHourTextController;
  final textFieldHourMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? textFieldHourTextControllerValidator;
  String? _textFieldHourTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3])\$').hasMatch(val)) {
      return 'Hora no valida';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in TextField_hour widget.
  bool? validoCopy8;
  // State field(s) for TextField_min widget.
  FocusNode? textFieldMinFocusNode;
  TextEditingController? textFieldMinTextController;
  final textFieldMinMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? textFieldMinTextControllerValidator;
  String? _textFieldMinTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[0-5]?[0-9]\$').hasMatch(val)) {
      return 'Hora no válida';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in TextField_min widget.
  bool? validoCopy9;
  // State field(s) for TextFieldPer widget.
  FocusNode? textFieldPerFocusNode;
  TextEditingController? textFieldPerTextController;
  final textFieldPerMask = MaskTextInputFormatter(mask: '#');
  String? Function(BuildContext, String?)? textFieldPerTextControllerValidator;
  String? _textFieldPerTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in TextFieldPer widget.
  bool? validoCopy2;
  // State field(s) for TextFieldDur widget.
  FocusNode? textFieldDurFocusNode;
  TextEditingController? textFieldDurTextController;
  final textFieldDurMask = MaskTextInputFormatter(mask: '#');
  String? Function(BuildContext, String?)? textFieldDurTextControllerValidator;
  String? _textFieldDurTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in TextFieldDur widget.
  bool? validoCopy3;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Stores action output result for [Validate Form] action in DropDown widget.
  bool? validoCopy4;

  @override
  void initState(BuildContext context) {
    textFieldNameTextControllerValidator =
        _textFieldNameTextControllerValidator;
    textFieldHourTextControllerValidator =
        _textFieldHourTextControllerValidator;
    textFieldMinTextControllerValidator = _textFieldMinTextControllerValidator;
    textFieldPerTextControllerValidator = _textFieldPerTextControllerValidator;
    textFieldDurTextControllerValidator = _textFieldDurTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldHourFocusNode?.dispose();
    textFieldHourTextController?.dispose();

    textFieldMinFocusNode?.dispose();
    textFieldMinTextController?.dispose();

    textFieldPerFocusNode?.dispose();
    textFieldPerTextController?.dispose();

    textFieldDurFocusNode?.dispose();
    textFieldDurTextController?.dispose();
  }
}
