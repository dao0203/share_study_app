import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final emailSenderProvider = Provider((ref) {
  return EmailSender();
});

class EmailSender {
  Future<void> setupEmail() async {
    // Send email
    final Email email = Email(
      body: '',
      subject: '',
      recipients: ['sharestaformail@gmail.com'],
    );

    try {
      await FlutterEmailSender.send(email);
    } on Exception catch (e, stackTrace) {
      Logger().e(e);
      throw Exception(stackTrace);
    }
  }
}
