import 'package:flutter/material.dart';
import 'package:levelup3_login/src/shared/widgets/shared_widgets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

bool showPassword = false;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          autovalidate: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text("Signup Page"),
              ),
              CustomTextFormField(
                icon: Icon(
                  Icons.person,
                  color: Colors.blue.shade300,
                ),
                labelText: "Nome",
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
                child: Text("Cadastrar"),
              ),
              SizedBox(
                height: 10.0,
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
                  Navigator.pushReplacementNamed(context, "/login");
                },
                child: Text("Entre"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
