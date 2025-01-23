import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/reminder/reminder_list_collapsed/reminder_list_collapsed_widget.dart';
import '/widgets/reminder/reminder_list_expanded/reminder_list_expanded_widget.dart';
import 'dart:ui';
import 'auth_home_widget.dart' show AuthHomeWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthHomeModel extends FlutterFlowModel<AuthHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Model for ReminderListCollapsed component.
  late ReminderListCollapsedModel reminderListCollapsedModel;
  // Model for ReminderListExpanded component.
  late ReminderListExpandedModel reminderListExpandedModel;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    reminderListCollapsedModel =
        createModel(context, () => ReminderListCollapsedModel());
    reminderListExpandedModel =
        createModel(context, () => ReminderListExpandedModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    expandableExpandableController.dispose();
    reminderListCollapsedModel.dispose();
    reminderListExpandedModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'reminderListCollapsedModel (ReminderListCollapsed)':
              reminderListCollapsedModel?.toWidgetClassDebugData(),
          'reminderListExpandedModel (ReminderListExpanded)':
              reminderListExpandedModel?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/health-literacy-c97mzb/tab=uiBuilder&page=auth_home',
        searchReference: 'reference=OglhdXRoX2hvbWVQAVoJYXV0aF9ob21l',
        widgetClassName: 'auth_home',
      );
}
