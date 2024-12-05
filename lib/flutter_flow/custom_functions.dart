import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool esFechaAnterior(DateTime inputDate) {
  DateTime today = DateTime.now();
  today = DateTime(today.year, today.month, today.day);

  // Comparar las fechas
  return inputDate.isBefore(today);
}

String anadirCeroHora(String input) {
  // Verifica si el string tiene solo un carácter
  if (input.length == 1) {
    return '0' + input;
  } else {
    return input;
  }
}

bool todosDropActivados(
  Color drop1,
  Color drop2,
  Color drop3,
  Color primary,
) {
  if (drop1 == primary && drop2 == primary && drop3 == primary) {
    return true;
  } else {
    return false;
  }
}

List<DateTime> obtenerFechasToma(
  DateTime inicio,
  int diasTrat,
  int intervalo,
  String medida,
) {
  List<DateTime> fechas = [];

  switch (medida.toLowerCase()) {
    case 'días':
      break;
    case 'semanas':
      diasTrat = diasTrat * 7;
      break;
    case 'meses':
      diasTrat = diasTrat * 30;
      break;
  }

  // Agregamos la fecha de inicio
  for (int i = 0; i < diasTrat; i += intervalo) {
    // Calculamos la fecha sumando los días al inicio
    DateTime fecha = inicio.add(Duration(days: i));
    fechas.add(fecha);
  }

  return fechas;
}

DateTime obtenerFecha(
  DateTime fecha,
  String hora,
  String minutos,
) {
  int horaInt = int.parse(hora);
  int minutosInt = int.parse(minutos);

  return DateTime(
    fecha.year,
    fecha.month,
    fecha.day, // Mantiene el día de la fecha original
    horaInt,
    minutosInt,
  );
}

double letraTamanoUpdate(
  int tamanoOrigin,
  double factorCrecimiento,
) {
  return tamanoOrigin * factorCrecimiento;
}

DateTime sumarDia(DateTime fecha) {
  return fecha.add(Duration(days: 1));
}

DateTime restarDia(DateTime fecha) {
  return fecha.subtract(Duration(days: 1));
}
