import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import 'chat_bot_widget.dart' show ChatBotWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class ChatBotModel extends FlutterFlowModel<ChatBotWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - extractTextFromHTMLFile] action in IconButton widget.
  String? _ragResponseWithoutHtml;
  set ragResponseWithoutHtml(String? value) {
    _ragResponseWithoutHtml = value;
    debugLogWidgetClass(this);
  }

  String? get ragResponseWithoutHtml => _ragResponseWithoutHtml;

  // Stores action output result for [Custom Action - textAudio] action in IconButton widget.
  String? _ttsaudioPath;
  set ttsaudioPath(String? value) {
    _ttsaudioPath = value;
    debugLogWidgetClass(this);
  }

  String? get ttsaudioPath => _ttsaudioPath;

  // Stores action output result for [Custom Action - extractTextFromHTMLFile] action in IconButton widget.
  String? _ragresponsewithouthtml2;
  set ragresponsewithouthtml2(String? value) {
    _ragresponsewithouthtml2 = value;
    debugLogWidgetClass(this);
  }

  String? get ragresponsewithouthtml2 => _ragresponsewithouthtml2;

  // Stores action output result for [Custom Action - textAudio] action in IconButton widget.
  String? _ttsaudioPath2;
  set ttsaudioPath2(String? value) {
    _ttsaudioPath2 = value;
    debugLogWidgetClass(this);
  }

  String? get ttsaudioPath2 => _ttsaudioPath2;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (ragAPI)] action in IconButton widget.
  ApiCallResponse? _ragAPIresponse;
  set ragAPIresponse(ApiCallResponse? value) {
    _ragAPIresponse = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get ragAPIresponse => _ragAPIresponse;

  AudioRecorder? audioRecorder;
  String? recordedAudio;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Custom Action - downloadRecordedAudio] action in Container widget.
  String? _recordedFilePath;
  set recordedFilePath(String? value) {
    _recordedFilePath = value;
    debugLogWidgetClass(this);
  }

  String? get recordedFilePath => _recordedFilePath;

  // Stores action output result for [Custom Action - transcribeAudio] action in Container widget.
  String? _rspeechText;
  set rspeechText(String? value) {
    _rspeechText = value;
    debugLogWidgetClass(this);
  }

  String? get rspeechText => _rspeechText;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetStates: {
          'textFieldText': debugSerializeParam(
            textController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=ChatBot',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'ragResponseWithoutHtml': debugSerializeParam(
            ragResponseWithoutHtml,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=ChatBot',
            name: 'String',
            nullable: true,
          ),
          'ttsaudioPath': debugSerializeParam(
            ttsaudioPath,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=ChatBot',
            name: 'String',
            nullable: true,
          ),
          'ragresponsewithouthtml2': debugSerializeParam(
            ragresponsewithouthtml2,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=ChatBot',
            name: 'String',
            nullable: true,
          ),
          'ttsaudioPath2': debugSerializeParam(
            ttsaudioPath2,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=ChatBot',
            name: 'String',
            nullable: true,
          ),
          'ragAPIresponse': debugSerializeParam(
            ragAPIresponse,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=ChatBot',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'recordedAudio': debugSerializeParam(
            recordedAudio,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=ChatBot',
            name: 'String',
            nullable: true,
          ),
          'recordedFilePath': debugSerializeParam(
            recordedFilePath,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=ChatBot',
            name: 'String',
            nullable: true,
          ),
          'rspeechText': debugSerializeParam(
            rspeechText,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/health-literacy-c97mzb?tab=uiBuilder&page=ChatBot',
            name: 'String',
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
            'https://app.flutterflow.io/project/health-literacy-c97mzb/tab=uiBuilder&page=ChatBot',
        searchReference: 'reference=OgdDaGF0Qm90UAFaB0NoYXRCb3Q=',
        widgetClassName: 'ChatBot',
      );
}
