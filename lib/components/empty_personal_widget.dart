import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_personal_model.dart';
export 'empty_personal_model.dart';

class EmptyPersonalWidget extends StatefulWidget {
  const EmptyPersonalWidget({Key? key}) : super(key: key);

  @override
  _EmptyPersonalWidgetState createState() => _EmptyPersonalWidgetState();
}

class _EmptyPersonalWidgetState extends State<EmptyPersonalWidget> {
  late EmptyPersonalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPersonalModel());
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Image.asset(
            'assets/images/assignments_icon.png',
            width: 225.0,
            height: 210.0,
            fit: BoxFit.fitHeight,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 100.0),
          child: Text(
            'You don\'t have any upcoming personal tasks!',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
        ),
      ],
    );
  }
}
