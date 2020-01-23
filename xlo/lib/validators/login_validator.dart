import 'dart:async';

import 'package:xlo/blocs/login/field_state.dart';
import 'package:email_validator/email_validator.dart';

class LoginValidator {
	final StreamTransformer<String, FieldState> emailValidator =
		StreamTransformer<String, FieldState>.fromHandlers(
			handleData: (email, sink) {
				 if(email.isEmpty)
				    sink.add(FieldState(error: 'Campo obrigatório'));
				 else if(!EmailValidator.validate(email))
				    sink.add(FieldState(error: 'E-mail inválido'));
				 else
				 	sink.add(FieldState());
			}
		);

	final StreamTransformer<String, FieldState> passwordValidator =
		StreamTransformer<String, FieldState>.fromHandlers(
			handleData: (pass, sink) {
				if(pass.isEmpty)
					sink.add(FieldState(error: 'Campo obrigatório'));
				else
					sink.add(FieldState());
			}
		);
}