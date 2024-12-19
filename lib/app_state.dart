import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _hourHeight = 150;
  int get hourHeight => _hourHeight;
  set hourHeight(int _value) {
    _hourHeight = _value;
  }

  bool _trueValue = true;
  bool get trueValue => _trueValue;
  set trueValue(bool _value) {
    _trueValue = _value;
  }

  DateTime? _selectedDay = DateTime.fromMillisecondsSinceEpoch(1667573100000);
  DateTime? get selectedDay => _selectedDay;
  set selectedDay(DateTime? _value) {
    _selectedDay = _value;
  }

  DateTime? _selectedDayIndicator =
      DateTime.fromMillisecondsSinceEpoch(1667573100000);
  DateTime? get selectedDayIndicator => _selectedDayIndicator;
  set selectedDayIndicator(DateTime? _value) {
    _selectedDayIndicator = _value;
  }

  dynamic _events;
  dynamic get events => _events;
  set events(dynamic _value) {
    _events = _value;
  }

  bool _showFullList = true;
  bool get showFullList => _showFullList;
  set showFullList(bool _value) {
    _showFullList = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
