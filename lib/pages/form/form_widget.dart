import '/backend/backend.dart';
import '/components/calend_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'form_model.dart';
export 'form_model.dart';

class FormWidget extends StatefulWidget {
  /// Formulario para rellenar información sobre tratamiento
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late FormModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormModel());

    _model.textFieldNameTextController ??= TextEditingController();
    _model.textFieldNameFocusNode ??= FocusNode();

    _model.textFieldHourTextController ??= TextEditingController(text: '12');
    _model.textFieldHourFocusNode ??= FocusNode();
    _model.textFieldHourFocusNode!.addListener(
      () async {
        safeSetState(() {
          _model.textFieldHourTextController?.text =
              functions.anadirCeroHora(_model.textFieldHourTextController.text);
          _model.textFieldHourMask.updateMask(
            newValue: TextEditingValue(
              text: _model.textFieldHourTextController!.text,
            ),
          );
        });
      },
    );
    _model.textFieldMinTextController ??= TextEditingController(text: '00');
    _model.textFieldMinFocusNode ??= FocusNode();
    _model.textFieldMinFocusNode!.addListener(
      () async {
        safeSetState(() {
          _model.textFieldMinTextController?.text =
              functions.anadirCeroHora(_model.textFieldMinTextController.text);
          _model.textFieldMinMask.updateMask(
            newValue: TextEditingValue(
              text: _model.textFieldMinTextController!.text,
            ),
          );
        });
      },
    );
    _model.textFieldPerTextController ??= TextEditingController();
    _model.textFieldPerFocusNode ??= FocusNode();

    _model.textFieldDurTextController ??= TextEditingController();
    _model.textFieldDurFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.95,
        height: MediaQuery.sizeOf(context).height * 0.907,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
            width: 2.0,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Semantics(
                        label: 'Botón: Volver a la página principal',
                        child: FlutterFlowIconButton(
                          borderRadius: 100.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).error,
                            size: 25.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 30.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: Semantics(
                                  label:
                                      'Texto: \"Información del medicamento\"',
                                  child: Text(
                                    'Info del medicamento',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: valueOrDefault<double>(
                                            functions.letraTamanoUpdate(
                                                17, FFAppState().factorCrece),
                                            17.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Semantics(
                                  label:
                                      'Entrada de texto: Introduce el nombre de la medicina',
                                  child: Container(
                                    width: 300.0,
                                    child: TextFormField(
                                      controller:
                                          _model.textFieldNameTextController,
                                      focusNode: _model.textFieldNameFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textFieldNameTextController',
                                        Duration(milliseconds: 1),
                                        () async {
                                          _model.validoCopy = true;
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            _model.validoCopy = false;
                                          }
                                          if (_model.dropDownValue1 == null) {
                                            _model.validoCopy = false;
                                          }
                                          if (_model.dropDownValue2 == null) {
                                            _model.validoCopy = false;
                                          }
                                          if (_model.dropDownValue3 == null) {
                                            _model.validoCopy = false;
                                          }
                                          if ((functions.todosDropActivados(
                                                      _model.dropTipo,
                                                      _model.dropColor,
                                                      _model.dropDias,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary) ==
                                                  true) &&
                                              _model.validoCopy!) {
                                            _model.enableBoton = true;
                                            safeSetState(() {});
                                          } else {
                                            _model.enableBoton = false;
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText:
                                            'Introduce marca de la medicina',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: valueOrDefault<double>(
                                                functions.letraTamanoUpdate(14,
                                                    FFAppState().factorCrece),
                                                14.0,
                                              ),
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Nombre',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: valueOrDefault<double>(
                                              functions.letraTamanoUpdate(
                                                  20, FFAppState().factorCrece),
                                              20.0,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.name,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: _model
                                          .textFieldNameTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController1 ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue1 ??= '',
                                ),
                                options: List<String>.from(
                                    ['Pastillas', 'Jarabe', 'Cápsulas']),
                                optionLabels: [
                                  'Pastillas',
                                  'Jarabe',
                                  'Cápsulas'
                                ],
                                onChanged: (val) async {
                                  safeSetState(
                                      () => _model.dropDownValue1 = val);
                                  _model.dropTipo =
                                      FlutterFlowTheme.of(context).primary;
                                  safeSetState(() {});
                                  _model.validoCopy6 = true;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    _model.validoCopy6 = false;
                                  }
                                  if (_model.dropDownValue1 == null) {
                                    _model.validoCopy6 = false;
                                  }
                                  if (_model.dropDownValue2 == null) {
                                    _model.validoCopy6 = false;
                                  }
                                  if (_model.dropDownValue3 == null) {
                                    _model.validoCopy6 = false;
                                  }
                                  if ((functions.todosDropActivados(
                                              _model.dropTipo,
                                              _model.dropColor,
                                              _model.dropDias,
                                              FlutterFlowTheme.of(context)
                                                  .primary) ==
                                          true) &&
                                      _model.validoCopy6!) {
                                    _model.enableBoton = true;
                                    safeSetState(() {});
                                  } else {
                                    _model.enableBoton = false;
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                                width: 155.0,
                                height: 48.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: valueOrDefault<double>(
                                        functions.letraTamanoUpdate(
                                            14, FFAppState().factorCrece),
                                        14.0,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Tipo',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: valueOrDefault<Color>(
                                  _model.dropTipo,
                                  FlutterFlowTheme.of(context).error,
                                ),
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Semantics(
                                label:
                                    'Desplegable: Elige el color de medicina.',
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController2 ??=
                                          FormFieldController<String>(null),
                                  options: List<String>.from([
                                    'Blanco',
                                    'Azul',
                                    'Verde',
                                    'Rojo',
                                    'Amarillo'
                                  ]),
                                  optionLabels: [
                                    'Blanco',
                                    'Azul',
                                    'Verde',
                                    'Rojo',
                                    'Amarillo'
                                  ],
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.dropDownValue2 = val);
                                    _model.dropColor =
                                        FlutterFlowTheme.of(context).primary;
                                    safeSetState(() {});
                                    _model.validoCopy5 = true;
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      _model.validoCopy5 = false;
                                    }
                                    if (_model.dropDownValue1 == null) {
                                      _model.validoCopy5 = false;
                                    }
                                    if (_model.dropDownValue2 == null) {
                                      _model.validoCopy5 = false;
                                    }
                                    if (_model.dropDownValue3 == null) {
                                      _model.validoCopy5 = false;
                                    }
                                    if ((functions.todosDropActivados(
                                                _model.dropTipo,
                                                _model.dropColor,
                                                _model.dropDias,
                                                FlutterFlowTheme.of(context)
                                                    .primary) ==
                                            true) &&
                                        _model.validoCopy5!) {
                                      _model.enableBoton = true;
                                      safeSetState(() {});
                                    } else {
                                      _model.enableBoton = false;
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                  width: 155.0,
                                  height: 48.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: valueOrDefault<double>(
                                          functions.letraTamanoUpdate(
                                              14, FFAppState().factorCrece),
                                          14.0,
                                        ),
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Color',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: valueOrDefault<Color>(
                                    _model.dropColor,
                                    FlutterFlowTheme.of(context).error,
                                  ),
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Semantics(
                                label: 'Texto: \"Fecha de inicio\"',
                                child: Text(
                                  'Fecha inicio:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: valueOrDefault<double>(
                                          functions.letraTamanoUpdate(
                                              14, FFAppState().factorCrece),
                                          14.0,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Semantics(
                                  label:
                                      'Botón: Para ir a pestaña donde elegir fecha de inicio.',
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        isDismissible: false,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: CalendWidget(),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: valueOrDefault<double>(
                                        () {
                                          if (FFAppState().factorCrece == 1.0) {
                                            return 160.0;
                                          } else if (FFAppState().factorCrece ==
                                              1.5) {
                                            return 210.0;
                                          } else if (FFAppState().factorCrece ==
                                              1.125) {
                                            return 175.0;
                                          } else if (FFAppState().factorCrece ==
                                              1.25) {
                                            return 185.0;
                                          } else {
                                            return 200.0;
                                          }
                                        }(),
                                        160.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        functions.letraTamanoUpdate(
                                            45, FFAppState().factorCrece),
                                        45.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      25.0, 0.0, 0.0, 0.0),
                                              child: Semantics(
                                                label:
                                                    'Texto: Fecha seleccionada.',
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    dateTimeFormat(
                                                        "d/M/y",
                                                        FFAppState()
                                                            .Fechainicio),
                                                    '24/11/2024',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            fontSize:
                                                                valueOrDefault<
                                                                    double>(
                                                              functions.letraTamanoUpdate(
                                                                  16,
                                                                  FFAppState()
                                                                      .factorCrece),
                                                              16.0,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    7.0, 0.0, 5.0, 0.0),
                                            child: Icon(
                                              Icons.date_range,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: valueOrDefault<double>(
                                                functions.letraTamanoUpdate(26,
                                                    FFAppState().factorCrece),
                                                26.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 10.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Semantics(
                                label: 'Texto: \"Hora\"',
                                child: Text(
                                  'Hora:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: valueOrDefault<double>(
                                          functions.letraTamanoUpdate(
                                              14, FFAppState().factorCrece),
                                          14.0,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 149.0,
                                    height: 59.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Semantics(
                                              label:
                                                  'Entrada de texto: Introduzca la hora en la que tomar el medicamento.',
                                              child: Container(
                                                width: 55.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .textFieldHourTextController,
                                                  focusNode: _model
                                                      .textFieldHourFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textFieldHourTextController',
                                                    Duration(milliseconds: 1),
                                                    () async {
                                                      _model.validoCopy8 = true;
                                                      if (_model.formKey
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey
                                                              .currentState!
                                                              .validate()) {
                                                        _model.validoCopy8 =
                                                            false;
                                                      }
                                                      if (_model
                                                              .dropDownValue1 ==
                                                          null) {
                                                        _model.validoCopy8 =
                                                            false;
                                                      }
                                                      if (_model
                                                              .dropDownValue2 ==
                                                          null) {
                                                        _model.validoCopy8 =
                                                            false;
                                                      }
                                                      if (_model
                                                              .dropDownValue3 ==
                                                          null) {
                                                        _model.validoCopy8 =
                                                            false;
                                                      }
                                                      if ((functions.todosDropActivados(
                                                                  _model
                                                                      .dropTipo,
                                                                  _model
                                                                      .dropColor,
                                                                  _model
                                                                      .dropDias,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary) ==
                                                              true) &&
                                                          _model.validoCopy8!) {
                                                        _model.enableBoton =
                                                            true;
                                                        safeSetState(() {});
                                                      } else {
                                                        _model.enableBoton =
                                                            false;
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    hintText:
                                                        valueOrDefault<String>(
                                                      functions
                                                          .letraTamanoUpdate(
                                                              12,
                                                              FFAppState()
                                                                  .factorCrece)
                                                          .toString(),
                                                      '12',
                                                    ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    errorStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize:
                                                                valueOrDefault<
                                                                    double>(
                                                              functions.letraTamanoUpdate(
                                                                  20,
                                                                  FFAppState()
                                                                      .factorCrece),
                                                              20.0,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                  textAlign: TextAlign.center,
                                                  maxLength: 2,
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement
                                                          .enforced,
                                                  buildCounter: (context,
                                                          {required currentLength,
                                                          required isFocused,
                                                          maxLength}) =>
                                                      null,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .textFieldHourTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    _model.textFieldHourMask
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            ':',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 25.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Expanded(
                                            child: Semantics(
                                              label:
                                                  'Entrada de texto: Introduzca el minuto en el que tomar el medicamento.',
                                              child: Container(
                                                width: 60.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .textFieldMinTextController,
                                                  focusNode: _model
                                                      .textFieldMinFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textFieldMinTextController',
                                                    Duration(milliseconds: 1),
                                                    () async {
                                                      _model.validoCopy9 = true;
                                                      if (_model.formKey
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey
                                                              .currentState!
                                                              .validate()) {
                                                        _model.validoCopy9 =
                                                            false;
                                                      }
                                                      if (_model
                                                              .dropDownValue1 ==
                                                          null) {
                                                        _model.validoCopy9 =
                                                            false;
                                                      }
                                                      if (_model
                                                              .dropDownValue2 ==
                                                          null) {
                                                        _model.validoCopy9 =
                                                            false;
                                                      }
                                                      if (_model
                                                              .dropDownValue3 ==
                                                          null) {
                                                        _model.validoCopy9 =
                                                            false;
                                                      }
                                                      if ((functions.todosDropActivados(
                                                                  _model
                                                                      .dropTipo,
                                                                  _model
                                                                      .dropColor,
                                                                  _model
                                                                      .dropDias,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary) ==
                                                              true) &&
                                                          _model.validoCopy9!) {
                                                        _model.enableBoton =
                                                            true;
                                                        safeSetState(() {});
                                                      } else {
                                                        _model.enableBoton =
                                                            false;
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText: '00',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            functions
                                                                .letraTamanoUpdate(
                                                                    12,
                                                                    FFAppState()
                                                                        .factorCrece),
                                                            12.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    errorStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize:
                                                                valueOrDefault<
                                                                    double>(
                                                              functions.letraTamanoUpdate(
                                                                  20,
                                                                  FFAppState()
                                                                      .factorCrece),
                                                              20.0,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                  textAlign: TextAlign.center,
                                                  maxLength: 2,
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement
                                                          .enforced,
                                                  buildCounter: (context,
                                                          {required currentLength,
                                                          required isFocused,
                                                          maxLength}) =>
                                                      null,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .textFieldMinTextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    _model.textFieldMinMask
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 0.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Semantics(
                                label: 'Texto:\" Tomar cada\"',
                                child: Text(
                                  'Tomar cada',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: valueOrDefault<double>(
                                          functions.letraTamanoUpdate(
                                              14, FFAppState().factorCrece),
                                          14.0,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            Semantics(
                              label:
                                  'Entrada de texto: Introduzaca cada cuantos días va a tomar la medicina.',
                              child: Container(
                                width: 120.0,
                                child: TextFormField(
                                  controller: _model.textFieldPerTextController,
                                  focusNode: _model.textFieldPerFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldPerTextController',
                                    Duration(milliseconds: 1),
                                    () async {
                                      _model.validoCopy2 = true;
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        _model.validoCopy2 = false;
                                      }
                                      if (_model.dropDownValue1 == null) {
                                        _model.validoCopy2 = false;
                                      }
                                      if (_model.dropDownValue2 == null) {
                                        _model.validoCopy2 = false;
                                      }
                                      if (_model.dropDownValue3 == null) {
                                        _model.validoCopy2 = false;
                                      }
                                      if ((functions.todosDropActivados(
                                                  _model.dropTipo,
                                                  _model.dropColor,
                                                  _model.dropDias,
                                                  FlutterFlowTheme.of(context)
                                                      .primary) ==
                                              true) &&
                                          _model.validoCopy2!) {
                                        _model.enableBoton = true;
                                        safeSetState(() {});
                                      } else {
                                        _model.enableBoton = false;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Num dias',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: valueOrDefault<double>(
                                            functions.letraTamanoUpdate(
                                                14, FFAppState().factorCrece),
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Num dias',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: valueOrDefault<double>(
                                            functions.letraTamanoUpdate(
                                                14, FFAppState().factorCrece),
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: valueOrDefault<double>(
                                          functions.letraTamanoUpdate(
                                              20, FFAppState().factorCrece),
                                          20.0,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .textFieldPerTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [_model.textFieldPerMask],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Semantics(
                                  label: 'Texto: \"días\"',
                                  child: Text(
                                    'días ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: valueOrDefault<double>(
                                            functions.letraTamanoUpdate(
                                                14, FFAppState().factorCrece),
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Semantics(
                                  label: 'Texto: \"Durante\"',
                                  child: Text(
                                    'Durante',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: valueOrDefault<double>(
                                            functions.letraTamanoUpdate(
                                                14, FFAppState().factorCrece),
                                            14.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Semantics(
                                    label:
                                        'Entrada de texto: Introduzaca durante cuanto tiempo va a tomar la medicina.',
                                    child: Container(
                                      width: 110.0,
                                      child: TextFormField(
                                        controller:
                                            _model.textFieldDurTextController,
                                        focusNode: _model.textFieldDurFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textFieldDurTextController',
                                          Duration(milliseconds: 1),
                                          () async {
                                            _model.validoCopy3 = true;
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              _model.validoCopy3 = false;
                                            }
                                            if (_model.dropDownValue1 == null) {
                                              _model.validoCopy3 = false;
                                            }
                                            if (_model.dropDownValue2 == null) {
                                              _model.validoCopy3 = false;
                                            }
                                            if (_model.dropDownValue3 == null) {
                                              _model.validoCopy3 = false;
                                            }
                                            if ((functions.todosDropActivados(
                                                        _model.dropTipo,
                                                        _model.dropColor,
                                                        _model.dropDias,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary) ==
                                                    true) &&
                                                _model.validoCopy3!) {
                                              _model.enableBoton = true;
                                              safeSetState(() {});
                                            } else {
                                              _model.enableBoton = false;
                                              safeSetState(() {});
                                            }

                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Número',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  functions.letraTamanoUpdate(
                                                      14,
                                                      FFAppState().factorCrece),
                                                  14.0,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                          hintText: 'Numero',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  functions.letraTamanoUpdate(
                                                      14,
                                                      FFAppState().factorCrece),
                                                  14.0,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: valueOrDefault<double>(
                                                functions.letraTamanoUpdate(20,
                                                    FFAppState().factorCrece),
                                                20.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textFieldDurTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          _model.textFieldDurMask
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Semantics(
                                  label:
                                      'Desplegable: Seleccione la medida de tiempo (díoas, semanas o meses)',
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController3 ??=
                                            FormFieldController<String>(null),
                                    options: List<String>.from(
                                        ['Días', 'Semanas', 'Meses']),
                                    optionLabels: ['Días', 'Semanas', 'Meses'],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue3 = val);
                                      _model.dropDias =
                                          FlutterFlowTheme.of(context).primary;
                                      safeSetState(() {});
                                      _model.validoCopy4 = true;
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        _model.validoCopy4 = false;
                                      }
                                      if (_model.dropDownValue1 == null) {
                                        _model.validoCopy4 = false;
                                      }
                                      if (_model.dropDownValue2 == null) {
                                        _model.validoCopy4 = false;
                                      }
                                      if (_model.dropDownValue3 == null) {
                                        _model.validoCopy4 = false;
                                      }
                                      if ((functions.todosDropActivados(
                                                  _model.dropTipo,
                                                  _model.dropColor,
                                                  _model.dropDias,
                                                  FlutterFlowTheme.of(context)
                                                      .primary) ==
                                              true) &&
                                          _model.validoCopy4!) {
                                        _model.enableBoton = true;
                                        safeSetState(() {});
                                      } else {
                                        _model.enableBoton = false;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    width: 127.0,
                                    height: 48.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: valueOrDefault<double>(
                                            functions.letraTamanoUpdate(
                                                15, FFAppState().factorCrece),
                                            15.0,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Medida',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: valueOrDefault<Color>(
                                      _model.dropDias,
                                      FlutterFlowTheme.of(context).error,
                                    ),
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 20.0),
                child: Semantics(
                  label:
                      'Botón: Confirmar los datos y almacenarlos en la cuanta para que aparezcan los horarios de la toma en el calendario.',
                  child: FFButtonWidget(
                    onPressed: (_model.enableBoton == false)
                        ? null
                        : () async {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text(
                                          '¿Estas seguro de que quieres añadir esta medicina?'),
                                      content: Text(
                                          'Se añadirá la medicina al calendario'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Confirmar'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              _model.fechas = functions
                                  .obtenerFechasToma(
                                      FFAppState().Fechainicio!,
                                      int.parse(_model
                                          .textFieldDurTextController.text),
                                      int.parse(_model
                                          .textFieldPerTextController.text),
                                      _model.dropDownValue3!)
                                  .toList()
                                  .cast<DateTime>();
                              safeSetState(() {});
                              _model.loopCounter = 0;
                              safeSetState(() {});
                              while (
                                  _model.loopCounter < _model.fechas.length) {
                                await FechasRecord.collection
                                    .doc()
                                    .set(createFechasRecordData(
                                      nombre: _model
                                          .textFieldNameTextController.text,
                                      tipo: _model.dropDownValue1,
                                      color: _model.dropDownValue2,
                                      fecha: functions.obtenerFecha(
                                          _model.fechas[_model.loopCounter],
                                          _model
                                              .textFieldHourTextController.text,
                                          _model
                                              .textFieldMinTextController.text),
                                      fechaSinMH: functions.obtenerFecha(
                                          _model.fechas[_model.loopCounter],
                                          '0',
                                          '0'),
                                    ));
                                _model.loopCounter = _model.loopCounter + 1;
                                safeSetState(() {});
                              }

                              await MedicamentoRecord.collection
                                  .doc()
                                  .set(createMedicamentoRecordData(
                                    nombre:
                                        _model.textFieldNameTextController.text,
                                  ));
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Exito en insercion'),
                                    content: Text(
                                        'Se han añadido las horas para tomar ${_model.textFieldNameTextController.text} al calendario'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              context.safePop();
                            }
                          },
                    text: 'Aceptar',
                    options: FFButtonOptions(
                      width: 127.0,
                      height: 54.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                fontSize: valueOrDefault<double>(
                                  functions.letraTamanoUpdate(
                                      20, FFAppState().factorCrece),
                                  20.0,
                                ),
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                      disabledColor: Color(0xFFA09BC7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
