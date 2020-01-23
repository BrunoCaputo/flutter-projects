import 'package:flutter/material.dart';
import 'package:xlo/screens/signup/widgets/field_title.dart';
import 'package:xlo/screens/signup/widgets/password_field.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

	@override
	Widget build(BuildContext context) {
	    return Scaffold(
		    appBar: AppBar(
			    elevation: 0,
			    title: const Text('Cadastrar'),
		    ),
	        body: Form(
		        key: _formKey,
		        child: ListView(
			        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
			        children: <Widget>[
			        	const FieldTitle(
					        title: 'Apelido',
					        subtitle: 'Como aparecerá em seus anúncios.',
				        ),
				        TextFormField(
					        decoration: const InputDecoration(
						        border: OutlineInputBorder(),
						        hintText: 'Exemplo: Bruno P.'
					        ),
					        validator: (text){
					        	if(text.length < 6)
					        		return 'Apelido muito curto';
					        	return null;
					        },
				        ),
				        SizedBox(height: 26),
				        const FieldTitle(
					        title: 'E-mail',
					        subtitle: 'Enviaremos um e-mail de confirmação.',
				        ),
				        TextFormField(
					        decoration: const InputDecoration(
						        border: OutlineInputBorder(),
					        ),
					        validator: (text){
						        if(text.length < 6 || !text.contains('@'))
							        return 'E-mail inválido';
						        return null;
					        },
					        onSaved: (text) {

					        },
				        ),
				        SizedBox(height: 26),
				        const FieldTitle(
					        title: 'Senha',
					        subtitle: 'Use letras, números e caracteres especiais.',
				        ),
				        PasswordField(
					        onSaved: (text) {

					        },
				        ),
				        Container(
					        margin: const EdgeInsets.symmetric(vertical: 24),
					        height: 50,
					        child: RaisedButton(
						        color: Colors.pink,
						        disabledColor: Colors.pink.withAlpha(150),
						        child: Text(
							        'Cadastre-se',
							        style: TextStyle(
								        color: Colors.white,
								        fontSize: 16,
								        fontWeight: FontWeight.w600
							        ),
						        ),
						        onPressed: _signUp,
						        elevation: 0,
						        shape: RoundedRectangleBorder(
							        borderRadius: BorderRadius.circular(25)
						        )
					        ),
				        ),
			        ],
		        ),
		    ),
	    );
	}

	void _signUp() {
		if(_formKey.currentState.validate()) {
			_formKey.currentState.save();


		}
	}
}
