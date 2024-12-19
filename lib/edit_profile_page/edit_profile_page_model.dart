import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfilePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for firstNameEntry widget.
  TextEditingController? firstNameEntryController;
  String? Function(BuildContext, String?)? firstNameEntryControllerValidator;
  // State field(s) for lastNameEntry widget.
  TextEditingController? lastNameEntryController;
  String? Function(BuildContext, String?)? lastNameEntryControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    firstNameEntryController?.dispose();
    lastNameEntryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
