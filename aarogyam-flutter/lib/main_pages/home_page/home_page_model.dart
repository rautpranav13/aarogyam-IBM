import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/a_i_disclaimer/a_i_disclaimer_widget.dart';
import '/widgets/reminder/reminder_list_collapsed/reminder_list_collapsed_widget.dart';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Model for ReminderListCollapsed component.
  late ReminderListCollapsedModel reminderListCollapsedModel;
  // Model for AIDisclaimer component.
  late AIDisclaimerModel aIDisclaimerModel;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    reminderListCollapsedModel =
        createModel(context, () => ReminderListCollapsedModel());
    aIDisclaimerModel = createModel(context, () => AIDisclaimerModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    reminderListCollapsedModel.dispose();
    aIDisclaimerModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'reminderListCollapsedModel (ReminderListCollapsed)':
              reminderListCollapsedModel?.toWidgetClassDebugData(),
          'aIDisclaimerModel (AIDisclaimer)':
              aIDisclaimerModel?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/health-literacy-c97mzb/tab=uiBuilder&page=HomePage',
        searchReference: 'reference=OghIb21lUGFnZVABWghIb21lUGFnZQ==',
        widgetClassName: 'HomePage',
      );
}
