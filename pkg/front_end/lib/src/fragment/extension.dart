// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'fragment.dart';

class ExtensionFragment extends DeclarationFragmentImpl implements Fragment {
  final ExtensionName extensionName;

  @override
  final int fileOffset;

  SourceExtensionBuilder? _builder;

  late final List<MetadataBuilder>? metadata;
  late final Modifiers modifiers;
  late final TypeBuilder onType;
  late final int startOffset;
  late final int nameOrExtensionOffset;
  late final int endOffset;

  ExtensionFragment({
    required String? name,
    required super.fileUri,
    required this.fileOffset,
    required super.typeParameters,
    required super.enclosingScope,
    required super.typeParameterScope,
    required super.nominalParameterNameSpace,
    required super.enclosingCompilationUnit,
  }) : extensionName = name != null
            ? new FixedExtensionName(name)
            : new UnnamedExtensionName();

  bool get isUnnamed => extensionName.isUnnamedExtension;

  @override
  // Coverage-ignore(suite): Not run.
  SourceExtensionBuilder get builder {
    assert(_builder != null, "Builder has not been computed for $this.");
    return _builder!;
  }

  void set builder(SourceExtensionBuilder value) {
    assert(_builder == null, "Builder has already been computed for $this.");
    _builder = value;
  }

  @override
  bool get isPatch => enclosingCompilationUnit.isPatch && modifiers.isAugment;

  @override
  String get name => extensionName.name;

  @override
  DeclarationFragmentKind get kind =>
      DeclarationFragmentKind.extensionDeclaration;

  @override
  String toString() => '$runtimeType($name,$fileUri,$fileOffset)';
}
