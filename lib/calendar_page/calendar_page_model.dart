import '/components/background_widget.dart';
import '/components/create_new_event_widget.dart';
import '/components/events_widget.dart';
import '/components/now_line_widget.dart';
import '/components/week_days_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getEventsAction] action in CalendarPage widget.
  dynamic? events;
  // Model for Background component.
  late BackgroundModel backgroundModel;
  // Model for NowLine component.
  late NowLineModel nowLineModel;
  // Model for Events component.
  late EventsModel eventsModel;
  // Model for WeekDays component.
  late WeekDaysModel weekDaysModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backgroundModel = createModel(context, () => BackgroundModel());
    nowLineModel = createModel(context, () => NowLineModel());
    eventsModel = createModel(context, () => EventsModel());
    weekDaysModel = createModel(context, () => WeekDaysModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backgroundModel.dispose();
    nowLineModel.dispose();
    eventsModel.dispose();
    weekDaysModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
