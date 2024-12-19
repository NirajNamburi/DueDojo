import '/components/day_picker_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'week_days_model.dart';
export 'week_days_model.dart';

class WeekDaysWidget extends StatefulWidget {
  const WeekDaysWidget({
    Key? key,
    this.callback,
  }) : super(key: key);

  final Future<dynamic> Function()? callback;

  @override
  _WeekDaysWidgetState createState() => _WeekDaysWidgetState();
}

class _WeekDaysWidgetState extends State<WeekDaysWidget>
    with TickerProviderStateMixin {
  late WeekDaysModel _model;

  final animationsMap = {
    'rowOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeekDaysModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().selectedDay = getCurrentTimestamp;
      });
      setState(() {
        _model.chosenDate = FFAppState().selectedDay;
      });
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().update(() {
                      FFAppState().selectedDayIndicator =
                          functions.sevenDaysBefore(FFAppState().selectedDay);
                    });
                    await Future.delayed(const Duration(milliseconds: 200));
                    FFAppState().update(() {
                      FFAppState().selectedDay =
                          FFAppState().selectedDayIndicator;
                    });
                    await widget.callback?.call();
                  },
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
          Builder(
            builder: (context) {
              final day = functions
                  .generateSurroundingDays(FFAppState().selectedDay)
                  .toList();
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(day.length, (dayIndex) {
                  final dayItem = day[dayIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (dayItem != FFAppState().selectedDay) {
                        FFAppState().update(() {
                          FFAppState().selectedDayIndicator = dayItem;
                        });
                        setState(() {
                          _model.chosenDate = dayItem;
                        });
                        await Future.delayed(const Duration(milliseconds: 200));
                        FFAppState().update(() {
                          FFAppState().selectedDay = dayItem;
                        });
                        await widget.callback?.call();
                      }
                    },
                    child: DayPickerWidget(
                      key: Key('Key7qb_${dayIndex}_of_${day.length}'),
                      day: getJsonField(
                        functions.dateInfo(dayItem),
                        r'''$.day''',
                      ),
                      weekday: getJsonField(
                        functions.dateInfo(dayItem),
                        r'''$.weekday''',
                      ).toString(),
                      selected: dayItem == FFAppState().selectedDay,
                      tapped: dayItem == FFAppState().selectedDayIndicator,
                    ),
                  );
                }),
              ).animateOnActionTrigger(
                animationsMap['rowOnActionTriggerAnimation']!,
              );
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().update(() {
                      FFAppState().selectedDayIndicator =
                          functions.sevenDaysAfter(FFAppState().selectedDay);
                    });
                    await Future.delayed(const Duration(milliseconds: 200));
                    FFAppState().update(() {
                      FFAppState().selectedDay =
                          FFAppState().selectedDayIndicator;
                    });
                    await widget.callback?.call();
                  },
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
