import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'user_info_widget.dart' show UserInfoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserInfoModel extends FlutterFlowModel<UserInfoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? _dropDownValue;
  set dropDownValue(String? value) {
    _dropDownValue = value;
    debugLogWidgetClass(this);
  }

  String? get dropDownValue => _dropDownValue;

  FormFieldController<String>? dropDownValueController;
  // State field(s) for CountController widget.
  int? _countControllerValue1;
  set countControllerValue1(int? value) {
    _countControllerValue1 = value;
    debugLogWidgetClass(this);
  }

  int? get countControllerValue1 => _countControllerValue1;

  // State field(s) for CountController widget.
  int? _countControllerValue2;
  set countControllerValue2(int? value) {
    _countControllerValue2 = value;
    debugLogWidgetClass(this);
  }

  int? get countControllerValue2 => _countControllerValue2;

  // State field(s) for CountController widget.
  int? _countControllerValue3;
  set countControllerValue3(int? value) {
    _countControllerValue3 = value;
    debugLogWidgetClass(this);
  }

  int? get countControllerValue3 => _countControllerValue3;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetStates: {
          'dropDownValue': debugSerializeParam(
            dropDownValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=UserInfo',
            name: 'String',
            nullable: true,
          ),
          'countControllerValue1': debugSerializeParam(
            countControllerValue1,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=UserInfo',
            name: 'int',
            nullable: true,
          ),
          'countControllerValue2': debugSerializeParam(
            countControllerValue2,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=UserInfo',
            name: 'int',
            nullable: true,
          ),
          'countControllerValue3': debugSerializeParam(
            countControllerValue3,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=UserInfo',
            name: 'int',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/health-literacy-c97mzb/tab=uiBuilder&page=UserInfo',
        searchReference: 'reference=OghVc2VySW5mb1AAWghVc2VySW5mbw==',
        widgetClassName: 'UserInfo',
      );
}
