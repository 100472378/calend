import '/backend/backend.dart';
import '/components/borrado_widget.dart';
import '/components/settings_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/form/form_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().Fechainicio = getCurrentTimestamp;
      FFAppState().Fechahoy = getCurrentTimestamp;
      safeSetState(() {});
      FFAppState().fechaHP = getCurrentTimestamp;
      safeSetState(() {});
      if (FFAppState().darkMode == true) {
        setDarkModeSetting(context, ThemeMode.dark);
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: FormWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: Color(0xFF6151F0),
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 27.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Pill Care',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).displayMedium.override(
                    fontFamily: 'Inter Tight',
                    color: Colors.white,
                    fontSize: functions.letraTamanoUpdate(
                        40, FFAppState().factorCrece),
                    letterSpacing: 2.0,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(13.0, 10.0, 0.0, 10.0),
                      child: Semantics(
                        label:
                            'Botón: Abre la pestaña para ajustes de accesibilidad .',
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 100.0,
                          borderWidth: 3.0,
                          buttonSize: 60.0,
                          fillColor: Color(0xFF5A49F6),
                          icon: Icon(
                            Icons.settings_sharp,
                            color: FlutterFlowTheme.of(context).info,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SettingsWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 13.0, 10.0),
                      child: Semantics(
                        label:
                            'Botón: Abre la pestaña para borrar medicamentos.',
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).error,
                          borderRadius: 100.0,
                          borderWidth: 4.0,
                          buttonSize: 60.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.delete,
                            color: FlutterFlowTheme.of(context).error,
                            size: 28.0,
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: BorradoWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Semantics(
                      label:
                          'Botón del calendario: Retrocede un día en el calendario',
                      child: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 100.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        disabledIconColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.chevron_left,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 80.0,
                        ),
                        onPressed: (dateTimeFormat(
                                    "yMd", FFAppState().fechaHP) ==
                                dateTimeFormat("yMd", FFAppState().Fechahoy))
                            ? null
                            : () async {
                                FFAppState().fechaHP =
                                    functions.restarDia(FFAppState().fechaHP!);
                                safeSetState(() {});
                              },
                      ),
                    ),
                    Container(
                      width: 192.0,
                      height: 211.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: 191.0,
                              height: 46.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFD43B3B),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(9.0),
                                  topRight: Radius.circular(9.0),
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Semantics(
                                  label:
                                      'Texto: Mes de la fecha actual del calendario',
                                  child: Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat(
                                          "MMMM", FFAppState().fechaHP),
                                      'November',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: valueOrDefault<double>(
                                            functions.letraTamanoUpdate(
                                                20, FFAppState().factorCrece),
                                            20.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Semantics(
                              label:
                                  'Texto: Número de día de la fecha actual del calendario',
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat("d", FFAppState().fechaHP),
                                  '12',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat Alternates',
                                      fontSize: valueOrDefault<double>(
                                        functions.letraTamanoUpdate(
                                            80, FFAppState().factorCrece),
                                        80.0,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Semantics(
                        label:
                            'Botón del calendario: Adelanta un día en el calendario',
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 8.0,
                          buttonSize: 100.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.chevron_right,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 80.0,
                          ),
                          onPressed: () async {
                            FFAppState().fechaHP =
                                functions.sumarDia(FFAppState().fechaHP!);
                            safeSetState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Semantics(
                        label:
                            'Texto: Día de la semana de la fecha actual del calendario',
                        child: Text(
                          valueOrDefault<String>(
                            dateTimeFormat("EEEE", FFAppState().fechaHP),
                            'Wednesday',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: valueOrDefault<double>(
                                      functions.letraTamanoUpdate(
                                          16, FFAppState().factorCrece),
                                      16.0,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<FechasRecord>>(
                  stream: queryFechasRecord(
                    queryBuilder: (fechasRecord) => fechasRecord
                        .where(
                          'fechaSinMH',
                          isEqualTo: functions.obtenerFecha(
                              FFAppState().fechaHP!, '0', '0'),
                        )
                        .orderBy('fecha'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<FechasRecord> columnFechasRecordList = snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnFechasRecordList.length,
                          (columnIndex) {
                        final columnFechasRecord =
                            columnFechasRecordList[columnIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: Container(
                            width: 346.0,
                            height: valueOrDefault<double>(
                              () {
                                if (FFAppState().factorCrece == 1.0) {
                                  return 260.0;
                                } else if (FFAppState().factorCrece == 1.5) {
                                  return 315.0;
                                } else if (FFAppState().factorCrece == 1.125) {
                                  return 273.0;
                                } else if (FFAppState().factorCrece == 1.25) {
                                  return 290.0;
                                } else {
                                  return 300.0;
                                }
                              }(),
                              260.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFBA99F5),
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 3.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 0.0, 0.0),
                                      child: Semantics(
                                        label: 'Texto: Nombre del medicamento',
                                        child: Text(
                                          columnFechasRecord.nombre,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Colors.black,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  functions.letraTamanoUpdate(
                                                      30,
                                                      FFAppState().factorCrece),
                                                  30.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 7.0, 7.0, 0.0),
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: () {
                                            if (columnFechasRecord.color ==
                                                'Azul') {
                                              return Color(0xFF2480FF);
                                            } else if (columnFechasRecord
                                                    .color ==
                                                'Blanco') {
                                              return Color(0xFFCABFBF);
                                            } else if (columnFechasRecord
                                                    .color ==
                                                'Verde') {
                                              return Color(0xFF46AF5E);
                                            } else if (columnFechasRecord
                                                    .color ==
                                                'Rojo') {
                                              return Color(0xFFFF4B37);
                                            } else if (columnFechasRecord
                                                    .color ==
                                                'Amarillo') {
                                              return Color(0xFFD9E523);
                                            } else {
                                              return Color(0x00000000);
                                            }
                                          }(),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        child: Stack(
                                          children: [
                                            if (columnFechasRecord.tipo ==
                                                'Cápsulas')
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/medicina_c.png',
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            if (columnFechasRecord.tipo ==
                                                'Jarabe')
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/jarabe.png',
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            if (columnFechasRecord.tipo ==
                                                'Pastillas')
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Semantics(
                                                  label:
                                                      'Imagen: Icono del medicamento',
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/pastillas.png',
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      fit: BoxFit.fill,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0,
                                      valueOrDefault<double>(
                                        functions.letraTamanoUpdate(
                                            10, FFAppState().factorCrece),
                                        10.0,
                                      ),
                                      0.0,
                                      valueOrDefault<double>(
                                        functions.letraTamanoUpdate(
                                            15, FFAppState().factorCrece),
                                        15.0,
                                      )),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Semantics(
                                        label: 'Texto: Tipo de medicamento',
                                        child: Text(
                                          'Tipo: ${columnFechasRecord.tipo}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Colors.black,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  functions.letraTamanoUpdate(
                                                      20,
                                                      FFAppState().factorCrece),
                                                  20.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0,
                                      0.0,
                                      0.0,
                                      valueOrDefault<double>(
                                        functions.letraTamanoUpdate(
                                            15, FFAppState().factorCrece),
                                        15.0,
                                      )),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Semantics(
                                        label: 'Texto: Color del medicamento',
                                        child: Text(
                                          'Color: ${columnFechasRecord.color}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Colors.black,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  functions.letraTamanoUpdate(
                                                      20,
                                                      FFAppState().factorCrece),
                                                  20.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Semantics(
                                          label: 'Texto: \"Tomar a las\"',
                                          child: Text(
                                            'Tomar a las:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Colors.black,
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    functions.letraTamanoUpdate(
                                                        20,
                                                        FFAppState()
                                                            .factorCrece),
                                                    20.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Semantics(
                                            label: 'Texto: Hora de la toma',
                                            child: Text(
                                              dateTimeFormat("Hm",
                                                  columnFechasRecord.fecha!),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Colors.black,
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      functions
                                                          .letraTamanoUpdate(
                                                              21,
                                                              FFAppState()
                                                                  .factorCrece),
                                                      21.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
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
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      if ((columnIndex == 0) &&
                                          (dateTimeFormat("yMd",
                                                  FFAppState().fechaHP) ==
                                              dateTimeFormat("yMd",
                                                  FFAppState().Fechahoy)))
                                        Flexible(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Semantics(
                                                label:
                                                    'Botón: Verifica la toma de ese medicamento y borra el registro de la toma.',
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 100.0,
                                                  buttonSize: 60.0,
                                                  fillColor: Color(0xFF367C74),
                                                  icon: Icon(
                                                    Icons.task_alt_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      '¿Ya has tomado la medicina?'),
                                                                  content: Text(
                                                                      'En caso de haberla tomado, pulsa aceptar. Esto borrará la toma del calendario.'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Cancelar'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Confirmar'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      await columnFechasRecord
                                                          .reference
                                                          .delete();
                                                    }
                                                  },
                                                ),
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
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
