import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_event_alert_model.dart';
export 'edit_event_alert_model.dart';

class EditEventAlertWidget extends StatefulWidget {
  const EditEventAlertWidget({
    Key? key,
    required this.eventRef,
  }) : super(key: key);

  final DocumentReference? eventRef;

  @override
  _EditEventAlertWidgetState createState() => _EditEventAlertWidgetState();
}

class _EditEventAlertWidgetState extends State<EditEventAlertWidget> {
  late EditEventAlertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditEventAlertModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<EventsRecord>(
      stream: EventsRecord.getDocument(widget.eventRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        final containerEventsRecord = snapshot.data!;
        return Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.95,
            height: MediaQuery.sizeOf(context).height * 0.6,
            constraints: BoxConstraints(
              maxWidth: 400.0,
              maxHeight: 600.0,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFEAFAFF),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Edit Event',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF4B7691),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController1 ??=
                                  TextEditingController(
                                text: containerEventsRecord.title,
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintText: 'Event Name',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .overlayWhite,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .celestialBlue,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.textController1Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController2 ??=
                                TextEditingController(
                              text: containerEventsRecord.description,
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintText: 'Description',
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).overlayWhite,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .celestialBlue,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final _datePicked1Date = await showDatePicker(
                                context: context,
                                initialDate: containerEventsRecord.startTime!,
                                firstDate: containerEventsRecord.startTime!,
                                lastDate: DateTime(2050),
                              );

                              TimeOfDay? _datePicked1Time;
                              if (_datePicked1Date != null) {
                                _datePicked1Time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      containerEventsRecord.startTime!),
                                );
                              }

                              if (_datePicked1Date != null &&
                                  _datePicked1Time != null) {
                                setState(() {
                                  _model.datePicked1 = DateTime(
                                    _datePicked1Date.year,
                                    _datePicked1Date.month,
                                    _datePicked1Date.day,
                                    _datePicked1Time!.hour,
                                    _datePicked1Time.minute,
                                  );
                                });
                              }
                            },
                            text: 'Start Time',
                            options: FFButtonOptions(
                              width: 196.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF14BCCD),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        if (_model.datePicked1 != null)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                      'M/d h:mm a', _model.datePicked1),
                                  'Date Picked',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final _datePicked2Date = await showDatePicker(
                                context: context,
                                initialDate: containerEventsRecord.endTime!,
                                firstDate: containerEventsRecord.endTime!,
                                lastDate: DateTime(2050),
                              );

                              TimeOfDay? _datePicked2Time;
                              if (_datePicked2Date != null) {
                                _datePicked2Time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      containerEventsRecord.endTime!),
                                );
                              }

                              if (_datePicked2Date != null &&
                                  _datePicked2Time != null) {
                                setState(() {
                                  _model.datePicked2 = DateTime(
                                    _datePicked2Date.year,
                                    _datePicked2Date.month,
                                    _datePicked2Date.day,
                                    _datePicked2Time!.hour,
                                    _datePicked2Time.minute,
                                  );
                                });
                              }
                            },
                            text: 'End Time',
                            options: FFButtonOptions(
                              width: 196.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF14BCCD),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        if (_model.datePicked2 != null)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                      'M/d h:mm a', _model.datePicked2),
                                  'Date Picked',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 15.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final _colorPickedColor = await showFFColorPicker(
                                context,
                                currentColor: _model.colorPicked ??=
                                    FlutterFlowTheme.of(context).white,
                                showRecentColors: true,
                                allowOpacity: false,
                                textColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                secondaryTextColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                primaryButtonBackgroundColor: Color(0xFF58E9D6),
                                primaryButtonTextColor: Colors.white,
                                primaryButtonBorderColor: Colors.transparent,
                                displayAsBottomSheet: isMobileWidth(context),
                              );

                              if (_colorPickedColor != null) {
                                setState(() => _model.colorPicked =
                                    _colorPickedColor.withOpacity(1.0));
                              }
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              height: MediaQuery.sizeOf(context).height * 0.06,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  _model.colorPicked,
                                  FlutterFlowTheme.of(context).secondaryText,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Choose a color',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .customColor4,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterFlowRadioButton(
                          options: ['Test', 'Assignment', 'Personal'].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.radioButtonValueController ??=
                              FormFieldController<String>(
                                  containerEventsRecord.type),
                          optionHeight: 32.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 13.0,
                              ),
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          textPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.horizontal,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).celeste,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if ((_model.textController1.text != null &&
                                  _model.textController1.text != '') &&
                              (_model.datePicked1 != null) &&
                              (_model.datePicked2 != null) &&
                              (_model.radioButtonValue != null &&
                                  _model.radioButtonValue != '') &&
                              (_model.colorPicked != null)) {
                            if (functions.onSameDay(
                                    _model.datePicked1, _model.datePicked2) ==
                                true) {
                              if (functions.isDateTimeBefore(
                                      _model.datePicked1, _model.datePicked2) ==
                                  true) {
                                if (functions.isDateTimeBefore(
                                        _model.datePicked1,
                                        getCurrentTimestamp) ==
                                    false) {
                                  await widget.eventRef!
                                      .update(createEventsRecordData(
                                    title: _model.textController1.text,
                                    startTime: _model.datePicked1,
                                    endTime: _model.datePicked2,
                                    description: _model.textController2.text,
                                    color: _model.colorPicked,
                                    type: _model.radioButtonValue,
                                  ));
                                  _model.gotEvents =
                                      await actions.getEventsAction();
                                  FFAppState().update(() {
                                    FFAppState().events = _model.gotEvents!;
                                  });
                                  Navigator.pop(context);
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Error: Event Time'),
                                        content: Text(
                                            'The start time must be after the current time.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Got it!'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Error: Event Time'),
                                      content: Text(
                                          'The start time must be before the end time.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Got it!'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Event Time'),
                                    content: Text(
                                        'The start time and end time must be on the same day!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Got it!'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Empty Fields'),
                                  content: Text(
                                      'Please enter a value for all the fields!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          setState(() {});
                        },
                        text: 'Update Event',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF14BCCD),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
