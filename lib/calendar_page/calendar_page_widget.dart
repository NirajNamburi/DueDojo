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
import 'calendar_page_model.dart';
export 'calendar_page_model.dart';

class CalendarPageWidget extends StatefulWidget {
  const CalendarPageWidget({Key? key}) : super(key: key);

  @override
  _CalendarPageWidgetState createState() => _CalendarPageWidgetState();
}

class _CalendarPageWidgetState extends State<CalendarPageWidget>
    with TickerProviderStateMixin {
  late CalendarPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'eventsOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(47.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.events = await actions.getEventsAction();
      FFAppState().update(() {
        FFAppState().selectedDay = getCurrentTimestamp;
        FFAppState().events = _model.events!;
      });
      if (animationsMap['eventsOnActionTriggerAnimation'] != null) {
        await animationsMap['eventsOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_model.unfocusNode),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: CreateNewEventWidget(),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          },
          backgroundColor: Color(0xFFFCCEA2),
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).white,
            size: 24.0,
          ),
        ),
        body: Stack(
          alignment: AlignmentDirectional(0.0, -1.0),
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 235.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        wrapWithModel(
                          model: _model.backgroundModel,
                          updateCallback: () => setState(() {}),
                          child: BackgroundWidget(
                            height:
                                functions.multiply(FFAppState().hourHeight, 23),
                          ),
                        ),
                        if (dateTimeFormat('d/M/y', FFAppState().selectedDay) ==
                            dateTimeFormat('d/M/y', getCurrentTimestamp))
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.nowLineModel,
                              updateCallback: () => setState(() {}),
                              child: NowLineWidget(
                                height: functions
                                    .nowHeight(FFAppState().hourHeight),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.eventsModel,
                            updateCallback: () => setState(() {}),
                            child: EventsWidget(
                              height: functions.multiply(
                                  FFAppState().hourHeight, 24),
                            ),
                          ).animateOnActionTrigger(
                            animationsMap['eventsOnActionTriggerAnimation']!,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 241.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x11000000),
                    offset: Offset(0.0, 6.0),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 45.0,
                              icon: Icon(
                                Icons.home_rounded,
                                color: Color(0xFF008199),
                                size: 26.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                            Text(
                              'Home',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 11.0,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  Icons.search_rounded,
                                  color: Color(0xFF008199),
                                  size: 26.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed('searchEvent');
                                },
                              ),
                            ),
                            Text(
                              'Search',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 11.0,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 45.0,
                              icon: Icon(
                                Icons.today_rounded,
                                color: Color(0xFF008199),
                                size: 27.0,
                              ),
                              onPressed: () async {
                                FFAppState().update(() {
                                  FFAppState().selectedDay =
                                      getCurrentTimestamp;
                                });
                                if (animationsMap[
                                        'eventsOnActionTriggerAnimation'] !=
                                    null) {
                                  await animationsMap[
                                          'eventsOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                              },
                            ),
                            Text(
                              'Today',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 11.0,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: SelectionArea(
                                child: Text(
                              getJsonField(
                                functions.dateInfo(FFAppState().selectedDay!),
                                r'''$.month''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0986AC),
                                    fontSize: 32.0,
                                  ),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.weekDaysModel,
                            updateCallback: () => setState(() {}),
                            child: WeekDaysWidget(
                              callback: () async {
                                FFAppState().update(() {
                                  FFAppState().selectedDay =
                                      FFAppState().selectedDayIndicator;
                                });
                                if (animationsMap[
                                        'eventsOnActionTriggerAnimation'] !=
                                    null) {
                                  await animationsMap[
                                          'eventsOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.85, 0.95),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY: 4.0,
                  ),
                  child: Container(
                    width: 100.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).overlayWhite,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: FaIcon(
                            FontAwesomeIcons.minus,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 10.0,
                          ),
                          onPressed: () async {
                            if (FFAppState().hourHeight > 100) {
                              FFAppState().update(() {
                                FFAppState().hourHeight =
                                    FFAppState().hourHeight + -10;
                              });
                            }
                          },
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 15.0,
                          ),
                          onPressed: () async {
                            if (FFAppState().hourHeight < 350) {
                              FFAppState().update(() {
                                FFAppState().hourHeight =
                                    FFAppState().hourHeight + 10;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
