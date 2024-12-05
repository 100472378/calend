import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'borrado_model.dart';
export 'borrado_model.dart';

class BorradoWidget extends StatefulWidget {
  /// Página para borrar todos los registros de un medicamento
  const BorradoWidget({super.key});

  @override
  State<BorradoWidget> createState() => _BorradoWidgetState();
}

class _BorradoWidgetState extends State<BorradoWidget> {
  late BorradoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BorradoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.queryResult = await queryMedicamentoRecordOnce(
        queryBuilder: (medicamentoRecord) =>
            medicamentoRecord.orderBy('nombre'),
      );
      _model.loopCounter = 0;
      safeSetState(() {});
      while (_model.loopCounter < _model.queryResult!.length) {
        _model
            .addToMedicamentos(_model.queryResult![_model.loopCounter].nombre);
        safeSetState(() {});
        _model.loopCounter = _model.loopCounter + 1;
        safeSetState(() {});
      }
    });
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
        width: 375.0,
        height: 445.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 7.0, 0.0, 0.0),
                      child: Semantics(
                        label: 'Botón: Volver a la página principal',
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 100.0,
                          borderWidth: 0.0,
                          buttonSize: 48.0,
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
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 282.0,
                      height: 88.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Semantics(
                              label: 'Texto: \"Borrar medicina\"',
                              child: Text(
                                'Borrar medicina',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: valueOrDefault<double>(
                                        functions.letraTamanoUpdate(
                                            23, FFAppState().factorCrece),
                                        23.0,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 45.0),
                  child: Semantics(
                    label:
                        'Desplegable: Para elegir entre tus medicinas guardadas cuál deseas eliminar',
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(null),
                      options: _model.medicamentos,
                      onChanged: (val) async {
                        safeSetState(() => _model.dropDownValue = val);
                        _model.enableBoton = true;
                        safeSetState(() {});
                      },
                      width: 352.0,
                      height: 96.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                fontSize: valueOrDefault<double>(
                                  functions.letraTamanoUpdate(
                                      16, FFAppState().factorCrece),
                                  16.0,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                      hintText: 'Selecciona medicamento',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).primary,
                      borderWidth: 3.0,
                      borderRadius: 20.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 15.0),
              child: Semantics(
                label: 'Botón: Para borrar la medicina seleccionada.',
                child: FFButtonWidget(
                  onPressed: (_model.enableBoton == false)
                      ? null
                      : () async {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text(
                                        '¿Estás seguro de eliminar este medicamento?'),
                                    content: Text(
                                        'Se borrarán todas sus entradas del calendario'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('Borrar'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          _model.medBorra = await queryMedicamentoRecordOnce(
                            queryBuilder: (medicamentoRecord) =>
                                medicamentoRecord.where(
                              'nombre',
                              isEqualTo: _model.dropDownValue,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          await _model.medBorra!.reference.delete();
                          _model.fechasBorra = await queryFechasRecordOnce(
                            queryBuilder: (fechasRecord) => fechasRecord.where(
                              'nombre',
                              isEqualTo: _model.dropDownValue,
                            ),
                          );
                          while (
                              _model.loopCounter < _model.fechasBorra!.length) {
                            await _model
                                .fechasBorra![_model.loopCounterBor].reference
                                .delete();
                            _model.loopCounterBor = _model.loopCounterBor + 1;
                            safeSetState(() {});
                          }
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Se ha eliminado con exito'),
                                content: Text(
                                    'El medicamento ${_model.dropDownValue}fue eliminado con éxito'),
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

                          safeSetState(() {});
                        },
                  text: 'Borrar',
                  options: FFButtonOptions(
                    width: 95.0,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFDD3D47),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          fontSize: valueOrDefault<double>(
                            functions.letraTamanoUpdate(
                                16, FFAppState().factorCrece),
                            16.0,
                          ),
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    disabledColor: Color(0xFFE0C9CB),
                  ),
                ),
              ),
            ),
            if (_model.enableBoton == false)
              Text(
                '# Debes seleccionar una medicina ',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).error,
                      fontSize: valueOrDefault<double>(
                        functions.letraTamanoUpdate(
                            13, FFAppState().factorCrece),
                        13.0,
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
