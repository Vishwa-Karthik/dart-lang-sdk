// Copyright (c) 2015, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analysis_server_plugin/src/correction/change_workspace.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/instrumentation/service.dart';

/// An object used to provide context information for Dart assist contributors.
///
/// Clients may not extend, implement or mix-in this class.
abstract class DartAssistContext {
  /// The instrumentation service used to report errors that prevent a fix from
  /// being composed.
  InstrumentationService get instrumentationService;

  /// The resolved library result in which an assist operates.
  ResolvedLibraryResult get libraryResult;

  /// The length of the selection.
  int get selectionLength;

  /// The starting offset of the selection.
  int get selectionOffset;

  /// The unit result in which an assist operates.
  ResolvedUnitResult get unitResult;

  /// The workspace in which an assist operates.
  ChangeWorkspace get workspace;
}
