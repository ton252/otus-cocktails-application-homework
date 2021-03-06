// Autogenerated from Pigeon (v0.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/services.dart';

class MultiplyResult {
  int? result;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['result'] = result;
    return pigeonMap;
  }

  static MultiplyResult decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return MultiplyResult()
      ..result = pigeonMap['result'] as int?;
  }
}

class MultiplyRequest {
  int? multiplicand;
  int? multiplier;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['multiplicand'] = multiplicand;
    pigeonMap['multiplier'] = multiplier;
    return pigeonMap;
  }

  static MultiplyRequest decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return MultiplyRequest()
      ..multiplicand = pigeonMap['multiplicand'] as int?
      ..multiplier = pigeonMap['multiplier'] as int?;
  }
}

class MultiplyApi {
  /// Constructor for [MultiplyApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  MultiplyApi({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  Future<MultiplyResult> multiply(MultiplyRequest arg) async {
    final Object encoded = arg.encode();
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.MultiplyApi.multiply', const StandardMessageCodec(), binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(encoded) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return MultiplyResult.decode(replyMap['result']!);
    }
  }
}
