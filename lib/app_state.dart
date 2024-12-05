import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
    });
    _safeInit(() {
      _factorCrece = prefs.getDouble('ff_factorCrece') ?? _factorCrece;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _Fechainicio = DateTime.fromMillisecondsSinceEpoch(1732643520000);
  DateTime? get Fechainicio => _Fechainicio;
  set Fechainicio(DateTime? value) {
    _Fechainicio = value;
  }

  DateTime? _Fechahoy = DateTime.fromMillisecondsSinceEpoch(1732631520000);
  DateTime? get Fechahoy => _Fechahoy;
  set Fechahoy(DateTime? value) {
    _Fechahoy = value;
  }

  DateTime? _fechaHP = DateTime.fromMillisecondsSinceEpoch(1733158860000);
  DateTime? get fechaHP => _fechaHP;
  set fechaHP(DateTime? value) {
    _fechaHP = value;
  }

  DateTime? _fechaSinMH = DateTime.fromMillisecondsSinceEpoch(1734459420000);
  DateTime? get fechaSinMH => _fechaSinMH;
  set fechaSinMH(DateTime? value) {
    _fechaSinMH = value;
  }

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool value) {
    _darkMode = value;
    prefs.setBool('ff_darkMode', value);
  }

  double _factorCrece = 1.0;
  double get factorCrece => _factorCrece;
  set factorCrece(double value) {
    _factorCrece = value;
    prefs.setDouble('ff_factorCrece', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
