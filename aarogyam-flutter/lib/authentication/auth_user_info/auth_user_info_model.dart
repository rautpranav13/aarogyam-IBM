import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/user_info/user_info_widget.dart';
import 'dart:ui';
import 'auth_user_info_widget.dart' show AuthUserInfoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthUserInfoModel extends FlutterFlowModel<AuthUserInfoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UserInfo component.
  late UserInfoModel userInfoModel;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    userInfoModel = createModel(context, () => UserInfoModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    userInfoModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'userInfoModel (UserInfo)': userInfoModel?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/health-literacy-c97mzb/tab=uiBuilder&page=auth_userInfo',
        searchReference:
            'reference=Og1hdXRoX3VzZXJJbmZvUAFaDWF1dGhfdXNlckluZm8=',
        widgetClassName: 'auth_userInfo',
      );
}
