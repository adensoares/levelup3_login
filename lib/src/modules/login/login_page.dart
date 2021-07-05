import 'package:flutter/material.dart';
import 'package:levelup3_login/src/shared/widgets/shared_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool showPassword = false;

  @override
  void initState() {
    super.initState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text("Login Page"),
              ),
              CustomTextFormField(
                icon: Icon(
                  Icons.mail,
                  color: Colors.blue.shade300,
                ),
                labelText: "E-mail",
              ),
              CustomTextFormField(
                icon: Icon(
                  Icons.lock,
                  color: Colors.blue.shade300,
                ),
                labelText: "Senha",
                obscureText: showPassword,
                suffixIcon: ToggleVisibility(
                  visible: showPassword,
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              PrimaryButton(
                onPressed: () {},
                child: Text("Entrar"),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/signup");
                    },
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ),
                ],
              ),
              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      )),
                ),
                Text(
                  "Ou",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      )),
                ),
              ]),
              SizedBox(
                height: 10.0,
              ),
              SecondaryButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/signup");
                },
                child: Text("Cadastre-se"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
