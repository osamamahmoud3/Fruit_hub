import 'package:fruits_hub/core/errors/custom_exception.dart';

class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.message);

  factory FirebaseFailure.fromCode(String code) {
    switch (code) {
      case 'user-not-found':
        throw CustomException(
            message: 'لا يوجد حساب مسجل لهذا البريد الإلكتروني.');
      case 'wrong-password':
        throw CustomException(message: 'كلمة المرور غير صحيحة.');
      case 'network-request-failed':
        throw CustomException(message: 'الانترنت غير متصل');
      case 'email-already-in-use':
        throw CustomException(message: 'البريد الإلكتروني مستخدم من قبل');
      case 'invalid-email':
        throw CustomException(message: 'البريد الإلكتروني غير صحيح');
      case 'weak-password':
        throw CustomException(message: 'كلمة المرور ضعيفة');
      default:
        throw CustomException(message: 'حدث خطأ ما');
    }
  }
}
