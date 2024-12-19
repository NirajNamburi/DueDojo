import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/create_new_todo_widget.dart';
import '/components/empty_todo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'todos_model.dart';
export 'todos_model.dart';

class TodosWidget extends StatefulWidget {
  const TodosWidget({Key? key}) : super(key: key);

  @override
  _TodosWidgetState createState() => _TodosWidgetState();
}

class _TodosWidgetState extends State<TodosWidget> {
  late TodosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TodosModel());
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
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_model.unfocusNode),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: CreateNewTodoWidget(),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          },
          backgroundColor: Color(0xFFFCCEA2),
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).white,
            size: 28.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).accent2,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Todo List',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 30.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: StreamBuilder<List<TodosRecord>>(
                    stream: queryTodosRecord(
                      parent: currentUserReference,
                      queryBuilder: (todosRecord) =>
                          todosRecord.orderBy('timeCreated'),
                    ),
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
                      List<TodosRecord> listViewTodosRecordList =
                          snapshot.data!;
                      if (listViewTodosRecordList.isEmpty) {
                        return Center(
                          child: EmptyTodoWidget(),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewTodosRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewTodosRecord =
                              listViewTodosRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 10.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 5.0),
                                            child: Text(
                                              listViewTodosRecord.todoName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: ToggleIcon(
                                          onPressed: () async {
                                            await listViewTodosRecord.reference
                                                .update({
                                              'isCompleted':
                                                  !listViewTodosRecord
                                                      .isCompleted,
                                            });
                                            await listViewTodosRecord.reference
                                                .delete();
                                          },
                                          value:
                                              listViewTodosRecord.isCompleted,
                                          onIcon: Icon(
                                            Icons.check_circle,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 25.0,
                                          ),
                                          offIcon: Icon(
                                            Icons.radio_button_off,
                                            color: Color(0xFF2B343A),
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
