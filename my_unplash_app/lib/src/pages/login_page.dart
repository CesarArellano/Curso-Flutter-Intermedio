import 'package:flutter/material.dart';
import 'package:my_unplash_app/src/providers/login_provider.dart';
import 'package:my_unplash_app/src/themes/inputs_decorator.dart';


class LoginPage extends StatelessWidget {
  final _loginKey = GlobalKey<FormState>();

  final TextEditingController _inputAccountController = new TextEditingController();
  final TextEditingController _inputPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          height: 400,
          child: Card(
            elevation: 4.0,
            margin: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Inicio de sesión', style: TextStyle(fontSize: 35.0)),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Form(
                    key: _loginKey,
                    child: Column(
                      children: <Widget>[
                        _inputAccount(),
                        SizedBox(height: 20.0),
                        _inputPassword(),
                        SizedBox(height: 30.0),
                        _submitButton()
                      ],
                    ),
                  ),
                )
              ],
            )
          ),
        )
      )
    );
  }

  Widget _inputAccount() {
    return TextFormField(  
      controller: _inputAccountController,
      keyboardType: TextInputType.emailAddress,
      decoration: decorationInput(Icons.mail, 'Ingrese su email'),
      validator: (value) {
        if(value.isEmpty) {
          return 'Ingrese su email';
        }
        return null;
      },
    );
  }

  Widget _inputPassword() {
    return TextFormField(
      obscureText: false,
      controller: _inputPasswordController,
      keyboardType: TextInputType.name,
      decoration: decorationInput(Icons.lock, 'Ingrese su password'),
      validator: (value) {
        if(value.isEmpty) {
          return 'Ingrese su contraseña';
        }
        return null;
      },
    );
  }

  Widget _submitButton() {
    final loginProvider = new LoginProvider();
    return Container(
      width: 200,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green
        ),
        onPressed: () async {
          if(!_loginKey.currentState.validate()) {
            return;
          }
          await loginProvider.autenticacionLogin(_inputAccountController.text, _inputPasswordController.text);

        },
        child: Text('Entrar', style: TextStyle(fontSize: 18.0)),
      ),
    );
  }
}