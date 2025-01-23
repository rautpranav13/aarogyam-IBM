import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/sqlite/sqlite_manager.dart';
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
      _genderValue = prefs.getString('ff_genderValue') ?? _genderValue;
    });
    _safeInit(() {
      _ageValue = prefs.getInt('ff_ageValue') ?? _ageValue;
    });
    _safeInit(() {
      _heightValue = prefs.getInt('ff_heightValue') ?? _heightValue;
    });
    _safeInit(() {
      _weightValue = prefs.getInt('ff_weightValue') ?? _weightValue;
    });
    _safeInit(() {
      _userTitle = prefs.getString('ff_userTitle') ?? _userTitle;
    });
    _safeInit(() {
      _userQuery = prefs.getString('ff_userQuery') ?? _userQuery;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _genderValue = '';
  String get genderValue => _genderValue;
  set genderValue(String value) {
    _genderValue = value;
    prefs.setString('ff_genderValue', value);
    debugLogAppState(this);
  }

  int _ageValue = 18;
  int get ageValue => _ageValue;
  set ageValue(int value) {
    _ageValue = value;
    prefs.setInt('ff_ageValue', value);
    debugLogAppState(this);
  }

  int _heightValue = 140;
  int get heightValue => _heightValue;
  set heightValue(int value) {
    _heightValue = value;
    prefs.setInt('ff_heightValue', value);
    debugLogAppState(this);
  }

  int _weightValue = 30;
  int get weightValue => _weightValue;
  set weightValue(int value) {
    _weightValue = value;
    prefs.setInt('ff_weightValue', value);
    debugLogAppState(this);
  }

  bool _isRecording = false;
  bool get isRecording => _isRecording;
  set isRecording(bool value) {
    _isRecording = value;

    debugLogAppState(this);
  }

  int _whatClicked = 0;
  int get whatClicked => _whatClicked;
  set whatClicked(int value) {
    _whatClicked = value;

    debugLogAppState(this);
  }

  String _typedMessage = '';
  String get typedMessage => _typedMessage;
  set typedMessage(String value) {
    _typedMessage = value;

    debugLogAppState(this);
  }

  bool _isTranslate = false;
  bool get isTranslate => _isTranslate;
  set isTranslate(bool value) {
    _isTranslate = value;

    debugLogAppState(this);
  }

  String _userTitle = '';
  String get userTitle => _userTitle;
  set userTitle(String value) {
    _userTitle = value;
    prefs.setString('ff_userTitle', value);
    debugLogAppState(this);
  }

  String _userQuery = '';
  String get userQuery => _userQuery;
  set userQuery(String value) {
    _userQuery = value;
    prefs.setString('ff_userQuery', value);
    debugLogAppState(this);
  }

  Map<String, DebugDataField> toDebugSerializableMap() => {
        'genderValue': debugSerializeParam(
          genderValue,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch0KFwoLZ2VuZGVyVmFsdWUSCDNhYmhjdjF4cgIIA1oLZ2VuZGVyVmFsdWU=',
          name: 'String',
          nullable: false,
        ),
        'ageValue': debugSerializeParam(
          ageValue,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChoKFAoIYWdlVmFsdWUSCHBqc3N5c3NlcgIIAVoIYWdlVmFsdWU=',
          name: 'int',
          nullable: false,
        ),
        'heightValue': debugSerializeParam(
          heightValue,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch0KFwoLaGVpZ2h0VmFsdWUSCG44eHhheTM2cgIIAVoLaGVpZ2h0VmFsdWU=',
          name: 'int',
          nullable: false,
        ),
        'weightValue': debugSerializeParam(
          weightValue,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch0KFwoLd2VpZ2h0VmFsdWUSCDM1bWE4bTZrcgIIAVoLd2VpZ2h0VmFsdWU=',
          name: 'int',
          nullable: false,
        ),
        'isRecording': debugSerializeParam(
          isRecording,
          ParamType.bool,
          link:
              'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch0KFwoLaXNSZWNvcmRpbmcSCHZ3bWcxajlxcgIIBVoLaXNSZWNvcmRpbmc=',
          name: 'bool',
          nullable: false,
        ),
        'whatClicked': debugSerializeParam(
          whatClicked,
          ParamType.int,
          link:
              'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch0KFwoLd2hhdENsaWNrZWQSCGpqaTdqd3dscgIIAVoLd2hhdENsaWNrZWQ=',
          name: 'int',
          nullable: false,
        ),
        'typedMessage': debugSerializeParam(
          typedMessage,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch4KGAoMdHlwZWRNZXNzYWdlEgg0eDNoYjk3cnICCANaDHR5cGVkTWVzc2FnZQ==',
          name: 'String',
          nullable: false,
        ),
        'isTranslate': debugSerializeParam(
          isTranslate,
          ParamType.bool,
          link:
              'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Ch0KFwoLaXNUcmFuc2xhdGUSCHp5cXhlc2trcgIIBVoLaXNUcmFuc2xhdGU=',
          name: 'bool',
          nullable: false,
        ),
        'userTitle': debugSerializeParam(
          userTitle,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChsKFQoJdXNlclRpdGxlEghsanJkNzNxM3ICCANaCXVzZXJUaXRsZQ==',
          name: 'String',
          nullable: false,
        ),
        'userQuery': debugSerializeParam(
          userQuery,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=ChsKFQoJdXNlclF1ZXJ5EghxNDltY2gxcXICCANaCXVzZXJRdWVyeQ==',
          name: 'String',
          nullable: false,
        )
      };
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
