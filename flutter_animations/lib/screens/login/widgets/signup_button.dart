import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      padding: EdgeInsets.only(top: 160.0),
      child: Text(
        "Não possui uma conta? Cadastre-se",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.white,
          fontSize: 12.0,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
