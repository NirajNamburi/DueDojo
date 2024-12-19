import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_search_model.dart';
export 'empty_search_model.dart';

class EmptySearchWidget extends StatefulWidget {
  const EmptySearchWidget({Key? key}) : super(key: key);

  @override
  _EmptySearchWidgetState createState() => _EmptySearchWidgetState();
}

class _EmptySearchWidgetState extends State<EmptySearchWidget> {
  late EmptySearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptySearchModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Image.asset(
            'assets/images/emptySearchIcon.png',
            width: 225.0,
            height: 187.0,
            fit: BoxFit.fitHeight,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 100.0),
          child: Text(
            'You don\'t have any events to search!',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Poppins',
                  fontSize: 18.0,
                ),
          ),
        ),
      ],
    );
  }
}
