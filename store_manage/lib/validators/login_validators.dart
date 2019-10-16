import 'dart:async';

class LoginValidators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains("@")) {
        sink.add(email);
      } else {
        sink.addError("Insira um email válido");
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (pass, sink) {
      if (pass.length > 4) {
        sink.add(pass);
      } else {
        sink.addError("Senha inválida! Deve conter pelo menos 4 caracteres");
      }
    },
  );
}
