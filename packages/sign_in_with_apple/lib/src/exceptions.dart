import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SignInWithAppleException implements Exception {
  factory SignInWithAppleException.fromPlatformException(
    PlatformException exception,
  ) {
    switch (exception.code) {
      case 'not-supported':
        return SignInWithAppleNotSupportedException(
          message: exception.message,
        );
      default:
        return UnknownSignInWithAppleException(
          platformException: exception,
        );
    }
  }
}

/// An [SignInWithAppleException] which will be thrown if a [PlatformException]
/// can't be mapped to a more specific [SignInWithAppleException].
class UnknownSignInWithAppleException extends PlatformException
    implements SignInWithAppleException {
  UnknownSignInWithAppleException({
    @required PlatformException platformException,
  }) : super(
          code: platformException.code,
          message: platformException.message,
          details: platformException.details,
        );

  @override
  String toString() =>
      'UnknownSignInWithAppleException($code, $message, $details)';
}

/// An [SignInWithAppleException] which will be thrown in case Sign in with Apple is not supported.
class SignInWithAppleNotSupportedException implements SignInWithAppleException {
  const SignInWithAppleNotSupportedException({
    @required this.message,
  }) : assert(message != null);

  /// A message specifying more details about why Sign in with Apple is not supported
  final String message;

  @override
  String toString() =>
      'SignInWithAppleNotSupportedException(message: $message)';
}
